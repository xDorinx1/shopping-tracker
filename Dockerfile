# Stage 1: Build target (Compilarea cu Maven)
FROM maven:3.9.6-amazoncorretto-17 AS build
WORKDIR /app

# Copiem pom.xml pentru a descărca dependențele
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copiem codul sursă și compilăm proiectul
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run target (Imaginea finală de rulare)
FROM amazoncorretto:17-alpine-jdk
WORKDIR /app

# FOARTE IMPORTANT: Copiem orice fișier .jar generat în folderul target și îl redenumim în app.jar
COPY --from=build /app/target/*.jar app.jar

# Expunem portul aplicației
EXPOSE 8080

# Comanda de pornire
ENTRYPOINT ["java", "-jar", "app.jar"]