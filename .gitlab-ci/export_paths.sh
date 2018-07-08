echo Extending PATH with binary paths...
export PATH=$(pwd)/binaries/texlive/bin/x86_64-linux:$PATH
export PATH=$(pwd)/binaries/cmake-installer/bin:$PATH
export PATH=$(pwd)/binaries/ninja-installer:$PATH
echo "Current PATH: $PATH"
