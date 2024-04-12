FROM openjdk:8-jdk as builder
WORKDIR /build
COPY . .
RUN chmod +x ./gradlew
RUN ./gradlew build --info
RUN ls -la /build/build/libs/

FROM openjdk:8-jdk
WORKDIR /app
COPY --from=builder /build/build/libs/mylapstcpserver-0.3.1-a3287be.jar /app/
CMD ["java", "-jar", "mylapstcpserver-0.3.1-a3287be.jar"]
