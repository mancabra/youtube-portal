## Define variables
HUGO = hugo
DIST_DIR = ../u2_tarea0/dist
POST_DIR = ../u2_tarea0/dist/content/posts
IS_DRAFT = true
POST_TEMPLATE = layouts/_default/single.html


clean:	# Paso "Clean": Limpia el contenido del directorio dist/
	@echo "Limpiando el directorio $(DIST_DIR)..."
	@rm -rf $(DIST_DIR)/*

build:  ## Paso "Build": Genera el sitio web a partir de los archivos de configuración y markdown
	@echo "Generando el sitio web..."
	@$(HUGO) -d $(DIST_DIR)

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
