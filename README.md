# YouTube Audio Downloader

A simple Docker containerized application to download audio from YouTube videos using pytubefix.

## Prerequisites

- Docker installed on your system
- Make (optional, but recommended)

## Usage

### Using Make

1. Build the Docker image:
```bash
make build
```

2. Run the container:
```bash
make run
```

3. To clean up (remove container and image):
```bash
make clean
```

### Without Make

1. Build the Docker image:
```bash
docker build -t pytube-downloader .
```

2. Run the container:
```bash
docker run -v $(pwd):/app pytube-downloader
```

## Configuration

Edit the `main.py` file to change the YouTube video URL or modify other download settings.
