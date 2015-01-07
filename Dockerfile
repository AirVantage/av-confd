FROM airvantage/av-debian

MAINTAINER gmorice@sierrawireless.com

RUN echo "update system and install needed deps" \
    && apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install wget ca-certificates\
    && echo "install confd" \
    && wget -O /usr/local/bin/confd https://github.com/kelseyhightower/confd/releases/download/v0.6.3/confd-0.6.3-linux-amd64 \
    && chmod a+x /usr/local/bin/confd \
    && echo "add user" \
    && useradd -ms /bin/bash av-user \
    && cd && cp -R .bashrc .profile  /home/av-user
    && echo "clean up" \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER av-user

ENTRYPOINT ["/usr/local/bin/confd"]