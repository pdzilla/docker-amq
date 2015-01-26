FROM java:7-jdk
MAINTAINER Patrick Davis <patrick_davis@cable.comcast.com>

#some variables to make it more generic, etc.
ENV ACTIVEMQ_VERSION=5.8.0
ENV ACTIVEMQ=apache-activemq-$ACTIVEMQ_VERSION
ENV ACTIVEMQ_HOME="/usr/local/activemq"
ENV PATH=$ACTIVEMQ_HOME/bin:$PATH

RUN mkdir -p "$ACTIVEMQ_HOME"

#add the amq tarball with its configs
ADD ./ $ACTIVEMQ_HOME

WORKDIR $ACTIVEMQ_HOME
RUN tar -xmf $ACTIVEMQ.tar.gz \
    && rm -f $ACTIVEMQ.tar.gz
    
EXPOSE 61616 8161
CMD $ACTIVEMQ_HOME/bin/activemq console