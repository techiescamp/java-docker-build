# Build stage: compile the Spring Boot application
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /workspace
COPY java-app/pom.xml ./
COPY java-app/src ./src
RUN mvn -B -DskipTests package

# Runtime stage: copy the built jar into a distroless Java image
FROM gcr.io/distroless/java21-debian12
WORKDIR /app
COPY --from=build /workspace/target/*.jar app.jar
EXPOSE 8080
CMD ["-jar", "app.jar"]
