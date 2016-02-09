FROM iron/java:1.7
RUN apk update && apk upgrade && apk add unzip \
    &&  wget -q http://nilhcem.github.com/FakeSMTP/downloads/fakeSMTP-latest.zip \
    && unzip fakeSMTP-latest.zip -d /opt \
    && rm fakeSMTP-latest.zip \
    && rm -rf /var/cache/apk/*

EXPOSE 25
VOLUME ["/var/mail"]


CMD java -jar /opt/fakeSMTP-1.13.jar -s -b -o /var/mail
