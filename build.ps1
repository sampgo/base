$env:CGO_CFLAGS_ALLOW=".*"; 
$env:CGO_ENABLED=1; 
$env:GOOS="windows"; 
$env:GOARCH=386;

go get -x github.com/sampgo/sampgo@5e54b15
go build -x -buildmode=c-shared -o build/base.dll main.go