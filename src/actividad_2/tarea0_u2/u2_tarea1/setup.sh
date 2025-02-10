docker run --rm --tty --interactive \
  --volume=$(pwd):/app \
  --workdir=/app \
  ubuntu:18.04 /bin/bash

# Instalar Hugo y Make dentro del contenedor
echo "Actualizando el sistema e instalando Hugo y Make."
apt-get update && apt-get install -y hugo make

# Verificar las versiones de Hugo y Make
echo "Verificando versiones de Hugo y Make."
hugo version
make --version
make clean  ## Ejecutamos el comando make build
make build  ## Ejecutamos el comando make build

# Fin del script dentro del contenedor
echo "El script ha terminado. Revisa el error completo en stdout."