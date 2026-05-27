# Stage 1: Compilarea proiectului
FROM maven:3.9.6-amazoncorretto-17 AS build
WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Rularea aplicației
FROM amazoncorretto:17-alpine-jdk
WORKDIR /app

COPY --from=build /app/target/ShoppingTracker-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]