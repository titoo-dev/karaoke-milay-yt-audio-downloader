.PHONY: build run run-direct clean

IMAGE_NAME = pytube-downloader
CONTAINER_NAME = pytube-container

# Default values for arguments
YOUTUBE_URL ?=
OUTPUT_PATH ?= ./downloads

build:
	docker build \
		--build-arg YOUTUBE_URL=$(YOUTUBE_URL) \
		--build-arg OUTPUT_PATH=$(OUTPUT_PATH) \
		-t $(IMAGE_NAME) .

# Run using the built image
run: 
	docker run -it --rm --name $(CONTAINER_NAME) \
		-v $(PWD)/downloads:/app/downloads \
		$(IMAGE_NAME) \
		$(if $(YOUTUBE_URL),$(YOUTUBE_URL),) \
		$(if $(OUTPUT_PATH),--output $(OUTPUT_PATH),)

# Run directly without building
run-direct:
	@mkdir -p downloads
	docker run -it --rm \
		-v $(PWD):/app \
		-w /app \
		python:3.9-alpine \
		sh -c "pip install -r requirements.txt > /dev/null && python main.py \
		$(if $(YOUTUBE_URL),$(YOUTUBE_URL),) \
		$(if $(OUTPUT_PATH),--output $(OUTPUT_PATH),)"

clean:
	docker rm -f $(CONTAINER_NAME) || true
	docker rmi -f $(IMAGE_NAME) || true

# Create downloads directory if it doesn't exist
downloads:
	mkdir -p downloads
