# youtube-portal

## Objetivo

Este proyecto tiene como objetivo mostrar casos de uso en los que una mentalidad de DevOps aporta valor a un
proyecto de software al automatizarlo, lo que reduce la cantidad de trabajo manual y aumenta la velocidad de
desarrollo. Se centra en por qué la automatización es útil y ayuda a acelerar el ciclo de vida del desarrollo.

## Requisitos previos

1. Se debe contar con un repositorio de github previamente congifurafo y listo para recibir
código en sus distintas ramas.

En este caso se ha configurado el siguiente repositorio:

- [youtube-portal.](https://github.com/mancabra/youtube-portal)

2. Se deberá crear un proyecto de `hugo` en el path `src/actividad_2/tarea0_u2/u2_tarea0/dist` para accceder al
path deberá ejecutar el comando:

```bash
    cd src/actividad_2/tarea0_u2/u2_tarea0
```
mientas que para crear el proyecto de hugo se debe ejecutar la instrucción:

```hugo
    hugo new site dist
```

3. Debido a que es requisito omitir el uso de `submódulos de Git` es necesario descargar directamente el tema soliciado,
para descargar este o cualquier otro tema puede consultar las instrucciones disponibles en `src/actividad_2/tarea0_u2/u2_tarea0/descargar_temas.md`.

De no estar este requisito se puede ejecutar el siguiente comando:

```git
    git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
```

4. Como requisito se solicita que el proyecto tenga como titulo `Tec-Net S.A.` y que el tema sea `ananke` por lo que
el siguiente paso será modificar el archivo `hugo.toml` para agregar dichas propiedades.

```hugo
    title = 'Tec-Net S.A.'
    theme = 'ananke'
```

5. Se solicta que el directorio `tarea0_u2/dist` no sea agregado al repositorio por lo que será necesario agregar la instrucción
al archivo `.gitignore `.

## Estructura del proyecto

```console
├── .github
│   └── PULL_REQUEST_TEMPLATE
│       └── pull_request_template.md
│
├── .vscode
│   └── extensions.json
│
├── src
│   └── actividad_2
│       ├── first_program_with_go
│       │   ├── go.mod
│       │   └── hello.go
│       │
│       └── tarea0_u2
│           ├── u2_tarea0
│           │   ├── dist
│           │   └── descargar_temas.md
│           │
│           └── u2_tarea1
│               ├── hugo.toml
│               ├── makefile
│               └── setup.sh
│
├── .dockerignore
├── .env
├── .gitignore
├── CHANGELOG.md
├── Dockerfile.dev
├── Dockerfile
├── Dockerfile.dev
└── README.md
```

## Ciclo de vida

Este repositorio incluye una estructura básica de un sitio web y se encuentra preparado para su implementación
utilizando la metodología DevOps.

En el ciclo de vida de desarrollo de este proyecto, siguiendo los principios de DevOps, se realizan tres pasos principales: **Build**, **Clean**, y **Post**. Cada uno de estos pasos puede ser ejecutado utilizando comandos en el archivo `Makefile`.

### 1. **Build**: Generar el sitio web

Este paso genera el sitio web estático a partir de los archivos de configuración y markdown del proyecto. Utilizando el comando `make build`, se construye el sitio web.

**Comando**:
```bash
    make build
```

### 2. **Clean**: Limpiar contenido de directorio dist

El paso Clean elimina el contenido del directorio `dist/`, asegurando que el siguiente paso de construcción se realice desde cero, sin archivos residuales de una construcción anterior.

**Comando**:
```bash
    make clean
```

### 3. **Post**: Crear una nueva entrada de blog

Crea una nueva entrada de blog en el proyecto. Utilizando las variables de entorno POST_TITLE (título de la entrada) y POST_NAME (nombre del archivo de la entrada), se crea un archivo .md en el directorio content/posts/

**Comando**:
```bash
    make post
```

**Generar nuevos post con hugo desde terminal**

instrucciones:

1. Debe colocarse en directorio del proyecto del proyecto.

```bash
    cd src/actividad_2/tarea0_u2/u2_tarea0/dist
```

2. Se debe ejecutar en terminal la instrucción de creación.

```hugo
    hugo new content content/posts/file_name.md
```

3. Una vez creado el documento deberemos modificar las propiedades del post
y agregar el texto de nuestra preferencia según el tema de nuestro post.

*NOTA:* Se debe mencionar que para que un post sea publicado el atributo `draft` debe contener el valor `false`.

### 4. **Help**: Deplegar información de comandos Make

Permite ver todos los comandos disponibles en el Makefile, junto con una breve descripción de su función.

**Comando**:
```bash
    make help
```