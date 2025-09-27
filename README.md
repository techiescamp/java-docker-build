# java-docker-build

This project packages a simple Spring Boot application into a Docker image using a multi-stage build. The first stage uses Maven to compile the code and create the executable JAR, and the second stage copies that artifact into a lightweight distroless Java 21 runtime image.

## Prerequisites

- Docker Desktop (or another Docker engine) running locally.
- Optional: Maven (only required if you prefer building locally outside the container).

## Build the container image

```sh
sudo docker build -t atulkamble/java-app .
```

The build uses the provided `Dockerfile` to compile the app and bundle it inside the final image tagged `atulkamble/java-app`.

## Run the container

```sh
docker run -d -p 8080:8080 atulkamble/java-app
```

Mapping port `8080` exposes the Spring Boot service on the host. After the container starts, you can reach the demo application at:

```
http://localhost:8080/
```

If you prefer to use a different host port, adjust the value before the colon (e.g. `-p 800:8080` makes it available at `http://localhost:800/`).

## Stop the container

To stop the running container, identify its container ID using `docker ps` and then run:

```sh
docker stop <container_id>
```
