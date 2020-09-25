FROM golang:1.15.2-alpine

# Build gomode
RUN \
    CGO_ENABLED=1 GOOS=linux GOARCH=386 go build -buildmode=c-shared -o build/base.so main.go