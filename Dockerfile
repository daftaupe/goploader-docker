FROM alpine
MAINTAINER Pierre-Alain TORET

RUN adduser -S goploader

ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
ADD conf.yml /home/goploader/conf/conf.yml
RUN mkdir /home/goploader/files && chown goploader: /home/goploader/files
RUN chown goploader: -R /home/goploader/conf

USER goploader
WORKDIR /home/goploader

RUN wget -qO- https://gpldr.in/releases/servers/server-standalone_amd64.tar.gz | tar xvz -C /home/goploader

VOLUME ["/home/goploader/files"]
EXPOSE 8080
CMD ["/usr/local/bin/run"]
