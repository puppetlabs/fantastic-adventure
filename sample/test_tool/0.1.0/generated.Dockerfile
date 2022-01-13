FROM puppet/puppet-agent:5.5.0
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4528B6CD9E61EF26
COPY ./content/* /tmp/ 
VOLUME [ /code, /cache ]
WORKDIR /code
ENTRYPOINT ["/tmp/entrypoint.sh"]
