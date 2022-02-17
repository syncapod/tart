# tart

Tart is Twirp for Dart.

Tart contains a [Dart library](tart) for Twirp as well as a [protoc plugin](protoc-gen-tart) to generate code.

For more information about Twirp please visit its official site: https://twitchtv.github.io/twirp/

## Getting Started

### Dependencies

This has only been build and tested on a Linux-based OS with Go version 1.17 and Dart 2.13
For specific versions please check out [pubspec.yaml](tart/pubspec.yaml) and [go.mod](protoc-gen-tart/go.mod)

protoc-gen-tart
* [Go](https://go.dev) \* required to compile protoc-gen-tart plugin
  * [protobuf](https://google.golang.org/protobuf) \* required by the protoc-gen-tart

Tart
* [Dart](https://dart.dev/)
  * [protobuf](https://pub.dev/packages/protobuf) \* required by your Dart project, but not the tart library
  * [http](https://pub.dev/packages/http) \* required by your Dart project

For more information on dependencies please refer to [tart/pubspec.yaml](tart/pubspec.yaml) and [protoc-gen-tart/go.mod](protoc-gen-tart/go.mod)

### Installing

## protoc-gen-tart

Download binary from release page and place into a folder included in $PATH

*OR*
\* With Go installed
1. Clone repo
2. cd tart/protoc-gen-tart
3. go install

## Tart Dart Library

Add the following packages to your Dart or Flutter project:

* [protobuf](https://pub.dev/packages/protobuf)
* [http](https://pub.dev/packages/http)
* [Tart](https://pub.dev/packages/tart)


### Generating code with protoc-gen-tart & protoc-gen-dart

Please refer to [protoc-gen-tart README.md](protoc-gen-tart/README.md)

## Help

Please create an issue for any errors or help executing the protoc plugin or using tart library / generated code.

## Authors

* [Sam Schwartz](https://github.com/sschwartz96)

## License

This project is licensed under the Apache 2.0 License

## Acknowledgments

* [titchtv/twirp](https://github.com/twitchtv/twirp)
