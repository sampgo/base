$env:CGO_ENABLED=1; $env:GOOS="windows"; $env:GOARCH=386; go build -buildmode=c-shared -o build/base.dll main.go
