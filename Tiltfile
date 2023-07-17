docker_build(
    context='services/python',
    dockerfile='services/python/Dockerfile',
    ref='python-service:latest',
)

# Python service
k8s_yaml('services/python/python-service.yaml')
k8s_resource(workload='python-service-deployment', port_forwards=8080)

# PostgreSQL database
docker_build(
    context='services/postgresql',
    dockerfile='services/postgresql/Dockerfile',
    ref='postgresql-service:latest',
)

k8s_yaml('services/postgresql/postgresql-service.yaml')
k8s_resource(workload='postgresql-service-deployment', port_forwards=5432)
