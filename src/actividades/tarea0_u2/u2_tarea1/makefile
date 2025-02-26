## Define variables
HUGO = hugo
DIST_DIR = ../u2_tarea0/dist
POST_DIR = ../u2_tarea0/dist/content/posts
THEME_ZIP = ananke.zip
THEME_DIR = gohugo-theme-ananke-master
THEME_REPO = https://github.com/theNewDynamic/gohugo-theme-ananke/archive/refs/heads/master.zip
THEME_PATH = themes/ananke
IS_DRAFT = false
POST_TEMPLATE = layouts/_default/single.html


clean:	# Paso "Clean": Limpia el contenido del directorio dist/
	@echo "Limpiando el directorio $(DIST_DIR)..."
	@rm -rf $(DIST_DIR) $(THEME_ZIP) $(THEME_PATH) .hugo_build.lock

build: clean ## Paso "Build": Genera el sitio web a partir de los archivos de configuración y markdown
	@echo "Limpiando directorios antiguos..."
	@rm -rf $(THEME_PATH)/resources $(THEME_ZIP) $(THEME_DIR) $(DIST_DIR) .hugo_build.lock
	@echo "Verificando si el tema ya está descargado..."
	@if [ ! -f $(THEME_ZIP) ]; then \
		echo "Descargando el tema Ananke..."; \
		curl -L $(THEME_REPO) -o $(THEME_ZIP); \
	else \
		echo "El tema ya fue descargado. Omitiendo descarga."; \
	fi
	
	@echo "Descomprimiendo el tema..."
	@if [ ! -d $(THEME_PATH) ]; then \
		unzip -o $(THEME_ZIP) && mv $(THEME_DIR) $(THEME_PATH); \
	else \
		echo "El tema ya está descomprimido. Omitiendo descompresión."; \
	fi

	@POST_TITLE="Bienvenidos a Tec-Net S.A." POST_NAME="welcome" make post
	
	@echo "Generando el sitio web..."
	@$(HUGO) -d $(DIST_DIR)
	@$(HUGO) server

post:  ## Paso "Post": Crea una nueva entrada de blog
	@echo "Creando una nueva entrada de blog..."
	@if [ -z "$(POST_TITLE)" ] || [ -z "$(POST_NAME)" ]; then \
		echo "Se deben definir las variables de entorno POST_TITLE y POST_NAME"; \
		exit 1; \
	fi
	@mkdir -p $(POST_DIR)
	@echo "---\ntitle: \"$(POST_TITLE)\"\ndate: $(shell date +'%Y-%m-%dT%H:%M:%S%z')\nslug: $(POST_NAME)\ndraft: $(IS_DRAFT)\n---" > $(POST_DIR)/$(POST_NAME).md
	@echo "Nueva entrada de blog creada: $(POST_NAME).md"

help:	## Target "ayuda": Muestra los targets disponibles y su descripción
	@echo "Comandos disponibles en el Makefile:"
	@echo "  clean   - Limpia el contenido del directorio $(DIST_DIR)."
	@echo "  build   - Genera el sitio web a partir de los archivos de configuración y markdown."
	@echo "  post    - Crea una nueva entrada de blog usando las variables de entorno POST_TITLE y POST_NAME."
	@echo ""
	@echo "Uso de cada comando:"
	@echo "  make clean"
	@echo "  make build"
	@echo "  POST_TITLE=\"Título\" POST_NAME=\"nombre-entrada\" make post"

.PHONY: clean build post
