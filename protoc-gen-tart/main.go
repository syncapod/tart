package main

import (
	"fmt"
	"os"
	"strings"
	"text/template"

	"google.golang.org/protobuf/compiler/protogen"
)

func main() {
	protogen.Options{}.Run(func(gen *protogen.Plugin) error {
		for _, f := range gen.Files {
			if !f.Generate || len(f.Services) == 0 {
				continue
			}
			generateFile(gen, f)
		}
		return nil
	})
}

type twirpFileData struct {
	GeneratedFileName string
	ProtoName         string
	Imports           []string
	Services          []*protogen.Service
}

func generateFile(gen *protogen.Plugin, file *protogen.File) (*protogen.GeneratedFile, error) {
	// setup data struct and extract values given from protoc
	data := twirpFileData{}
	data.GeneratedFileName = file.GeneratedFilenamePrefix
	nameSplit := strings.Split(file.Proto.GetName(), "/")
	data.ProtoName = strings.TrimSuffix(nameSplit[len(nameSplit)-1], ".proto")
	// data.Imports = file.Proto.Dependency
	data.Imports = make([]string, file.Desc.Imports().Len())
	for i := 0; i < file.Desc.Imports().Len(); i++ {
		data.Imports[i] = strings.ReplaceAll(
			file.Desc.Imports().Get(i).Path(),
			".proto", "",
		)
	}
	data.Services = make([]*protogen.Service, len(file.Services))
	copy(data.Services, file.Services)
	data.Services[0].Comments.Leading.String()

	// parse template
	protoTemplate, err := template.New(data.ProtoName).Funcs(funcMap).Parse(twirpTemplate)
	if err != nil {
		gen.Error(fmt.Errorf("error parsing template: %v", err))
		return nil, err
	}

	// setup the GenerateFile and execute the template
	filename := file.GeneratedFilenamePrefix + ".pbtwirp.dart"
	g := gen.NewGeneratedFile(filename, file.GoImportPath)
	err = protoTemplate.Execute(g, &data)
	if err != nil {
		gen.Error(fmt.Errorf("error executing template: %v", err))
		return nil, err
	}

	return g, nil
}

func getGenerateFilePath(f *protogen.File) string {
	split := strings.Split(f.GeneratedFilenamePrefix, "/")
	name := split[len(split)-1]
	return *f.Proto.Package + string(os.PathSeparator) + name
}

func lowerFirstLetter(s string) string {
	return strings.ToLower(string(s[0])) + s[1:]
}

func upperFirstLetter(s string) string {
	return strings.ToUpper(string(s[0])) + s[1:]
}

func removeNewLine(s string) string {
	return strings.ReplaceAll(s, "\n", "")
}

var funcMap = map[string]interface{}{
	"lowerFirstLetter": lowerFirstLetter,
	"upperFirstLetter": upperFirstLetter,
	"removeNewLine":    removeNewLine,
}

const twirpTemplate = `// Code generated by protoc-gen-tarp. DO NOT EDIT. {{ .GeneratedFileName }}

import 'dart:convert';
import 'dart:io';

import 'package:protobuf/protobuf.dart';
import 'package:tart/twirp.dart' as twirp;
import '{{ .ProtoName }}.pb.dart';
{{ range $import := .Imports -}}
import '{{ $import }}.pb.dart';
{{end }}

{{ range $service := .Services -}}
/{{ removeNewLine $service.Comments.Leading.String }}
abstract class {{ $service.GoName }} {
{{- range $method := $service.Methods }}
  /{{ removeNewLine $method.Comments.Leading.String }}
  Future<{{ $method.Output.Desc.Name }}> {{ lowerFirstLetter $method.GoName }}(twirp.Context ctx, {{ $method.Input.Desc.Name }} req);
{{- end }}
}
{{- end }}

{{- $protoName := .ProtoName }}

{{ range $service := .Services -}}
/{{ removeNewLine $service.Comments.Leading.String }}
class {{ $service.GoName }}JSONClient implements {{ $service.GoName }} {
  String baseUrl;
  String prefix;
  late twirp.ClientHooks hooks;
  late twirp.Interceptor interceptor;

  {{ $service.GoName }}JSONClient(this.baseUrl, this.prefix, {twirp.ClientHooks? hooks, twirp.Interceptor? interceptor}) {
    if (!baseUrl.endsWith('/')) baseUrl += '/';
    if (!prefix.endsWith('/')) prefix += '/';
    if (prefix.startsWith('/')) prefix = prefix.substring(1);

    this.hooks = hooks ?? twirp.ClientHooks();
    this.interceptor = interceptor ?? twirp.chainInterceptor([]);
  }
  {{- range $method := $service.Methods }}

  @override
  Future<{{ $method.Output.Desc.Name }}> {{ lowerFirstLetter $method.GoName }}(twirp.Context ctx, {{ $method.Input.Desc.Name }} req) async {
    ctx = twirp.withPackageName(ctx, '{{ $method.Desc.ParentFile.Package.Name }}');
    ctx = twirp.withServiceName(ctx, '{{ $service.GoName }}');
    ctx = twirp.withMethodName(ctx, '{{ $method.GoName }}');
    return interceptor((ctx, req) {
      return call{{ $method.GoName }}(ctx, req);
    })(ctx, req);
  }

  Future<{{ $method.Output.Desc.Name }}> call{{ $method.GoName }}(twirp.Context ctx, {{ $method.Input.Desc.Name }} req) async {
    try {
      Uri url = Uri.parse(baseUrl + prefix + '{{ $method.Parent.Desc.ParentFile.Package }}.{{ $service.GoName }}/{{ $method.GoName }}');
      final data = await doJSONRequest(ctx, url, hooks, req);
      final {{ $method.Output.Desc.Name }} res = {{ $method.Output.Desc.Name }}.create();
      res.mergeFromProto3Json(json.decode(data));
      return Future.value(res);
    } catch (e) {
      rethrow;
    }
  }
  {{- end }}
}

/{{ removeNewLine $service.Comments.Leading.String }}
class {{ $service.GoName }}ProtobufClient implements {{ $service.GoName }} {
  String baseUrl;
  String prefix;
  late twirp.ClientHooks hooks;
  late twirp.Interceptor interceptor;

  {{ $service.GoName }}ProtobufClient(this.baseUrl, this.prefix, {twirp.ClientHooks? hooks, twirp.Interceptor? interceptor}) {
    if (!baseUrl.endsWith('/')) baseUrl + '/';
    if (!prefix.endsWith('/')) baseUrl + '/';
    if (prefix.startsWith('/')) baseUrl = baseUrl.substring(1);

    this.hooks = hooks ?? twirp.ClientHooks();
    this.interceptor = interceptor ?? twirp.chainInterceptor([]);
  }
  {{- range $method := $service.Methods }}

  @override
  Future<{{ $method.Output.Desc.Name }}> {{ lowerFirstLetter $method.GoName }}(twirp.Context ctx, {{ $method.Input.Desc.Name }} req) async {
    ctx = twirp.withPackageName(ctx, '{{ $method.Desc.ParentFile.Package.Name }}');
    ctx = twirp.withServiceName(ctx, '{{ $service.GoName }}');
    ctx = twirp.withMethodName(ctx, '{{ $method.GoName }}');
    return interceptor((ctx, req) {
      return call{{ $method.GoName }}(ctx, req);
    })(ctx, req);
  }

  Future<{{ $method.Output.Desc.Name }}> call{{ $method.GoName }}(twirp.Context ctx, {{ $method.Input.Desc.Name }} req) async {
    try {
      Uri url = Uri.parse(baseUrl + prefix + '{{ $method.Parent.Desc.ParentFile.Package }}.{{ $service.GoName }}/{{ $method.GoName }}');
      final data = await doProtobufRequest(ctx, url, hooks, req);
      final {{ $method.Output.Desc.Name }} res = {{ $method.Output.Desc.Name }}.create();
      res.mergeFromBuffer(data);
      return Future.value(res);
    } catch (e) {
      rethrow;
    }
  }
  {{- end }}
}
{{- end }}

Future<List<int>> doProtobufRequest(twirp.Context ctx, Uri url, twirp.ClientHooks hooks, GeneratedMessage req) async {
  // setup http client
  HttpClient httpClient = HttpClient();

  try {
    // setup request
    HttpClientRequest httpClientRequest = await httpClient.post(url.host, url.port, url.path);

    // add required headers
    httpClientRequest.headers.add(HttpHeaders.acceptHeader, 'application/protobuf');
    httpClientRequest.headers.add(HttpHeaders.contentTypeHeader, 'application/protobuf');

    // add headers from context
    final headersFromCtxVal = twirp.retrieveHttpRequestHeaders(ctx);
    if (!headersFromCtxVal.hasError()) {
      headersFromCtxVal.getValue().forEach((key, value) {
        httpClientRequest.headers.add(key, value);
      });
    }

    // call onRequestPrepared hook for user to modify request
    hooks.onRequestPrepared(ctx, httpClientRequest);

    // send data
    httpClientRequest.add(req.writeToBuffer());

    // close request and receive response
    HttpClientResponse httpClientResponse = await httpClientRequest.close();

    // if success, parse and return response
    if (httpClientResponse.statusCode == 200) {
      List<int> data = <int>[];
      await httpClientResponse.listen((event) {
        data.addAll(event);
      }).asFuture();
      hooks.onResponseReceived(ctx);
      return Future.value(data);
    }

    // we received a twirp related error
    throw twirp.Error.fromJson(
        json.decode(await httpClientResponse.transform(utf8.decoder).join()));
  } on twirp.Error catch (twirpErr) {
    hooks.onError(ctx, twirpErr);
    rethrow;
  } catch (e) {
    // catch http connection error
    final twirpErr = twirp.Error.fromConnectionError(e.toString());
    hooks.onError(ctx, twirpErr);
    throw twirpErr;
  } finally {
    httpClient.close();
  }
}

Future<String> doJSONRequest(twirp.Context ctx, Uri url, twirp.ClientHooks hooks, GeneratedMessage req) async {
  // setup http client
  HttpClient httpClient = HttpClient();

  try {
    // setup request
    HttpClientRequest httpClientRequest = await httpClient.post(url.host, url.port, url.path);

    // add required headers
    httpClientRequest.headers.add(HttpHeaders.acceptHeader, 'application/json');
    httpClientRequest.headers.add(HttpHeaders.contentTypeHeader, 'application/json');

    // add headers from context
    final headersFromCtxVal = twirp.retrieveHttpRequestHeaders(ctx);
    if (!headersFromCtxVal.hasError()) {
      headersFromCtxVal.getValue().forEach((key, value) {
        httpClientRequest.headers.add(key, value);
      });
    }

    // call onRequestPrepared hook for user to modify request
    hooks.onRequestPrepared(ctx, httpClientRequest);

    // send data
    httpClientRequest.write(json.encode(req.toProto3Json()));

    // close request and receive response
    HttpClientResponse httpClientResponse = await httpClientRequest.close();

    // if success, parse and return response
    if (httpClientResponse.statusCode == 200) {
      final data = await httpClientResponse.transform(utf8.decoder).join().then((data) {
        hooks.onResponseReceived(ctx);
        // res.mergeFromProto3Json(json.decode(data));
        return data;
      });
      return Future.value(data);
    }

    // we received a twirp related error
    throw twirp.Error.fromJson(json.decode(await httpClientResponse.transform(utf8.decoder).join()));
  } on twirp.Error catch (twirpErr) {
    hooks.onError(ctx, twirpErr);
    rethrow;
  } catch (e) {
    // catch http connection error
    final twirpErr = twirp.Error.fromConnectionError(e.toString());
    hooks.onError(ctx, twirpErr);
    throw twirpErr;
  } finally {
    httpClient.close();
  }
}
`
