FROM puppet/puppet-agent:7.11.0
RUN apt update
RUN apt install git -y
RUN /opt/puppetlabs/puppet/bin/gem install bundler --no-document
RUN /opt/puppetlabs/puppet/bin/gem install ra10ke -f --conservative --minimal-deps --no-document
RUN /opt/puppetlabs/puppet/bin/gem install rubygems-update -f --conservative --minimal-deps --no-document
COPY ./content/* /tmp/ 
VOLUME [ /code, /cache ]
WORKDIR /code
ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["-T"]
