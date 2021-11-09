FROM ubuntu:18.04
MAINTAINER Segev Bar-On
RUN apt-get update
COPY *.war /warFile/.war
