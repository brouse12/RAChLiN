# To build and deploy this image, see instructions in build_process.txt

FROM openjdk:11-jre-slim

COPY aisMessageListener-jar-with-dependencies.jar /usr/local/bin

WORKDIR usr/local/bin

EXPOSE 10110/tcp
EXPOSE 5432/tcp


CMD ["java", "-jar", "aisMessageListener-jar-with-dependencies.jar"]
