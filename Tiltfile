docker_build(
    context='services/python',
    dockerfile='services/python/Dockerfile',
    ref='python-service:latest',
)

# Python service
k8s_yaml('services/python/python-service.yaml')
k8s_resource(workload='python-service-deployment', port_forwards=8080)