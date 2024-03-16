# v1:

#FROM gradle:8.5-jdk17-alpine as build
#COPY --chown=gradle:gradle . /home/gradle/src
#WORKDIR /home/gradle/src
#RUN gradle build --no-daemon
#FROM openjdk:17-jdk-slim
#EXPOSE 8080
#RUN mkdir /app
#COPY --from=build /home/gradle/src/build/libs/*.jar /app/spring-boot-application.jar
#ENTRYPOINT ["java", "-jar", "/app/spring-boot-application.jar"]


# v2:
#FROM eclipse-temurin:17.0.5_8-jre-focal as builder
#WORKDIR extracted
#ADD ./build/libs/*.jar app.jar
#RUN java -Djarmode=layertools -jar app.jar extractava", "-jar", "/app.jar"]
#
#FROM eclipse-temurin:17.0.5_8-jre-focal
#WORKDIR application
#COPY --from=builder extracted/dependencies/ ./
#COPY --from=builder extracted/spring-boot-loader/ ./
#COPY --from=builder extracted/snapshot-dependencies/ ./
#COPY --from=builder extracted/application/ ./
#EXPOSE 8080
#ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]

FROM eclipse-temurin:17-jre
WORKDIR /opt/app
EXPOSE 8080
COPY build/libs/*.jar app.jar
ENTRYPOINT ["java","-jar", "app.jar"]