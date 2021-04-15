$env:CGO_CFLAGS_ALLOW=".*"; 
$env:CGO_ENABLED=1; 
$env:GOOS="windows"; 
$env:GOARCH=386;

go get github.com/sampgo/sampgo@ac7b3a5
go build -buildmode=c-shared -o build/base.dll main.go