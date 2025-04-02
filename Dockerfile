# Use OpenJDK 17 as base image
FROM eclipse-temurin:17-jdk-jammy

# Set working directory
WORKDIR /app

# Copy Maven wrapper and project files
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Make mvnw executable
RUN chmod +x mvnw

# Copy source code
COPY src/ src/

# Build the application
RUN ./mvnw clean install -DskipTests

# Run the Spring Boot app

CMD ["java", "-jar", "target/personalfinancetracker-0.0.1-SNAPSHOT.jar"]