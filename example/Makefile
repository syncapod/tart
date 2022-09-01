.PHONY: proto clean server client

client:
	cd ./client/; dart run

server:
	cd ./server/; go run .

proto:
	protoc --tart_out=paths=source_relative:./client/lib/protos \
		--dart_out=./client/lib/protos \
		-I ./protos/ \
		./protos/*.proto
	protoc --twirp_out=paths=source_relative:./server/protos \
		--go_out=paths=source_relative:./server/protos \
		-I ./protos/ \
		./protos/*.proto
	dart format .

clean:
	rm -f ./server/protos/*
	rm -f ./client/lib/protos/*
