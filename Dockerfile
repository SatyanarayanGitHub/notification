# Use an official Java runtime as the base image
FROM eclipse-temurin:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN chmod +x ./mvnw
RUN ./mvnw dependency:resolve


COPY src ./src
RUN ./mvnw -B -DskipTests clean package
RUN ls -l /app/target/

CMD ["./mvnw", "spring-boot:run"]


# Package the Spring Boot application





# Copy the build file (JAR) into the container
#COPY /app/target/notification-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your application runs on
#EXPOSE 8080

# Command to run the application
#ENTRYPOINT ["java", "-jar", "app.jar"]