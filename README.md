# REST API Template

This is the basic template that must be used when creating new REST APIs that will be placed into a microservices.

## Usage

Dowload the generator.sh file, change the file's permissions.
```
curl -O https://raw.githubusercontent.com/hugoluchessi/rest_api_template/master/script/generator.sh && chmod +x generator.sh
```

Run the script informing the arguments in the correct order.

`./generator.sh lead_api LeadAPI lead_api_project`

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

`$ sudo ./script/api-docker install`

### Start API Services

`$ ./script/api-docker s`

If everything went ok you will see a message saying that your server is ready and listening for requests.

From this point you can start making requests to the api endpoint.

### Commands available in the api-docker script

install: install docker and dependencies
reset: stop and remove all containers and drops all volumes within the compose
stop: stop and remove all containers within the compose
start, s: execute web aplication on main container
console, c: execute bash console on main container
exec, e [container_name] "command": ensure running infrastructure and execute a command in a given app container (ex: exec db \"psql -U postgres\").
build [env]: build docker image for a given environment
push [env]: push docker image for a given environment


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
