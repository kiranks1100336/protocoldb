#build docker image
FROM hc-us-east-aws-artifactory.cloud.health.ge.com/docker-imaging-devops-all/revo-jre-18:8u181
ARG VERSION=1.0.0
WORKDIR /protocoldb
COPY ./protocoldb-rest/target/protocoldb-rest-1.0.0.jar ./protocoldb.jar
EXPOSE 8080
#ENTRYPOINT ["java", "-Dspring.profiles.active=prod", "-jar", "protocoldb.jar"]
ENTRYPOINT ["java", "-Xms8m", "-Xmx40m", "-XX:+UseSerialGC", "-XX:CICompilerCount=2", "-Xss228k", "-XX:MaxRAM=32m", "-XX:NativeMemoryTracking=summary", "-XX:InitialCodeCacheSize=2m", "-XX:ReservedCodeCacheSize=8m","-XX:MaxDirectMemorySize=2m", "-XX:MaxMetaspaceSize=64m", "-XX:MinMetaspaceFreeRatio=20", "-XX:MaxMetaspaceFreeRatio=32", "-jar", "protocoldb.jar"]
