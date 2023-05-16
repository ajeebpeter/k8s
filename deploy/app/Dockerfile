FROM openjdk:8-jdk-alpine
ARG buildver=0.5.0

COPY deploy/app/aws-opentelemetry-agent.jar /app/aws-opentelemetry-agent.jar
ENV JAVA_TOOL_OPTIONS "-javaagent:/app/aws-opentelemetry-agent.jar"


#RUN ./gradlew build -x test
COPY build/libs/springdemo-${buildver}.jar /app/springdemo.jar

ENV OTEL_RESOURCE_ATTRIBUTES "service.name=uc-eks-app1"
ENV OTEL_IMR_EXPORT_INTERVAL "10000"
#ENV OTEL_EXPORTER_OTLP_ENDPOINT "http://adot-collector-monitoring.other.svc.cluster.local:8888"
ENV OTEL_EXPORTER_OTLP_ENDPOINT "http://adot-collector-monitoring.other.svc.cluster.local:4318"
ENV OTEL_TRACES_SAMPLER=xray

ENTRYPOINT ["java", "-jar", "/app/springdemo.jar"]

