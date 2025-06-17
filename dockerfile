# Use an official Maven image with Java 11
FROM maven:3.8.1-openjdk-11-slim AS build

# Set the working directory
WORKDIR /app

# Copy pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Final stage
FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the built jar from the build stage
COPY --from=build /app/target/inventory-management-0.0.1-SNAPSHOT.jar app.jar

# Expose the port the app runs on
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java","-jar","app.jar"]