FROM debian:stretch

RUN apt-get update && apt-get install -y \
    ca-certificates \
    gnupg1 \
    apt-transport-https \
    dirmngr \
    curl

# Add ooklas key
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
RUN echo "deb https://ookla.bintray.com/debian stretch main" | tee  /etc/apt/sources.list.d/speedtest.list

RUN apt-get update && apt-get install -y \
    speedtest
COPY speed.sh /speed.sh

ENV INFLUXDB=http://10.42.0.101:8086
ENV HOST=local
ENV DB=speedtest

CMD ["/speed.sh"]
