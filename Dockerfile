# Dockerfile para MineChamp Server 1.21.1
# Optimizado para Railway.app

FROM eclipse-temurin:21-jre-alpine

# Metadata
LABEL maintainer="MineChamp Server"
LABEL description="Minecraft Server 1.21.1 optimizado para Railway"

# Instalar dependencias necesarias
RUN apk add --no-cache bash curl wget

# Crear directorio de trabajo
WORKDIR /minecraft

# Copiar archivos del servidor
COPY server.jar .
COPY eula.txt .
COPY server.properties .
COPY bukkit.yml .
COPY spigot.yml .
COPY start.sh .

# Crear directorios necesarios
RUN mkdir -p world world_nether world_the_end plugins logs backups

# Hacer ejecutable el script de inicio
RUN chmod +x start.sh

# Exponer puerto de Minecraft
EXPOSE 25565

# Variables de entorno por defecto
ENV MEMORY_MIN=1G \
    MEMORY_MAX=2G \
    SERVER_PORT=25565 \
    ONLINE_MODE=true \
    MAX_PLAYERS=20 \
    VIEW_DISTANCE=10 \
    DIFFICULTY=normal \
    GAMEMODE=survival \
    PVP=true

# Comando de inicio
CMD ["./start.sh"]
