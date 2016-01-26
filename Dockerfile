FROM ubuntu:14.04
MAINTAINER Ryan Xu
LABEL name=lab_cloud_base

# Add basic packages

RUN DEBIAN_FRONTEND=noninteractive dpkg --add-architecture i386 && apt-get update && apt-get -y install zip libc6:i386 bash bash-completion man-db && echo "dash dash/sh boolean false" | debconf-set-selections && dpkg-reconfigure -p critical dash

# Add packages mandatory to run Simics

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install libx11-6 libxext6 libxpm4 libelf1

# Cleanup

RUN DEBIAN_FRONTEND=noninteractive SUDO_FORCE_REMOVE=yes apt-get -y purge sudo