#FROM gradle:8.5-jdk17-alpine as build
#COPY --chown=gradle:gradle . /home/gradle/src
#WORKDIR /home/gradle/src
#RUN gradle build --no-daemon
#FROM openjdk:17-jdk-slim
#EXPOSE 8080
#RUN mkdir /app
#COPY --from=build /home/gradle/src/build/libs/*.jar /app/spring-boot-application.jar
#ENTRYPOINT ["java", "-jar", "/app/spring-boot-application.jar"]

FROM eclipse-temurin:17-jre
WORKDIR /opt/app
EXPOSE 8080
COPY build/libs/*.jar app.jar
ENTRYPOINT ["java","-jar", "app.jar"]