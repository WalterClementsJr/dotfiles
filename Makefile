IMAGE_NAME=fedoratest
CONTAINER_NAME=fedoratest
DOCKERFILE=Dockerfile.Fedora

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) -f $(DOCKERFILE) .

# Run the container
run:
	docker run \
	  --name $(CONTAINER_NAME) \
	  -d $(IMAGE_NAME) \
		# -v ./:/home/.local/share/chezmoi

# Stop the container
stop:
	docker stop $(CONTAINER_NAME)

# Remove the container and image
clean: stop
	docker rm $(CONTAINER_NAME)
	docker rmi $(IMAGE_NAME)

