# speedflux
Get results from the official [Speedtest CLI](https://www.speedtest.net/apps/cli) to InfluxDB.

# Installation
It's Docker

`docker pull iamslo/speedflux`

or 

`docker build . -t speedflux`

# Usage
specify the following (or use defaults) ENVIRONMENTAL variables

    INFLUXDB=http://10.42.0.101:8086
    HOST=local
    DB=speedtest
`docker run -e "INFLUXDB=http://influxdb" speedflux`

`docker run -e "INFLUXDB=http://influxdb" iamslo/speedflux`


[On docker hub](https://hub.docker.com/r/iamslo/speedflux)