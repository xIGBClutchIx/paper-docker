FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu

RUN apt update -y
RUN apt install wget zip unzip tar -y
RUN apt upgrade -y

RUN wget -P /opt/minecraft/ https://github.com/ServerJars/updater/releases/download/v3.2.1/ServerJars.jar
RUN echo "eula=true" > /opt/minecraft/eula.txt

RUN mkdir -p /opt/minecraft
COPY serverjars.properties /opt/minecraft/

EXPOSE 25565/tcp

VOLUME ["/opt/minecraft"]

CMD ["java", "-jar", "ServerJars.jar"]
