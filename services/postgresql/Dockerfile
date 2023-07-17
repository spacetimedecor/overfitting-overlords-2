# Use the official PostgreSQL image as the base image
FROM postgres:latest

# Set environment variables for PostgreSQL
ENV POSTGRES_USER admin
ENV POSTGRES_PASSWORD mypassword
ENV POSTGRES_DB mydatabase

# Copy custom initialization scripts to the container
COPY init.sql /docker-entrypoint-initdb.d/

# Expose the default PostgreSQL port
EXPOSE 5432
