set CGO_CFLAGS_ALLOW=".*"
set CGO_LDFLAGS_ALLOW=".*"
set CGO_ENABLED=1
set GOOS=windows
set GOARCH=386
set GO111MODULE="on"

go get -x github.com/sampgo/sampgo
go build -x -buildmode=c-shared -o build/base.dll main.go