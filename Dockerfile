# Stage 1: Build target (Compilarea cu Maven standard)
FROM maven:3.9.6-amazoncorretto-17 AS build
WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run target (Rularea cu Amazon Corretto - un JDK/SDK "normal" și stabil)
FROM amazoncorretto:17-alpine
WORKDIR /app

# Copiem artifactul generat
COPY --from=build /app/target/ShoppingTracker-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]