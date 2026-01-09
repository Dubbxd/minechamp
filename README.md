<div align="center">

![MineChamp Logo](cube-trophy.svg)

# 🎮 MineChamp - Minecraft Server 1.21.11

### Servidor de Minecraft optimizado para Railway.app
**✅ Compatible con todos los launchers** - Mojang, TLauncher, MultiMC, etc.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/minechamp)

**Desarrollado por [Dubbxd](https://github.com/Dubbxd)**

---

</div>

## 🚀 Despliegue en Railway (3 pasos)

### 1. Fork o Clone este repositorio

```bash
git clone https://github.com/Dubbxd/minechamp.git
cd minechamp
```

### 2. Despliega en Railway

1. Ve a [Railway.app](https://railway.app) y crea una cuenta
2. Click en **"New Project"**
3. Selecciona **"Deploy from GitHub repo"**
4. Elige el repositorio **Dubbxd/minechamp**
5. Railway detectará automáticamente el `Dockerfile` y comenzará el build

### 3. Configura las Variables de Entorno

En el Dashboard de Railway, ve a la pestaña **Variables** y configura:

#### Variables Esenciales

| Variable | Valor Recomendado | Descripción |
|----------|------------------|-------------|
| `MEMORY_MIN` | `1G` | Memoria RAM mínima |
| `MEMORY_MAX` | `2G` | Memoria RAM máxima |
| `SERVER_PORT` | `25565` | Puerto del servidor (no cambiar) |
| `ONLINE_MODE` | `false` | false = Permite launchers alternativos, true = Solo Mojang oficial |
| `MAX_PLAYERS` | `20` | Número máximo de jugadores |
| `VIEW_DISTANCE` | `10` | Distancia de visión en chunks |
| `DIFFICULTY` | `normal` | Dificultad (peaceful/easy/normal/hard) |
| `GAMEMODE` | `survival` | Modo de juego predeterminado |
| `PVP` | `true` | Activar/desactivar PvP |

#### Variables Opcionales

| Variable | Ejemplo | Descripción |
|----------|---------|-------------|
| `MOTD` | `§6§lMineChamp §r§7\| §bMi Servidor` | Mensaje del servidor |

### Configuración según tu Plan de Railway

**Railway Hobby Plan (Gratis - 512MB-1GB RAM):**
```env
MEMORY_MIN=512M
MEMORY_MAX=1G
MAX_PLAYERS=5
VIEW_DISTANCE=6
```

**Railway Pro Plan (2GB-8GB RAM):**
```env
MEMORY_MIN=2G
MEMORY_MAX=4G
MAX_PLAYERS=20
VIEW_DISTANCE=12
```

---

# Deploy and Host

## About Hosting

MineChamp es un servidor de Minecraft 1.21.11 completamente configurado y optimizado para ejecutarse en Railway.app. Este template proporciona una solución lista para usar que elimina la complejidad de configurar un servidor de Minecraft desde cero.

El servidor viene preconfigurado con:
- **Java 21 Runtime** optimizado para mejor rendimiento
- **Docker containerizado** para despliegues consistentes y portables
- **Variables de entorno** para configuración flexible sin tocar archivos
- **Optimizaciones JVM** (Aikar's Flags) para mejor gestión de memoria
- **Reinicio automático** ante fallos para máxima disponibilidad

Railway proporciona hosting en la nube con recursos escalables, facturación por uso, y TCP Proxy automático para que tu servidor sea accesible desde cualquier cliente de Minecraft.

## Why Deploy

### ¿Por qué elegir este template?

**🚀 Despliegue instantáneo**: En menos de 5 minutos tendrás un servidor de Minecraft funcional, sin necesidad de conocimientos técnicos avanzados.

**💰 Económico y escalable**: Railway ofrece un plan gratuito para empezar y puedes escalar recursos según tus necesidades. Solo pagas por lo que usas.

**🔧 Fácil configuración**: Todas las configuraciones importantes están expuestas como variables de entorno. No necesitas editar archivos de configuración complejos.

**✅ Compatible con todos los launchers**: Funciona con Mojang oficial, TLauncher, MultiMC, y cualquier otro launcher de Minecraft.

**🔄 Actualizaciones simples**: Solo actualiza el `server.jar`, haz commit y Railway redesplegará automáticamente.

**📊 Monitoreo incluido**: Railway proporciona logs en tiempo real, métricas de CPU/RAM y alertas sin configuración adicional.

**🛡️ Persistencia de datos**: Soporte para volúmenes para que tu mundo no se pierda entre deployments.

## Common Use Cases

### Casos de uso comunes

**🎮 Servidor privado para amigos**
- Perfecto para jugar con amigos sin preocuparte por hosting o configuración
- Configura whitelist para mantenerlo privado
- Escala recursos según la cantidad de jugadores

**🏫 Servidor educativo**
- Ideal para aulas y grupos de estudio
- Control total sobre configuración y comandos
- Fácil administración desde los logs de Railway

**🎯 Servidor de pruebas**
- Testea mods, plugins o configuraciones
- Crea y destruye servidores fácilmente
- Sin compromisos de hosting a largo plazo

**🌐 Servidor comunitario pequeño**
- Perfecto para comunidades de 5-20 jugadores
- Configurable para diferentes modos de juego
- Económico para proyectos personales

**💼 Servidor de desarrollo**
- Desarrolla y prueba configuraciones de Minecraft
- Fácil integración con Git para control de versiones
- Deployments automatizados

## Dependencies for

### Deployment Dependencies

Este template tiene las siguientes dependencias para desplegar correctamente:

**Dependencias del Sistema:**
- **Docker**: Railway utiliza el Dockerfile incluido para construir el contenedor
- **Git**: Para clonar y versionar tu configuración

**Dependencias de Runtime:**
- **Java 21 (Eclipse Temurin)**: Runtime incluido en el contenedor Docker
- **Bash**: Para ejecutar el script de inicio (`start.sh`)
- **Alpine Linux**: Sistema operativo base ligero del contenedor

**Dependencias del Proyecto:**
- **server.jar**: Archivo del servidor de Minecraft 1.21.11 (incluido)
- **eula.txt**: Aceptación de EULA de Minecraft (incluido)
- **server.properties**: Configuración del servidor (incluido)
- **start.sh**: Script de inicio optimizado (incluido)

**Dependencias de Railway:**
- **Cuenta de Railway**: Gratuita o de pago según necesidades
- **GitHub Repository**: Para desplegar desde tu repositorio
- **TCP Proxy**: Railway lo proporciona automáticamente para el puerto 25565

**Opcional:**
- **Railway Volume**: Para persistencia de datos del mundo
- **Custom Domain**: Si deseas un dominio personalizado (requiere plan Pro)

Todas las dependencias críticas están incluidas en este template. Solo necesitas una cuenta de Railway y hacer clic en "Deploy" para empezar.

---

## 🌐 Conectarse al Servidor

### Configurar TCP Proxy en Railway

**Paso importante antes de conectarte:**

1. En tu proyecto de Railway, ve a la pestaña **"Networking"**
2. En la sección **"Public Networking"**, busca **"Connect to your service over TCP using a proxied domain and port"**
3. Railway generará automáticamente un TCP Proxy (ejemplo: `turntable.proxy.rlwy.net:21751`)
4. Asegúrate de que el puerto mapeado sea **25565** (el puerto de Minecraft)
5. Copia la dirección completa del TCP Proxy

### Conectarse desde Minecraft

1. Railway te habrá asignado un **TCP Proxy** (ejemplo: `turntable.proxy.rlwy.net:21751`)
2. Abre Minecraft 1.21.11
3. Multijugador → Añadir Servidor
4. **Dirección del servidor:** Pega el TCP Proxy que copiaste
   - Ejemplo: `turntable.proxy.rlwy.net:21751`
   - **NO uses** el dominio HTTP (ej: `minechamp.devchefs.mx`) - no funciona para Minecraft
5. ¡Juega!

### ⚠️ Importante
- ✅ **USA:** El dominio TCP Proxy (`turntable.proxy.rlwy.net:PUERTO`)
- ❌ **NO USES:** El dominio HTTP/HTTPS (`tudominio.devchefs.mx`)
- 🔌 **Puerto interno:** Siempre debe ser 25565 (puerto estándar de Minecraft)
- 🌐 **Puerto externo:** Railway lo asigna automáticamente (puede variar)

## ⚙️ Personalización

### Cambiar el Nombre del Servidor

Edita `server.properties` y modifica:
```properties
motd=Tu Nombre de Servidor Aquí
```

O usa la variable de entorno `MOTD` en Railway (recomendado).

### Modificar Configuración

Edita los archivos según tus necesidades:
- **`server.properties`** - Configuración principal
- **`bukkit.yml`** - Spawn y chunks
- **`spigot.yml`** - Optimizaciones

Después de editar:
```bash
git add .
git commit -m "Update configuration"
git push
```

Railway redesplegará automáticamente.

## 🔧 Comandos de Administración

En los logs de Railway puedes ejecutar:

```bash
/op <jugador>              # Dar permisos de operador
/whitelist add <jugador>   # Añadir a lista blanca
/gamemode creative         # Cambiar a modo creativo
/time set day              # Cambiar a día
/difficulty peaceful       # Cambiar dificultad
/stop                      # Detener servidor
```

## 💾 Persistencia de Datos

**⚠️ Importante:** Para mantener tu mundo entre deployments:

1. Ve a tu proyecto en Railway
2. Settings → Volumes
3. Añade un volumen montado en `/minecraft/world`

## 🐛 Solución de Problemas

**El servidor no inicia:**
- Revisa los logs en Railway
- Verifica las variables de entorno
- Asegúrate que `MEMORY_MAX` no exceda tu plan

**No puedo conectarme:**
- Confirma que el servidor esté "Active"
- Usa Minecraft **1.21.11** exactamente
- Dominio completo: `tudominio.railway.app:25565`

**Lag o bajo rendimiento:**
```env
MEMORY_MAX=1G
VIEW_DISTANCE=6
MAX_PLAYERS=10
```

## 🔒 Seguridad

### Whitelist (Servidor Privado)

En `server.properties`:
```properties
white-list=true
```

Luego en logs de Railway:
```bash
/whitelist add jugador1
```

## 🔄 Actualizar Minecraft

1. Descarga nuevo `server.jar`
2. Reemplaza el archivo
3. Commit y push
4. Railway redesplegará automáticamente

## 📝 Especificaciones

- **Versión:** Minecraft 1.21.11 Vanilla
- **Java:** OpenJDK 21
- **Optimizaciones:** Aikar's JVM Flags
- **Puerto:** 25565

---

## 👨‍💻 Desarrollador

**Dubbxd**
- GitHub: [@Dubbxd](https://github.com/Dubbxd)
- Proyecto: [MineChamp](https://github.com/Dubbxd/minechamp)

### 🛠️ Tecnologías Utilizadas

- **Minecraft Server:** Vanilla 1.21.11
- **Java Runtime:** Eclipse Temurin 21 (OpenJDK)
- **Contenedor:** Docker Alpine Linux
- **Platform:** Railway.app
- **Optimización:** Aikar's JVM Flags

### 📊 Características del Template

✅ Despliegue automático con un click  
✅ Variables de entorno configurables  
✅ Optimizado para recursos limitados  
✅ Compatible con launchers alternativos  
✅ Reinicio automático ante fallos  
✅ Logs en tiempo real  
✅ Soporte para persistencia de datos  

---

**Repositorio:** https://github.com/Dubbxd/minechamp  
**¡Servidor listo en 5 minutos! 🚂⛏️**
