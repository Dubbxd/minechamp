# 🎮 MineChamp - Minecraft Server 1.21.11

Servidor de Minecraft 1.21.11 Vanilla optimizado para despliegue automático en Railway.app.

**✅ Compatible con todos los launchers** - Mojang, TLauncher, MultiMC, etc.

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

## 🌐 Conectarse al Servidor

1. Railway asignará un **TCP Proxy** (ejemplo: `turntable.proxy.rlwy.net:21751`)
2. Abre Minecraft 1.21.11
3. Multijugador → Añadir Servidor
4. **Dirección del servidor:** Usa el TCP Proxy que Railway te dio
   - Ejemplo: `turntable.proxy.rlwy.net:21751`
   - **NO uses** el dominio HTTP (no funciona para Minecraft)
5. ¡Juega!

### ⚠️ Importante
- ✅ **USA:** El dominio TCP Proxy (`turntable.proxy.rlwy.net:PUERTO`)
- ❌ **NO USES:** El dominio HTTP/HTTPS (`tudominio.devchefs.mx`)

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

**Repositorio:** https://github.com/Dubbxd/minechamp.git  
**¡Servidor listo en 5 minutos! 🚂⛏️**
