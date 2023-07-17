# Dockerfile for Python service
FROM python:3.9

# Install dependencies
RUN pip install fastapi uvicorn

# Copy application code
COPY app /app

# Set working directory
WORKDIR /app

# Start the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
