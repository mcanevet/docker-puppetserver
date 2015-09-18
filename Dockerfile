FROM debian:wheezy

MAINTAINER mickael.canevet@camptocamp.com

ENV PUPPET_AGENT_VERSION 1.2.4-1wheezy
ENV PUPPETSERVER_VERSION 2.1.1-1puppetlabs1

RUN apt-get update \
  && apt-get install -y curl \
  && curl -O http://apt.puppetlabs.com/puppetlabs-release-pc1-wheezy.deb \
  && dpkg -i puppetlabs-release-pc1-wheezy.deb \
  && apt-get update \
  && apt-get install -y puppet-agent=$PUPPET_AGENT_VERSION puppetserver=$PUPPETSERVER_VERSION \
  && apt-get clean

ENTRYPOINT ["/opt/puppetlabs/server/bin/puppetserver", "foreground"]
