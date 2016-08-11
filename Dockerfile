FROM ubuntu:16.04
MAINTAINER duncan@kyan.com
ENV REFRESHED_AT 2016-08-11

# Install packages
RUN apt-get update && apt-get -y install wget \
  build-essential \
  libgdbm-dev \
  libncurses5-dev \
  libffi-dev \
  libyaml-dev \
  libreadline-dev \
  libpq-dev \
  nodejs \
  && rm -rf /var/lib/apt/lists/*

# Install Ruby-Install
RUN wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz \
  && tar -xzvf ruby-install-0.6.0.tar.gz \
  && cd ruby-install-0.6.0/ \
  && make install \
  && rm -rf /usr/local/src/*

# Setup app location
RUN mkdir -p /app
WORKDIR /app
