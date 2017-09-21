# docker-ssh

# Docker build options
docker build -t ssh .

# Docker run options
## Defined ssh user and password:
    docker run -ti -d -e SSH_USER=NewUser -e SSH_PASS=pass ssh

## Defined ssh user and ssh public key:
    docker run -ti -d -e SSH_USER=NewUser -e SSH_KEY="$(cat ~/.ssh/id_rsa.pub)" ssh

## Defined ssh root and without password - password will be root:
    docker run -ti -d -e SSH_USER=root  ssh
