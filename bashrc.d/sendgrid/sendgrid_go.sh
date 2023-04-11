
export GOPATH=$HOME/go
os="${uname}"
if [ "$os" == "Darwin" ] ; then
	export GOROOT=/usr/local/Cellar/go/1.2.1/libexec
fi
export PATH=$GOPATH/bin:$PATH
