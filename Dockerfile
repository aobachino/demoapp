FROM ubuntu:18.04
RUN apt-get update
RUN apt-get -y install openjdk-11-jdk
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
VOLUME /tmp
RUN mkdir /app
WORKDIR /app
# jar target
ENV JAR_TARGET "demoapp-0.0.1-SNAPSHOT.jar"
# set entrypoint to execute spring boot application
ENTRYPOINT ["sh","-c","java -jar -Dspring.profiles.active=docker target/${JAR_TARGET}"]
