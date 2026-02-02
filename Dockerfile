################################
# Stage 1: Build (Maven) Base image in which JAVA and Maven dono hote hain
################################
FROM maven:3.9.6-eclipse-temurin-8 AS build

# Container ke andar working directory set karta hai /app
WORKDIR /app

# Pehle pom.xml copy (Docker cache ke liye)
COPY pom.xml .

# Dependencies download in offline mode
RUN mvn dependency:go-offline

# Ab source code copy
COPY src ./src

# WAR file build
RUN mvn clean package


################################
# Stage 2: Runtime (Tomcat)
################################
FROM tomcat:9.0-jdk8-temurin

# Default Tomcat apps remove (clean image)
RUN rm -rf /usr/local/tomcat/webapps/*

# Build stage se WAR file copy karo
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Tomcat port
EXPOSE 8080

# Tomcat start command
CMD ["catalina.sh", "run"]
