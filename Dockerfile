FROM python:3.10-slim

# Instala dependencias necesarias del sistema
RUN apt-get update && apt-get install -y \
    git \
    python3-venv \
    libgl1 \
    libglib2.0-0 \
    libgoogle-perftools-dev \
    bc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Crear usuario
RUN useradd -ms /bin/bash appuser

# Crear carpetas de cache y modelos con permisos
RUN mkdir -p /home/appuser/.cache/pip \
    /home/appuser/.cache/huggingface \
    /app/models 

COPY ./stable-diffusion-webui /app

RUN chown -R appuser:appuser /app /home/appuser/.cache


# Usar usuario sin privilegios
USER appuser

# Establece directorio de trabajo
WORKDIR /app

# # Copia los archivos del proyecto
# COPY ./stable-diffusion-webui /app

# Copiar el código con permisos correctos

# Puerto donde corre la WebUI
EXPOSE 7860

# Configurar ubicación de cache pip
ENV PIP_CACHE_DIR=/home/appuser/g.cache/pip
ENV HF_HOME=/home/appuser/.cache/huggingface


# Comando por defecto
# CMD ["./webui.sh", "--listen", "--skip-torch-cuda-test"]
# CMD ["./webui.sh", "--listen", "--skip-torch-cuda-test", "--no-half", "--medvram", "--lowvram"]
CMD ["./webui.sh", "--listen", "--skip-torch-cuda-test", "--no-half", "--lowvram"]
