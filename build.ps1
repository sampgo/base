$env:CGO_CFLAGS_ALLOW=".*";
$env:CGO_LDFLAGS_ALLOW=".*";
$env:CGO_ENABLED=1; 
$env:GOOS="windows"; 
$env:GOARCH=386;
$env:GO111MODULE="on";

go get -x github.com/sampgo/sampgo
go build -x -buildmode=c-shared -o build/base.dll main.go