# Base image
FROM python:3.9

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg2 \
    && rm -rf /var/lib/apt/lists/*

# Install PyTorch
RUN pip install torch torchvision

# Install Matplotlib
RUN pip install matplotlib

# Install AWS CLI
RUN pip install awscli

# Install Apache Kafka
RUN wget https://downloads.apache.org/kafka/2.8.0/kafka_2.13-2.8.0.tgz && \
    tar -xzf kafka_2.13-2.8.0.tgz && \
    mv kafka_2.13-2.8.0 /opt/kafka && \
    rm kafka_2.13-2.8.0.tgz

# Install PostgreSQL
RUN apt-get update && apt-get install -y postgresql postgresql-contrib

# Install FastAPI
RUN pip install fastapi uvicorn

# Install Grafana
RUN wget https://dl.grafana.com/oss/release/grafana_8.1.5_amd64.deb && \
    dpkg -i grafana_8.1.5_amd64.deb && \
    rm grafana_8.1.5_amd64.deb

# Install scikit-learn, NumPy, and pandas
RUN pip install scikit-learn numpy pandas

# Install Apache Airflow
RUN pip install apache-airflow

# Install Redis
RUN apt-get update && apt-get install -y redis-server

# Install Jupyter Notebook
RUN pip install jupyter

# Install Prometheus
RUN wget https://github.com/prometheus/prometheus/releases/download/v2.29.2/prometheus-2.29.2.linux-amd64.tar.gz && \
    tar -xzf prometheus-2.29.2.linux-amd64.tar.gz && \
    mv prometheus-2.29.2.linux-amd64 /opt/prometheus && \
    rm prometheus-2.29.2.linux-amd64.tar.gz

# Expose necessary ports
EXPOSE 8000 9092 5432 3000 6379 8888 9090

# Start necessary services
CMD service postgresql start && \
    service redis-server start && \
    service grafana-server start && \
    /opt/kafka/bin/zookeeper-server-start.sh -daemon /opt/kafka/config/zookeeper.properties && \
    /opt/kafka/bin/kafka-server-start.sh -daemon /opt/kafka/config/server.properties && \
    prometheus --config.file=/opt/prometheus/prometheus.yml
