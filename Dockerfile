FROM debian:wheezy

MAINTAINER mickael.canevet@camptocamp.com

ENV PUPPET_VERSION 3.8.2-1puppetlabs1
ENV PUPPETSERVER_VERSION 1.1.1-1puppetlabs1

RUN apt-get update \
  && apt-get install -y curl \
  && curl -O http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb \
  && dpkg -i puppetlabs-release-wheezy.deb \
  && apt-get update \
  && apt-get install -y puppet=$PUPPET_VERSION puppetserver=$PUPPETSERVER_VERSION \
  && apt-get clean

ENTRYPOINT ["/usr/bin/puppetserver", "foreground"]
