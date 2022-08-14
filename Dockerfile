FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu

RUN apt update
RUN apt upgrade
RUN wget https://github.com/ServerJars/updater/releases/download/v3.2.1/ServerJars.jar /opt/minecraft/ServerJars.jar
RUN echo "eula=true" > /opt/minecraft/eula.txt

COPY serverjars.properties /opt/minecraft/

EXPOSE 25565/tcp

VOLUME ["/opt/minecraft"]

CMD ["java", "-jar", "ServerJars.jar"]
