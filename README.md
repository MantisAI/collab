# Docker Environment Setup for AI Training

This repository provides a Docker-based environment to ensure that all participants have the necessary libraries installed for the AI sessions.

## Prerequisites

- Install Docker on your machine. You can follow the instructions based on your operating system:
  - [Docker for Windows](https://docs.docker.com/desktop/install/windows-install/)
  - [Docker for macOS](https://docs.docker.com/desktop/install/mac-install/)
  - [Docker for Linux](https://docs.docker.com/desktop/install/linux-install/)

## Build the Docker Image

1. Clone this repository to your local machine:

   ```bash
   git clone git@github.com:MantisAI/edifai.git
   cd edifai
   ```

2. Build the Docker image using the provided `Dockerfile`:


   For Windows:
   ```bash
   docker build -t my-jupyter-app -f Dockerfile.windows .
   ```

   For Unix:
   ```bash
   docker build -t my-jupyter-app .
   ```

   This command will create a Docker image named `my-jupyter-app` with all the necessary libraries pre-installed.

## Run the Docker Container

Once the image is built, you can run the container using the following command:

```bash
docker run -p 8888:8888 my-jupyter-app jupyter
```

This command will:

- Run the container to start Jupyter Notebook.
- Expose port 8888, which is commonly used for Jupyter notebooks (`-p 8888:8888`).

Copy the URL from the terminal output and open it in your browser to access the notebooks.

## Accessing the Container

To access the running container's shell (in case you need to install additional packages or run scripts), use:

```bash
docker exec -it <container-id> /bin/bash
```

You can get the `container-id` using:

```bash
docker ps
```

## Stopping the Container

To stop the running container, press `CTRL+C` in the terminal where the container is running, or use:

```bash
docker stop <container-id>
```
