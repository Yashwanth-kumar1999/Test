# Build a JAR File
FROM maven:3.8.2-jdk-8-slim AS stage1
WORKDIR /home/app
COPY . /home/app/
RUN mvn -f /home/app/pom.xml clean package

# Create an Image
FROM openjdk:8-jdk-alpine
EXPOSE 8080
COPY --from=stage1 /home/app/target/hello-world-java.jar helloworld.war
ENTRYPOINT ["sh", "-c", "java -jar /helloworld.war"]
