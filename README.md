# Stable Diffusion Web UI con Docker

Este proyecto te permite ejecutar la interfaz web de [AUTOMATIC1111/stable-diffusion-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui) usando Docker y Docker Compose.

Actualmente configurado para usar CPU.

## Cómo empezar

### 1. Clonar Repositorio

En este proyecto ya se incluye el repositorio [AUTOMATIC1111/stable-diffusion-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui) clonado, pero si se requiere volver a clonar, hacerlo en la carpeta [stable-diffusion-webui](stable-diffusion-webui)


### 3. Levantar el Servicio

Para iniciar el servicio.

**Para CPU:**

1.  Abre el archivo `docker-compose.yml`.
2.  Asegúrate de que toda la sección `deploy` esté comentada.
3.  (Opcional) Elimina el argumento `--xformers` de la variable `CLI_ARGS`.

Luego, ejecuta:
```bash
docker-compose up -d
```

**Para GPU (NVIDIA):**

1.  Asegúrate de tener instalado el **NVIDIA Container Toolkit**.
2.  Abre el archivo `docker-compose.yml`.
3.  Descomenta la sección `deploy`.
4.  Asegúrate de que el argumento `--xformers` esté presente en `CLI_ARGS` para un mejor rendimiento.

Luego, ejecuta:
```bash
docker-compose up -d
```

>**NOTA:**
<br><br>El servicio puede tardar unos minutos en iniciarse por primera vez mientras descarga las dependencias necesarias.
<br><br>El DockerFile y el dockercompose.yml ya están configurados para que después de ejecutarse por primera vez y hacer esa descarga inicial, estás descargas sean persistentes ya que son de varios gigas.
<br><br>Puedes ver el progreso con `docker-compose logs -f`.

### 4. Acceder a la Interfaz Web

Una vez que esté listo, abre tu navegador y ve a:

[http://localhost:7860](http://localhost:7860)

### 5. Detener el Servicio

Para detener los contenedores, ejecuta:

```bash
docker-compose down
```


### Extra

- Acceder a la cli del contenedor

``` sh
docker exec -it stable-diffusion-webui bash
```