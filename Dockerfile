#
# Build stage
#
FROM maven:latest AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package


#
# Package stage
#
FROM openjdk:latest
ARG JAR_FILE=target/springSecurity.jar
COPY --from=build /home/app/target/springSecurity.jar /usr/local/lib/springSecurity.jar
EXPOSE 9000
ENTRYPOINT ["java","-jar","/usr/local/lib/springSecurity.jar"]