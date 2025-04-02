# Copy Maven wrapper and project files
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Make mvnw executable
RUN chmod +x mvnw

# Copy source code
COPY src/ src/

# Build the application
RUN ./mvnw clean install -DskipTests
# Run the Spring Boot app (replace 'your-app.jar' if needed)
CMD ["java", "-jar", "target/personalfinancetracker-0.0.1-SNAPSHOT.jar"]