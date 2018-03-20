FROM alpine
MAINTAINER Pierre-Alain TORET

RUN adduser -S goploader

USER goploader
WORKDIR /home/goploader

RUN mkdir /home/goploader/files && chown goploader: /home/goploader/files
RUN mkdir /home/goploader/conf && chown goploader: /home/goploader/conf

RUN wget -qO- https://gpldr.in/releases/servers/server-standalone_amd64.tar.gz | tar xvz -C /home/goploader

VOLUME ["/home/goploader/files", "/home/goploader/conf"]

EXPOSE 8080

CMD ["/home/goploader/goploader-server/server-standalone", "--conf=/home/goploader/conf/conf.yml"] 
