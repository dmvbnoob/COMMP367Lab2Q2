# Use an official Maven image as the base
FROM maven:3.8.6-openjdk-17 AS build

# Set the working directory
WORKDIR /app

# Copy the project files
COPY . .

# Build the Maven project
RUN mvn clean package

# Use a smaller JDK runtime image for final execution
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy the built JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose port 8080
EXPOSE 8080

# Command to run the app
CMD ["java", "-jar", "app.jar"]
