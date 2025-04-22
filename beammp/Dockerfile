FROM debian:12

ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    ca-certificates \
    libatomic1 \
    liblua5.3-0 \
    && rm -rf /var/lib/apt/lists/*

# Establecer el directorio de trabajo
WORKDIR /beammp

# Descargar la última versión de BeamMP desde GitHub
RUN curl -L -o BeamMP-Server.debian.12.x86_64 https://github.com/BeamMP/BeamMP-Server/releases/download/latest/BeamMP-Server.debian.12.x86_64 \
    && chmod +x BeamMP-Server.debian.12.x86_64

# Copiar script de entrada
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Exponer los puertos necesarios para BeamMP
EXPOSE 30814/udp 30814/tcp

# Establecer el punto de entrada para el contenedor
ENTRYPOINT ["/entrypoint.sh"]
