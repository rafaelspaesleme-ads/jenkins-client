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
echo '| 4 -> Cancelar |'
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
        docker build ./docker -t jenkins_docker
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