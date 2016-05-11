# RD REST API Template

This is the basic template that must be used when creating new REST APIs that will be placed into a microservices.

## Usage

Dowload the generator.sh file, change the file's permissions.
```
$ curl -O https://raw.githubusercontent.com/ResultadosDigitais/rest_api_template/master/generator.sh && chmod +x generator.sh
```

Run the script informing the arguments in the correct order.

`$ ./generator.sh lead_api LeadAPI lead_api_project`

They are respectively:

- api name to be used during project bootstrapping
- module name to be used by Ruby files
- path where the project must be cloned into. If not informed the folder will be named using the api name parameter.

# Environment variables

Change ENV configuration on docker-compose.yml and circle.yml if applicable.

# Running your API project using docker - Linux

The following steps will guide all the way through the steps that will install docker and its dependencies and bootstrap the basic structure to get the project up and running usind docker containers.

### Install Docker and Dependencies

If you already have installed docke engine and docker compose previously you can skip this part and go to the next step. If it is not the case please jut run the following command in a terminal window:

`$ sudo ./rd-docker install`

### Start API Services

`$ ./script/docker start`

Process executed by this command:
- Create the docker database volume for data persistence
- Start Web server
- Start Postgres Database service container
- Link both services

If everything went ok you will see a message saying that your server is ready and listening for requests.

From this point you can start making requests to the api endpoint.

### Commands available in the rd-docker script

#### ./rd-docker reset
Use carefully. This command will erase all docker volumes consequently you database data will be lost

#### ./rd-docker volumes
List all docker volumes

#### ./rd-docker ps
List all running containers

#### ./rd-docker ip - OSX only
Display the docker-machine current ip

#### ./rd-docker up
Start all services and keep logging in your terminal

#### ./rd-docker start
Start all services and open a TTY session in the API container service

#### ./rd-docker stop
Stop all docker containers and services

#### ./rd-docker console [container_id]
Connect to the specified container using a TTY session

#### ./rd-docker exec [container_id] [command]
Runs the specified command into the specified container

#### ./rd-docker build [env] [tag]
Builds the docker image based on the env argument and tags it using the tag argument.
The available values for the env argument are: "dev" or "prod".

#### ./rd-docker push
Push the docker image to the docker hub repository. Only allowed people are able to perform this operation and that requires a docker hub login session available.

### Other useful commands when using docker
* Removes all docker containers from your machine:
    - ```sudo docker rm $(sudo docker ps -a -q)```
* Removes all docker images from your machine:
    - ```sudo docker rmi $(sudo docker images -q)```
* Stops the docker daemon:
    - ```sudo service docker stop```
* Starts the docker daemon:
    - ```sudo service docker start```
    - 
# Create GitHub repository
Ask a GitHub administrator to create the repository for your API

# Create DockerHub repository
Ask a DockerHub administrator to create the repository for your API

# Enable Build on Circle CI
Ask a GitHub and Circle CI administrator to enable buld for your repository

## Reminder
Ask the person you asked to enable the build to set env variables:
* DOCKER_EMAIL
* DOCKER_PASS
* DOCKER_USER

Without it, the build will not be concluded
