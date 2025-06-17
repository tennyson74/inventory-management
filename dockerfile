# Use an official Maven image with OpenJDK 15
FROM maven:3.8.1-openjdk-15-slim AS build

# Set the working directory
WORKDIR /app

# Copy pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the application with Docker profile
RUN mvn clean package -Pdocker -DskipTests

# Final stage
FROM openjdk:15-jdk-slim

WORKDIR /app

# Copy the built jar from the build stage
COPY --from=build /app/target/inventory-management-0.0.1-SNAPSHOT.jar app.jar

# Expose the port the app runs on
EXPOSE 8080

# Set the active profile
ENV SPRING_PROFILES_ACTIVE=docker

# Run the jar file
ENTRYPOINT ["java","-jar","app.jar"]