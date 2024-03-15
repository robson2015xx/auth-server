FROM openjdk:latest
ARG JAR_FILE=target/springSecurity.jar
ADD ${JAR_FILE} springSecurity.jar
ENTRYPOINT ["java","-jar","/springSecurity.jar"]
EXPOSE 9000