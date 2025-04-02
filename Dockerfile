# Use OpenJDK 17 (official Java image)
FROM eclipse-temurin:17-jdk-jammy

# Set working directory inside the container
WORKDIR /app

# Copy Maven wrapper and project files (for caching)
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Copy source code
COPY src/ src/

# Build the application (creates a JAR file)
RUN ./mvnw clean install -DskipTests

# Run the Spring Boot app (replace 'your-app.jar' if needed)
CMD ["java", "-jar", "target/personalfinancetracker-0.0.1-SNAPSHOT.jar"]