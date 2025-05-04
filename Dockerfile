#stage 1 - Build the jar using maven
FROM maven:3.8.3-openjdk-17 AS builder

WORKDIR /app

COPY . .

RUN mvn clean install -DskipTests=true

#stage 2- Rexecute jar file from above stage
FROM  openjdk:17-alpine

WORKDIR /app

COPY --from=builder /app/target/*.jar /app/expesapp.jar

CMD ["java","-jar","expesapp.jar"]
