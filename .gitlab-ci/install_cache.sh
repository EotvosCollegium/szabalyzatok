# if the 'binaries' folder exist skip
if [ -d binaries ]; then
  exit 0
fi
echo "Installing context..."

mkdir binaries

apt-get update -qq
apt-get install -y -qq xzdec wget unzip

# getting and installing cmake
wget -P binaries -q https://cmake.org/files/v3.12/cmake-3.12.0-rc2-Linux-x86_64.tar.gz
mkdir binaries/cmake-installer
tar xf binaries/cmake-3.12.0-rc2-Linux-x86_64.tar.gz -C binaries/cmake-installer --strip-components=1
rm binaries/cmake-3.12.0-rc2-Linux-x86_64.tar.gz

# getting and installing ninja build
wget -P binaries -q https://github.com/ninja-build/ninja/releases/download/v1.8.2/ninja-linux.zip
unzip binaries/ninja-linux.zip -d binaries/ninja-installer
rm binaries/ninja-linux.zip

#################


# getting texlive
wget -P binaries -q http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
mkdir binaries/texlive-installer
tar xf binaries/install-tl-unx.tar.gz -C binaries/texlive-installer --strip-components=1
rm binaries/install-tl-unx.tar.gz


# creating texlive.profile for installing
cd binaries
sed 's?CURRENT_DIRECTORY?'`pwd`'?' ../.gitlab-ci/texlive.profile.template > ../.gitlab-ci/texlive.profile
mkdir texlive
texlive-installer/install-tl -profile=../.gitlab-ci/texlive.profile
cd ..

source .gitlab-ci/export_paths.sh

tlmgr init-usertree
# tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet
tlmgr install $(cat texlive-packages.txt)