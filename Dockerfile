FROM python:3.9-alpine

# Set build arguments with defaults
ARG YOUTUBE_URL=""
ARG OUTPUT_PATH="/app/downloads"

# Set environment variables from build arguments
ENV YOUTUBE_URL=$YOUTUBE_URL
ENV OUTPUT_PATH=$OUTPUT_PATH

WORKDIR /app

# Create downloads directory
RUN mkdir -p /app/downloads

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Use entrypoint script to handle arguments
ENTRYPOINT ["python", "main.py"]
CMD ["--help"]
