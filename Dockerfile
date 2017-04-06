FROM java:latest

WORKDIR /
COPY target/kissmanga-downloader-0.1.jar /kissmanga-downloader.jar
CMD ["java", "-jar", "/kissmanga-downloader.jar"]
