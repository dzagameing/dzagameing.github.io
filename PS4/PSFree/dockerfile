# Use official Python 3.10 slim image
FROM python:3.10-slim

# Set working directory
WORKDIR /PSFree

# Copy all files/folders from current directory into /PSFree
COPY . /PSFree

# Install required packages
RUN pip install --no-cache-dir rich

# Expose your app port (adjust if your app uses a different port)
EXPOSE 52721

# Run the python server
CMD ["python", "serve.py"]