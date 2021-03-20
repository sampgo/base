set CGO_CFLAGS_ALLOW=".*"
set CGO_ENABLED=1
set GOOS=windows
set GOARCH=386

go get github.com/sampgo/sampgo@a7e3a4c
go build -buildmode=c-shared -o build/base.dll main.go