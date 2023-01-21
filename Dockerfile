FROM openjdk:11
COPY target/gestao-escala-backend-0.0.2-SNAPSHOT.jar gestao-escala-backend-0.0.2-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/gestao-escala-backend-0.0.2-SNAPSHOT.jar"]