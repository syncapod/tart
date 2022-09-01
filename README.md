# tart

Tart is Twirp for Dart.

Tart includes:
1. [protoc-gen-tart](protoc-gen-tart), a protoc plugin to generate *.pbtwirp.dart files
2. [Tart](tart) the Dart library for the generated *.pbtwirp.dart files

Tart is compatible with [Twirp Wire Protocol (v7)](https://twitchtv.github.io/twirp/docs/spec_v7.html).

For more information about Twirp please visit its official site: https://twitchtv.github.io/twirp/

## Getting Started

### protoc-gen-tart

1. Download binary from release page and place into a folder included in $PATH<br>
or
2. (with go installed) `go install github.com/syncapod/tart/protoc-gen-tart@latest`

### Tart Dart Library

Add the following packages to your Dart or Flutter project:

* [protobuf](https://pub.dev/packages/protobuf)
* [http](https://pub.dev/packages/http)
* [Tart](https://pub.dev/packages/tart)

pubspec.yaml example:
```
dependencies: 
  http: ^0.13.4
  protobuf: ^2.0.1
  tart: ^0.3.0
```

## Compiling

This has only been built and tested on a Linux-based OS with Go version 1.17 and Dart 2.13
For specific versions please check out [pubspec.yaml](tart/pubspec.yaml) and [go.mod](protoc-gen-tart/go.mod)

#### Dependencies
protoc-gen-tart
* [Go](https://go.dev) \* required to compile protoc-gen-tart plugin
  * [protobuf](https://google.golang.org/protobuf) \* required by the protoc-gen-tart

Tart
* [Dart](https://dart.dev/)
  * [protobuf](https://pub.dev/packages/protobuf) \* required by your Dart project, but not the tart library
  * [http](https://pub.dev/packages/http) \* required by your Dart project

For more information on dependencies please refer to [tart/pubspec.yaml](tart/pubspec.yaml) and [protoc-gen-tart/go.mod](protoc-gen-tart/go.mod)


## Generating code with protoc-gen-tart & protoc-gen-dart

Please refer to [protoc-gen-tart README.md](protoc-gen-tart/README.md)

## Help

Please create an issue for any errors or help executing the protoc plugin or using tart library / generated code.

## Contributors

* [sschwartz96](https://github.com/sschwartz96)
* [CGA1123](https://github.com/CGA1123)

## License

This project is licensed under the Apache 2.0 License

## Acknowledgments

* [twitchtv/twirp](https://github.com/twitchtv/twirp)
