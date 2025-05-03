FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y wget unzip openjdk-11-jre && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/spotfire

RUN wget -q https://example.com/spotfire-statistics-services-14.4.1.zip -O sss.zip && \
    unzip sss.zip && \
    rm sss.zip

ENV SPOTFIRE_HOME=/opt/spotfire

EXPOSE 8080

CMD ["bash", "-c", "$SPOTFIRE_HOME/start-sss.sh"]
