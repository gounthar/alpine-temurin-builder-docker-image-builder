FROM alpine

RUN apk update && apk upgrade && apk add git bash freetype perl openssl openjdk8 autoconf alpine-sdk zip \
    libxtst-dev libxt-dev libxrender-dev libxrandr-dev cups-dev fontconfig-dev alsa-lib-dev linux-headers \
    apache-ant && \
    ln -s /usr/bin/keytool /bin/keytool

# ccache seems to be a bad idea with JDK compilation, so let's get rid of it
# export PATH="/usr/lib/ccache/bin:$PATH"
ENV JAVA_HOME=/usr/lib/jvm/default-jvm/

RUN git clone https://github.com/adoptium/temurin-build.git && cd temurin-build/ 

## && ./makejdk-any-platform.sh -p $(grep -c processor /proc/cpuinfo) -F jdk11u

ENTRYPOINT ["/temurin-build/makejdk-any-platform.sh"]
