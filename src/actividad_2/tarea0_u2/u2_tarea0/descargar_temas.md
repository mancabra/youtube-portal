# Descargar temas sin uso de submódulos de Git

## Instrucciones

1. Posicionarse en el directorio del proyecto.

```bash
    cd src/actividad_2/tarea0_u2/u2_tarea0
```

2. Descargar el tema utilizando curl y descomprimirlo con unzip.

Usa el comando `curl` para descargar el archivo ZIP del tema directamente desde GitHub, y luego descomprímelo con `unzip`:

```zsh
    curl -L https://github.com/theNewDynamic/gohugo-theme-ananke/archive/refs/heads/master.zip -o ananke.zip
```
```zsh
    unzip ananke.zip
```

3. Renombrar la carpeta descargada.

Finalmente, renombra la carpeta descargada al nombre deseado para integrarla en tu proyecto Hugo:

```bash
    mv gohugo-theme-ananke-master dist/themes/ananke 
```
