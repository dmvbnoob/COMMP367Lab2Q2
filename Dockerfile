FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package
FROM eclipse-temurin:17-jdk
WORKDIR /app
FROM tomcat:9.0
WORKDIR /usr/local/tomcat/webapps/
COPY target/COMP367Lab2Q2.war ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]