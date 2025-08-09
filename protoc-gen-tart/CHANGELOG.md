# Changelog

## [0.6.0] - 2025-08-08

- protoc-gen-tart: updated dependencies
- protoc-gen-tart: added await before interceptor calls to support async interceptors
- tart library: updated dependencies

## [0.5.1] - 2023-08-22

- tart library: extend Dart SDK range to <4.0.0

## 0.5.0

- tart library: upgrade to use http v1.1.0

## 0.4.0

- protoc-gen-tart: now supports async methods on client hooks; onRequestPrepared, onResponseReceived, onError
- tart library: now supports async methods on client hooks; onRequestPrepared, onResponseReceived, onError

## 0.3.0

- protoc-gen-tart:  now supports relative import paths of generated files
- protoc-gen-tart:  fixes issues where code would not compile if .proto source files did not have comments
- tart library:	    updates doc comments in library

## 0.2.0

- Remove dart:io dependency for web compatibility
- Add http dart package

## 0.1.0

- Initial Release
