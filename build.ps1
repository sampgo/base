$env:CGO_CFLAGS_ALLOW=".*";
$env:CGO_LDFLAGS_ALLOW=".*";
$env:CGO_ENABLED="1";
$env:GOOS="windows"; 
$env:GOARCH="386";

$DLLWRAP_OUTPUT = "build/dllwrap_base.dll";
$LD_OUTPUT = "build/gcc_base.dll";
$GO_OUTPUT = "build/base.dll";

go get github.com/sampgo/sampgo@a193026
go build -buildmode=c-shared -o $GO_OUTPUT main.go

C:\TDM-GCC-32\bin\dllwrap --def plugin.def -o $DLLWRAP_OUTPUT $GO_OUTPUT
C:\TDM-GCC-32\bin\ld -Wl","--kill-at -o $LD_OUTPUT $GO_OUTPUT

<#
    Useful articles:

    - https://www.willus.com/mingw/yongweiwu_stdcall.html
    - https://github.com/Zeex/sampgdk/blob/master/plugins/ufs/ufs-plugin.cpp
    - https://www.codeproject.com/Articles/84461/MinGW-Static-and-Dynamic-Libraries
#>