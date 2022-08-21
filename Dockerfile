FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu

WORKDIR /opt/game/

RUN apt update -y
RUN apt install wget zip unzip tar -y
RUN apt upgrade -y

RUN wget https://github.com/ServerJars/updater/releases/download/v3.2.1/ServerJars.jar
RUN chmod +x ServerJars.jar
RUN echo "eula=true" > eula.txt

COPY serverjars.properties .

EXPOSE 25565/tcp

VOLUME ["/opt/game"]

CMD ["java", "-jar", "ServerJars.jar"]
