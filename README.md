apk update && apk upgrade -y && apk add git bash freetype perl openssl openjdk11 autoconf alpine-sdk zip libxtst-dev libxt-dev libxrender-dev libxrandr-dev cups-dev fontconfig-dev alsa-lib-dev apk add linux-headers
# not a good idea ccache
# export PATH="/usr/lib/ccache/bin:$PATH"
ln -s /usr/bin/keytool /bin/keytool
export JAVA_HOME=/usr/lib/jvm/default-jvm/
git clone https://github.com/adoptium/temurin-build.git
cd temurin-build/
./makejdk-any-platform.sh -p $(grep -c processor /proc/cpuinfo) -F jdk11u
