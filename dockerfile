# Use Amazon Corretto (AWS's OpenJDK distribution)
FROM maven:3.8.1-amazoncorretto-15 AS build

# Set the working directory
WORKDIR /app

# Copy pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Final stage
FROM amazoncorretto:15-alpine

WORKDIR /app

# Copy the built jar from the build stage
COPY --from=build /app/target/inventory-management-0.0.1-SNAPSHOT.jar app.jar

# Expose the port the app runs on
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java","-jar","app.jar"]