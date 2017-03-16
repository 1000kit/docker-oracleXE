# Dockerized h2 database

This repository contains `Oracle Database` image from

https://github.com/oracle/docker-images/tree/master/OracleDatabase/dockerfiles/11.2.0.2

### Installed versions:

 Latest oracle XE DB version

### Availability

The `Dockerfile` is available in the `master` branch and is built in the Docker HUB as `1000kit/oraclexe:latest`.

### Info

- start script: `/u01/app/oracle/runOracle.sh`
- Volume `/u01/app/oracle/oradata/oradata` can be used for persistance
- Ports: `8080` and `1521` are exposed

## Build Image

Take a Dockerfile and build with the default arguments:

~~~~
$ docker build -t 1000kit/oracleXE .
~~~~

or simply use the `build.sh` script

## run

### docker
~~~~
$ docker run -it 1000kit/oraclexe
~~~~
Alternative using persistent data:
~~~~
$ docker run -v <host_local_datadir>:/u01/app/oracle/oradata/oradata -it 1000kit/oraclexe
~~~~
### docker-compose
Download `docker-compose.yml` from github. If you need persistence uncomment the volume settings in `docker-compose.yml` file.

~~~~
$ docker-compose up
~~~~
