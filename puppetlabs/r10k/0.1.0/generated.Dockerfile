FROM puppet/puppet-agent:7.11.0
RUN /opt/puppetlabs/puppet/bin/gem install bundler --no-document
RUN /opt/puppetlabs/puppet/bin/gem install r10k -f --conservative --minimal-deps --no-document
COPY ./content/* /tmp/ 
VOLUME [ /code, /cache ]
WORKDIR /code
ENTRYPOINT [ "/opt/puppetlabs/puppet/bin/r10k"]
