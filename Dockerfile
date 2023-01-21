FROM openjdk:11
VOLUME /tmp
EXPOSE 8080
ARG JAR_FILE=target/gestao-escala-backend-0.0.2-SNAPSHOT.jar
ADD ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]