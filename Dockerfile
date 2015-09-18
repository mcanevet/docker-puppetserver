FROM mcanevet/puppet-agent:1.2.4-1

MAINTAINER mickael.canevet@camptocamp.com

ENV PUPPETSERVER_VERSION 2.1.1-1puppetlabs1

RUN apt-get update \
  && apt-get install -y puppetserver=$PUPPETSERVER_VERSION \
  && apt-get clean

ENTRYPOINT ["/opt/puppetlabs/server/bin/puppetserver", "foreground"]
