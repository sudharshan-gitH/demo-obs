FROM python:3.11-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

ENV OTEL_SERVICE_NAME=demo-app
ENV OTEL_EXPORTER_OTLP_ENDPOINT=http://otel-collector.observability:4317
ENV OTEL_TRACES_EXPORTER=otlp
ENV OTEL_METRICS_EXPORTER=otlp
ENV OTEL_LOGS_EXPORTER=otlp

CMD ["opentelemetry-instrument", "python", "app.py"]
