# Docker-env

Note: This project is in **alpha** stage, meaning that it is usable, but will be going through constant updates.

## Usage
#### Preparations
1. Install Docker Desktop (version 3.0+)
    * For Windows, we recommend setting up WSL2.
1. Download this repository
2. Copy `Dockerfile`, `docker-compose.yml`, `docker-setup.sh` to your course projects folder.

#### First-time Setup
3. Run `docker-compose build mcit`. This will build the docker image whose `/vagrant` folder will be in sync with your current folder (course project folder)
4. Run `docker-compose run mcit bash`. You should now be inside your docker image, with current folder at `/vagrant`.
5. Run `ls` to make sure that `docker-setup.sh` is here.

#### All Future Log-ins
Just open your course projects folder, and run `docker-compose run mcit bash`.

## Known Issues
* Cannot have multiple terminal windows access the same running image. For multiple bash, you need to use `tmux` inside the docker image.

## Roadmap (for TAs)
* encapsulate docker-setup.sh in Dockerfile
* Pack this into a custom MCIT-595 image and host on dockerhub

## Resources
* [Docker Tutorial for Beginners - A Full DevOps Course on How to Run Applications in Containers](https://www.youtube.com/watch?v=fqMOX6JJhGo) is an 1-hour tutorial on Docker and Docker Compose by freeCodeCamp.
* [Docker Workshop](https://ipfs.io/ipfs/bafykbzacedzdnp34xeneqcaxcot7gvxpw55l5qrvgic6ma7tsoshfvpxvwev6?filename=Vincent%20Sesto%20et%20al.%20-%20The%20Docker%20Workshop_%20Learn%20how%20to%20use%20Docker%20containers%20effectively%20to%20speed%20up%20the%20development%20process-Packt%20Publishing%20%282020%29.pdf) is a reference manuel I use.
