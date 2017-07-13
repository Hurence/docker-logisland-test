FROM hurence/spark

ARG hdp_version=2.4
ARG logisland_version=0.10.1
ARG spark_version=2.1.1

MAINTAINER hurence

VOLUME ["/logisland"]



RUN cd /tmp; wget https://github.com/Hurence/logisland/releases/download/v${logisland_version}/logisland-${logisland_version}-bin-hdp${hdp_version}.tar.gz; 
RUN cd /tmp; \
	tar -xzf logisland-*.tar.gz; \
	rm -f /tmp/*.gz; \
	mv logisland-* /opt
RUN cd /opt && ln -s logisland-${logisland_version} logisland
ENV LOGISLAND_HOME /opt/logisland
ENV PATH $PATH:$LOGISLAND_HOME/bin
WORKDIR $LOGISLAND_HOME/

RUN echo 'spark.driver.host	localhost'  >> /opt/spark/conf/spark-defaults.conf