FROM drydock/u14:prod

ADD . /tmp
RUN chmod 1777 /tmp
RUN /tmp/install.sh && rm -rf /tmp
