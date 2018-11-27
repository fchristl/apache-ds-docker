FROM openjdk:12-jdk-alpine
RUN apk add wget bash
RUN cd /tmp && \
	wget https://www-us.apache.org/dist//directory/apacheds/dist/2.0.0.AM25/apacheds-2.0.0.AM25.zip && \
	unzip apacheds-2.0.0.AM25.zip && \
	mv apacheds-2.0.0.AM25 /var/lib/apacheds
RUN keytool -genkey -keyalg "RSA" -dname "cn=`hostname`, ou=ApacheDS, o=ASF, c=US"  -alias `hostname` -keystore /etc/ads.ks -storepass secret -validity 7300
COPY apacheds_foreground.sh /var/lib/apacheds/bin/apacheds_foreground.sh
CMD (rm /var/lib/apacheds/instances/default/.dirservice.lock || true) && /bin/bash /var/lib/apacheds/bin/apacheds_foreground.sh start

