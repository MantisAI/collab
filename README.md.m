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

   ```bash
   docker build -t ai-env .
   ```

   This command will create a Docker image named `ai-env` with all the necessary libraries pre-installed.

## Run the Docker Container

Once the image is built, you can run the container using the following command:

```bash
docker run -it -p 8888:8888 -v $(pwd):/usr/src/app ai-env
```

This command will:

- Run the container in interactive mode (`-it`).
- Map the current directory on your host machine to `/usr/src/app` in the container (`-v $(pwd):/usr/src/app`).
- Expose port 8888, which is commonly used for Jupyter notebooks (`-p 8888:8888`).

### Using Jupyter Notebooks

If you want to run Jupyter notebooks inside the container, follow these steps:

1. Start the container:

   ```bash
   docker run -it -p 8888:8888 -v $(pwd):/usr/src/app ai-env
   ```

2. Inside the container, start Jupyter:

   ```bash
   jupyter notebook --ip=0.0.0.0 --no-browser --allow-root
   ```

3. Copy the URL from the terminal output and open it in your browser to access the notebooks.

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
