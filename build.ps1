$env:CGO_CFLAGS_ALLOW=".*"; 
$env:CGO_ENABLED=1; 
$env:GOOS="windows"; 
$env:GOARCH=386;

go get github.com/sampgo/sampgo@49093e3
go build -buildmode=c-shared -o build/base.dll main.go