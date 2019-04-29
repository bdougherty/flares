export GO111MODULE=on

run:
	go run cmd/flaredns/*.go vlct.io

install:
	go install ./cmd/flaredns/.

build:
	go build -o flaredns cmd/flaredns/*.go
	rm flaredns

dep:
	go mod init || :
	go mod tidy
	go mod verify
	go mod download
	go mod vendor

clean:
	rm -rf vendor/ go.mod go.sum

docker:
	docker build -t lfaoro/flares .
	docker push lfaoro/flares

.PHONY: install
