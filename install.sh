#!/bin/bash
# Por haver propriedades do docker, recomenda-se que execute esse script como root.

# instalando e atualizando pacotes
apt-get update
apt install curl

# instalando docker
curl -sSL https://get.docker.com/ | sh

# Escolha de uma opcao de instalacao
echo 'Escolha uma opcao de instalacao:'
echo '|=======================|'
echo '|                       |'
echo '| 1 -> Via Docker shell |'
echo '| 2 -> Via Dockerfile   |'
echo '| 3 -> Via Script Shell |'
echo '| 4 -> Cancelar         |'
echo '|                       |'
echo '|=======================|'
echo '|=======================|'
echo '|                       |'
read resposta
case "$resposta" in
    1)
        curl -sSL 'https://github.com/rafaelspaesleme-ads/jenkins-client/raw/master/docker/scripts-sh/docker.sh' | bash
    ;;
    2)
        docker build -t 'jenkins_docker' ./docker
        docker run 'jenkins_docker'
        IP_DOCKER_BUGADO=$(docker inspect ic_server | grep '"IPAddress"' | head -n 1)
        IP_DOCKER_BUG="$(echo $IP_DOCKER_BUGADO | cut -d':' -f2)"
        IP_DOCKER="$(echo $IP_DOCKER_BUG | cut -d',' -f1)"
        google-chrome http://$IP_DOCKER:8080
    ;;
    3)
        curl -sSL 'https://github.com/rafaelspaesleme-ads/jenkins-client/raw/master/src/scripts-sh/jenkins.sh' | bash
    ;;
    4)
        echo "Cancelando..."
    ;;
    *)
        echo "Opção inválida"
    ;;
esac