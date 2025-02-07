# Makefile for Maven build

# Define variables
MAVEN_CMD = mvn

# Targets
.PHONY: build clean install deploy

# Default target
build:
	@echo "Building the project..."
	$(MAVEN_CMD) clean install

# Clean target
clean:
	@echo "Cleaning the project..."
	$(MAVEN_CMD) clean

# Install target
install:
	@echo "Installing the project..."
	$(MAVEN_CMD) install

# Deploy target (optional)
deploy:
	@echo "Deploying the project..."
	$(MAVEN_CMD) deploy

