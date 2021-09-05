# Docker-env

## Usage

### Preparations

1. Install Docker Desktop (version 3.0+). For Windows, we recommend setting up WSL2.
1. Copy `docker-compose.yml` to your course projects folder.

### First-time Setup

#### For AMD64 Architecture

If your CPU is in AMD64 Architecture, in other words, if your CPU is not Apple M1, then do the following.

1. Run `docker pull cis548/docker-env` to will pull the docker image from Docker Hub repository.
1. Run `docker-compose run --rm mcit` to launch a Docker Container. 
  - `--rm` will clean up the container when it is finished.
  - The home directory `/home/cit595`, also known as `~`, is synchornized with the folder, where you put the `docker-compose.yml`, in your Host System.

You should now be inside your docker image, with current folder at `/homw/cit595`. You can use `pwd` to check.

You will log into the container as user `cit595` with password `mcit`. The password is used just in case you occationally need sudo previlege.

#### For ARM64 Architecture

If you are using a machine with Apple M1 CPU, you need to do a few extra steps to compile the docker image locally.

1. Copy `Dockerfile` to your course projects folder along with `docker-compose.yml`
2. Run `docker-compose build mcit` to compile the docker image locally.
3. Follow For AMD64 Architecture section, starting from the second step. In other words, run `docker-compose run --rm mcit` to launch a Docker Container.

### All Future Log-ins

Just open your course projects folder, and run `docker-compose run --rm mcit`.

### Multiple Sessions

To establish multiple sesssion to the same
 container, call `docker exec -it [container_id] bash` after booting the first window with `docker-compose run mcit`.

### About `docker-compose`

The following is the offical definition of docker-compose:

> Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration.

In CIT 595, we only use `docker-compose` to start one service which is your virtual machine. But `docker-compose` make the command consice and convient because we can predefine the configuration in `docker-compose.yml`.

If we use the bare-mental `docker` to start the container with same configuration, you have to run

```{bash}
docker run -it --rm -v `pwd`:/home/cit595 cis548/docker-env
```

If we use `docker-compose`, it runs container with `-it` by default. The volume mounting is configed in `docker-compose.yml` under `mcit` service. So we only need to call `docker-compose run --rm mcit`.

This is why we choose to use `docker-compose`, but the overhead is you have to prepare a `docker-compose.yml` file.

### Set up Vim

[Vim](https://www.vim.org/) is installed in the Docker container. We prepared a Vim configure file for students who would like to explore. The configuration file helps to install plug-ins and theme to make Vim more user-friendly and powerful. To use the configuration file, first use `docker-compose run --rm mcit` to get into the container. Then do the following two steps.

```{bash}
# Step 1: Download the configuration file from CIS548
wget -O .vimrc https://raw.githubusercontent.com/CIS548/gists/master/example_vimrc.txt

# Step2: Update Vim based on the configuration files
vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"
```

Now you are ready for Vim!

## (For TAs) Push Image to DockerHub

Docker Image in DockerHub [(Link)](https://hub.docker.com/r/cis548/docker-env)

- `docker build -t cis548/docker-env .`
- `docker push cis548/docker-env`

## Resources

- [Docker Tutorial for Beginners - A Full DevOps Course on How to Run Applications in Containers](https://www.youtube.com/watch?v=fqMOX6JJhGo)
- [Docker Workshop](https://ipfs.io/ipfs/bafykbzacedzdnp34xeneqcaxcot7gvxpw55l5qrvgic6ma7tsoshfvpxvwev6?filename=Vincent%20Sesto%20et%20al.%20-%20The%20Docker%20Workshop_%20Learn%20how%20to%20use%20Docker%20containers%20effectively%20to%20speed%20up%20the%20development%20process-Packt%20Publishing%20%282020%29.pdf)
- https://forums.docker.com/t/can-containers-be-run-with-it-in-compose/20090/2
