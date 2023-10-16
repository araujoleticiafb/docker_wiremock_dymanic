FROM wiremock/wiremock:latest

# copy all projects
COPY reqres/stubs /home/wiremock
COPY swagger/stubs /home/wiremock

ADD start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh", "--global-response-templating", "--disable-gzip", "--verbose"]
