FROM openjdk:8-jre-alpine

ENV WIREMOCK_VERSION 2.27.2

RUN apk add --update openssl

# fix "No Server ALPNProcessors" when using https
RUN apk add --update libc6-compat
RUN ln -s /lib/libc.musl-x86_64.so.1 /lib/ld-linux-x86-64.so.2

# grab su-exec for easy step-down from root
# and bash
RUN apk add --no-cache 'su-exec>=0.2' bash

# grab wiremock standalone jar
RUN mkdir -p /var/wiremock/lib/ \
  && wget https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-jre8-standalone/$WIREMOCK_VERSION/wiremock-jre8-standalone-$WIREMOCK_VERSION.jar \
    -O /var/wiremock/lib/wiremock-jre8-standalone.jar

WORKDIR /home/wiremock

# copy all projects
COPY reqres/stubs /home/wiremock
COPY swagger/stubs /home/wiremock

ADD start.sh /
RUN chmod +x /start.sh

VOLUME /home/wiremock
EXPOSE 8080 8443

CMD ["/start.sh"]