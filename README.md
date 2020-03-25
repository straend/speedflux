# speedflux
Get results from the official [Speedtest CLI](https://www.speedtest.net/apps/cli) to InfluxDB.

# Installation
It's Docker
    
`docker build . -t speedflux`

# Usage
specify the following (or use defaults) ENVIRONMENTAL variables

    INFLUXDB=http://10.42.0.101:8086
    HOST=local
    DB=speedtest
`docker run -e "INFLUXDB=http://influxdb" speedflux`
