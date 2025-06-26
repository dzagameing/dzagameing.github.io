#!/bin/bash

# Check if python3 is installed
if ! command -v python3 &> /dev/null
then
    echo "python3 could not be found. Please install Python 3."
    exit 1
fi

# Create virtual environment if it doesn't exist
if [ ! -d ".venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv .venv
fi

# Activate virtual environment
source .venv/bin/activate

# Check pip version and upgrade if needed
PIP_VERSION=$(pip show pip 2>/dev/null | grep Version | awk '{print $2}')
if [ -z "$PIP_VERSION" ]; then
    echo "pip not found, installing pip..."
    python3 -m ensurepip --upgrade
else
    echo "Upgrading pip..."
    pip install --upgrade pip
fi

# Check if rich is installed, install if not
if pip show rich > /dev/null 2>&1; then
    echo "rich is already installed."
else
    echo "Installing rich..."
    pip install rich
fi

# Run the server
python serve.py