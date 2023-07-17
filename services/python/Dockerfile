# Dockerfile for Python service
FROM python:3.9

# Install dependencies
RUN pip install fastapi uvicorn

# Copy application code
COPY app /app

# Set working directory
WORKDIR /app

# Expose port
EXPOSE 8000

# Start the application
CMD ["uvicorn", "main:app", "--host", "127.0.0.1", "--port", "8000"]
