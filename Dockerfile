FROM openjdk:17-slim

WORKDIR /app

COPY . .

EXPOSE :8080

CMD ["java," -jar, "my application.jar"]