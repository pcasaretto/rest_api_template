# RD REST API Template
Initial Template for an Rest Api

## Usage
First of all, replace all "API_NAME_HERE" for the api's real name

Seconds, replace "CREATE_VOLUMES_HERE" for a script to create possibly useful docker volumes (if needed)

Replace the module RestApiTemplate for the api's main module.

Change ENV configuration on docker-compose.yml if applicable.

# Instruções para subir a Api Dockerizada no Linux

O processo a seguir descreve os passos a serem seguidos para ter a aplicação RDStation rodando e respondendo em http://localhost com os seguintes serviços rodando isoladamente em containers:
* Postgresql
* Web Server

### Executar o seguinte comando para subir todos os serviços:
* ```$ ./script/docker start```

Ao término das inicializações abra seu navegador e aponte para o endereço http://localhost. Se tudo correu bem você o status do request será 200.

### Comandos disponíveis no script "docker"

#### install
Instala o docker e docker compose

#### reset
Remove todos os containers e volumes

#### volumes
Lista os volumes existentes

#### ps
Lista os containers existentes

#### ip
Retorna o ip do host do docker

#### up
Levanta infra do compose deixando os stdin sendo monitorados no console

#### start
Levanta infra do compose deixando aberta uma sessão TTY no container "web"

#### stop
Derruba a infra do compose

#### console
*Parametro: container_id (valor padrão: "web")*

Abre uma sessão TTY no console do container passado como parametro


#### exec
*Parametro1: container_id*
*Parametro2: command*

Executa o commando passado no container.

### Comandos úteis quando se trabalha com build de imagens e execução de containers
* Remove todos os containers:
    - ```sudo docker rm $(sudo docker ps -a -q)```
* Remove todas as imagens da máquina local:
    - ```sudo docker rmi $(sudo docker images -q)```
* Para o docker daemon:
    - ```sudo service docker stop```
* Inicia o docker daemon:
    - ```sudo service docker start```
* Para todos os serviços levantados pelo comando ```$ sudo docker-compose up```
    - ```sudo docker-compose down```
