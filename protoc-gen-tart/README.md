# protoc-gen-tart

protoc-gen-tart relies on files generated by protoc-gen-dart, please install both.

## Install

### protoc-gen-tart

1. Download binary from release page and place into a folder included in $PATH<br>
or
2. (with go installed) `go install github.com/syncapod/tart/protoc-gen-tart@latest`

### protoc-gen-dart

[Click here for installation instructions](https://github.com/google/protobuf.dart/tree/master/protoc_plugin)

## Run
```
protoc --tart_out=paths=source_relative:./PATH_TO_GENERATE \
	--dart_out=./PATH_TO_GENERATE \
	-I ./PROTO_DIR \
	./PROTO_DIR/*.proto
```
I would also recommend adding `dart format path/to/generated/files` as the generate code does not come out properly formatted
## Example

[Example](../example/)
