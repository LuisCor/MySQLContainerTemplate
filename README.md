# **Instruções**

## O que é?

Cria um container docker com uma base de dados SQL.

Ficheiros:
 * **docker-compose.yml** - Contem os argumentos necessários para a inicialização do container, abrindo a porta *3306* do container para se poder aceder à bd

 * **Dockerfile** - Contem os passos e acções a ser tomadas na inicialização do container. Define a password para a conta _root_ e copia e executa o ficheiro setup.sql dentro do container.

 * **setup.sql** - Sequencia de instruções que cria uma bd chamada *db_vetClinic* e nessa base de dados adiciona um utilizador *server* para ser usado pelo servidor, com password *serverpassword*


Variáveis em cada ficheiro:
 * **docker-compose.yml** 
    * image: Nome que a nova imagem, baseada na original de MySQL, vai ter
    * container_name: Nome do container

 * **Dockerfile**
    * FROM mysql:latest as ... : Nome do container se não overwriten (É no docker-compose)
    * ENV MYSQL_ROOT_PASSWORD : Password do utilizador _root_ do MySQL

 * **setup.sql**
    * CREATE DATABASE : Nome da base de dados criada
    * CREATE USER ('_username_'@'%') IDENTIFIED BY '_password_' : Cria um utilizador no MySQL, o caso default cria um utilizador para ser usado pelo servidor.


## Como utilizar?

Para iniciar o container:

    docker-compose up

Para ficar a correr no background, libertando a shell:

    docker-compose up -d

Verificar que o container iniciou:

    docker ps

Para aceder dentro do container para interagir com a bd:

    docker exec -it db_vet bash

_db_vet_ é o nome default do container

Para interagir com o MySQL:

    mysql -p

Este comando abre a sessão na bd sql do utilizador _root_ , a flag _-p_ é a requisição para apresentar a password. **A password é definida no Dockerfile.**

Sair do MySQL ou do container:

    exit

Terminar o container:

    docker-compose down


**Atenção** com este comando o container é parado e apagado, para simplemente parar o container usar:

    docker stop container_name

Para iniciar o container parado sem que seja refeito:

    docker start container_name