FROM openjdk:12

EXPOSE 8080

COPY ./target/*.jar /usr/app/
WORKDIR /usr/app

ENTRYPOINT ["java", "-jar", "*.jar"]
