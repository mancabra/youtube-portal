#!/bin/bash

## Para ejecutar este comando en necesario estar en la carpeta en la que se encuentran los
## archivos setup.sh, makefile y hugo.toml.

## Para poder hacer este archivo unejecutable se debe escribir el siguinete comando en terminal:
##       $ chmod +x setup.sh

## Para ejecutar este archivo e debe escribir el siguinete comando en terminal:
##       $ ./setup.sh 

docker run --rm --tty --interactive \
  --volume=$(pwd):/app \
  --workdir=/app \
  ubuntu:18.04 /bin/bash

## Se indica la versión de ubuntu que tendra el contenedor de doecker.
## Se indica que se abrira un shell interactivo del contenedor
## Se establece el volumen del contenedor y se indica el path en la que se abrira el shell.

echo "Actualizando el sistema e instalando Hugo y Make."
apt-get update && apt-get install -y hugo make  ## Instalar Hugo y Make dentro del contenedor

echo "Verificando versiones de Hugo y Make."
hugo version    ## Verificar las versiones de Hugo
make --version  ## Verificar las versiones de Hugo

make clean  ## Ejecutamos el comando make build
make build  ## Ejecutamos el comando make build

echo "El script ha terminado. Revisa el error completo en stdout."
