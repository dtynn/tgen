all:

init:
	rm -f .git/hooks/pre-push
	ln -s ../../githooks/pre-push .git/hooks/pre-push
	go get github.com/samuel/go-thrift/parser
	go get github.com/spf13/cobra/cobra
	go get github.com/jteeuwen/go-bindata/...

test: buildTpl
	go test ./...

test-go-gen:
	rm -rf thriftgotest
	go build
	./tgen gen -l go -i example/golang/Enum.thrift -o ../../../
	./tgen gen -l go -i example/golang/Const.thrift -o ../../../
	./tgen gen -l go -i example/golang/IncludeEnum.thrift -o ../../../
	./tgen gen -l go -i example/golang/Types.thrift -o ../../../
	./tgen gen -l go -i example/golang/Service.thrift -o ../../../
	./tgen gen -l go -i example/golang/SimpleArguments.thrift -o ../../../
	./tgen gen -l go -i example/golang/UnusedInclude.thrift -o ../../../
	go install github.com/ezbuy/tgen/thriftgotest/...

buildTpl:
	go-bindata -o tmpl/bindata.go -ignore bindata.go -pkg tmpl tmpl/*

debugTpl:
	go-bindata -o tmpl/bindata.go -ignore bindata.go -pkg tmpl -debug tmpl/*

genjava: buildTpl
	go build
	./tgen gen -l java -i example/java/ShipForMe.thrift -o ./javaoutput

genjavajsonrpc: buildTpl
	go build
	./tgen gen -l java -m jsonrpc -i example/java/ShipForMe.thrift -o ./javaoutputjsonrpc

genjavarest: buildTpl
	go build
	./tgen gen -l java -m rest -i example/java/ShipForMe.thrift -o ./javaoutputrest

gen-swift-rest: buildTpl
	rm -rf output-swift-rest
	go run main.go gen -l swift -m rest -i example/swift/Example.thrift -o ./output-swift-rest

gen-swift-jsonrpc: buildTpl
	rm -rf output-swift-jsonrpc
	go run main.go gen -l swift -m jsonrpc -i example/swift/Example.thrift -o ./output-swift-jsonrpc

gen-swift: gen-swift-rest gen-swift-jsonrpc

clean:
	go clean
	rm -rf ./output-swift-rest
	rm -rf javaoutputrest
	rm -rf javaoutputjsonrpc

build:
	go clean
	go build
	open .
