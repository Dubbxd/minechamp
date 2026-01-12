<div align="center">

![MineChamp Logo](cube-trophy.svg)

# 🎮 MineChamp - Minecraft Server 1.21.11

### Servidor de Minecraft optimizado para Railway.app con Auto-Hibernación
**✅ Compatible con todos los launchers** - Mojang, TLauncher, MultiMC, etc.  
**😴 Se apaga automáticamente** cuando no hay jugadores  
**🚀 Se enciende solo** cuando alguien intenta conectarse  
**💰 Ahorra hasta 70%** en costos de hosting

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/minechamp)

**Desarrollado por [Dubbxd](https://github.com/Dubbxd)**

📖 **[Guía Rápida de Despliegue](DEPLOY-GUIDE.md)** | 💡 **Deploy en 5 minutos**

---

</div>

## 🚀 Despliegue en Railway (3 pasos)

### Opción 1: Deploy con Template Completo (Recomendado) 🌟

**Despliega automáticamente ambos servicios (Proxy + Servidor) con un solo click:**

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/minechamp)

1. Click en el botón **"Deploy on Railway"**
2. Railway creará automáticamente:
   - ✅ **MineChamp Proxy** - Encendido automático (~$1/mes)
   - ✅ **MineChamp Server** - Servidor de Minecraft con auto-hibernación
3. Configura solo **una variable importante**:
   - Ve a **MineChamp Proxy** → Variables → `RAILWAY_TOKEN`
   - Obtén tu token en: [railway.app/account/tokens](https://railway.app/account/tokens)
   - Pega el token y guarda
4. Espera 2-3 minutos mientras se construyen los servicios
5. Copia el **TCP Proxy** del servicio **MineChamp Proxy** (ej: `minechamp.railway.app:12345`)
6. ¡Conéctate desde Minecraft!

**¡Listo!** El servidor se apagará automáticamente cuando no haya jugadores y se encenderá cuando alguien intente conectarse.

---

### Opción 2: Deploy Manual (Sin proxy wake-on-connect)

<details>
<summary>Click para ver instrucciones de deploy manual</summary>

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

#### Variables de Auto-Hibernación (Ahorro de costos)

| Variable | Valor por defecto | Descripción |
|----------|------------------|-------------|
| `ENABLE_HIBERNATE` | `true` | Activa el apagado automático por inactividad |
| `IDLE_TIMEOUT` | `10` | Minutos sin jugadores antes de apagar el servidor |

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
- **🌟 Proxy Wake-on-Connect** para encendido automático del servidor
- **😴 Auto-hibernación** para ahorrar hasta 70% en costos

Railway proporciona hosting en la nube con recursos escalables, facturación por uso, y TCP Proxy automático para que tu servidor sea accesible desde cualquier cliente de Minecraft.

## Why Deploy

### ¿Por qué elegir este template? con auto-encendido, sin necesidad de conocimientos técnicos avanzados.

**💰 Económico y escalable**: Railway ofrece un plan gratuito para empezar. Con auto-hibernación, pagas solo cuando juegas. El proxy ligero cuesta ~$1/mes.

**🎯 Wake-on-Connect**: El servidor se enciende automáticamente cuando alguien intenta conectarse. No más abrir Railway manualmente

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

### Con Template Completo (Proxy activado)

1. En Railway, ve al servicio **"MineChamp Proxy"**
2. Pestaña **"Networking"** → Copia el dominio TCP (ej: `minechamp.railway.app:12345`)
3. Abre Minecraft 1.21.11
4. Multijugador → Añadir Servidor
5. **Dirección:** Pega el dominio completo
6. ¡Juega! El servidor se enciende automáticamente si está apagado

**Comportamiento:**
- 🟢 **Servidor activo**: Conexión instantánea
- 🟡 **Servidor dormido**: Verás "Iniciando servidor...", reconecta en 1-2 minutos
- ⏰ **Auto-apagado**: Si no hay jugadores por 10 minutos, se apaga solo

---

### Sin Proxy (Deploy manual)

<details>
<summary>Click para ver instrucciones sin proxy</summary>

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

</details>

---

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

## 💰 Optimizar Costos en Railway

### Configuración Económica Recomendada

Para reducir el consumo de recursos y costos:

**1. Ajusta la Memoria RAM**
```env
MEMORY_MIN=512M
MEMORY_MAX=1G
```
- Usar solo la RAM necesaria reduce el consumo de recursos
- Para 2-5 jugadores: 1GB es suficiente
- Para 10-20 jugadores: 2GB recomendado

**2. Reduce la Distancia de Visión**
```env
VIEW_DISTANCE=6
SIMULATION_DISTANCE=6
```
- Menor distancia = menos chunks cargados = menos CPU/RAM
- `VIEW_DISTANCE=6` es aceptable para juego normal
- `VIEW_DISTANCE=10` solo para servidores grandes

**3. Limita Jugadores Máximos**
```env
MAX_PLAYERS=10
```
- Cada jugador consume CPU y RAM
- Sé realista con la cantidad esperada

**4. Usa Auto-Hibernación (Ya incluida en el template)**

Con el template completo, el servidor se apaga automáticamente:
- ✅ **Ya configurado**: No necesitas hacer nada
- ✅ **Apagado inteligente**: Solo cuando no hay jugadores
- ✅ **Encendido automático**: El proxy lo inicia cuando alguien se conecta
- ⚙️ **Ajustable**: Cambia `IDLE_TIMEOUT` para modificar los minutos de espera

**5. Optimiza las Configuraciones del Servidor**

En `server.properties`:
```properties
# Reduce carga de entidades
spawn-animals=true (pero limita con plugins)
spawn-monsters=true (considera peaceful en horas vacías)
entity-broadcast-range-percentage=80

# Optimiza chunks
view-distance=6
simulation-distance=6
```

En `spigot.yml`:
```yaml
world-settings:
  default:
    mob-spawn-range: 4
    entity-activation-range:
      animals: 16
      monsters: 24
      raiders: 32
```

**6. Usa el Plan Hobby Eficientemente**

Railway Hobby Plan incluye:
- $5 USD de crédito mensual gratuito
- Suspensión automática tras inactividad (configurable)
- Para uso casual (20-40 horas/mes) puede ser gratis

**7. Monitorea el Uso**

- Revisa las métricas de Railway regularmente
- Identifica picos de consumo
- Ajusta configuración según patrones de uso

### Estimación de Costos

**Ejemplo - Servidor Casual (1GB RAM, 30 horas/mes):**
- Costo aproximado: **$2-4 USD/mes**
- Ideal para jugar con amigos los fines de semana

**Ejemplo - Servidor Regular (2GB RAM, 100 horas/mes):**
- Costo aproximado: **$8-12 USD/mes**
- Para comunidades pequeñas activas

**Ejemplo - Servidor 24/7 (2GB RAM, 730 horas/mes):**
- Costo aproximado: **$15-25 USD/mes**
- Para servidores públicos permanentes

💡 **Tip Pro:** Combina Railway con un bot de Discord que inicie/detenga el servidor automáticamente cuando los jugadores lo necesiten.

---

## 😴 Auto-Hibernación (Ahorro Automático)

### ¿Qué es la Auto-Hibernación?

El servidor incluye un sistema de **apagado automático por inactividad** que:
- ✅ Monitorea constantemente si hay jugadores conectados
- ✅ Apaga el servidor automáticamente cuando no hay jugadores por X minutos
- ✅ Guarda el mundo correctamente antes de apagar
- ✅ **Puede ahorrar hasta 80% en costos de Railway**

### Configuración

La auto-hibernación viene **habilitada por defecto**. Configura estas variables en Railway:

```env
ENABLE_HIBERNATE=true    # Activar/desactivar (true/false)
IDLE_TIMEOUT=10          # Minutos sin jugadores antes de apagar
```

**Ejemplos de configuración:**

| Uso | IDLE_TIMEOUT | Descripción |
|-----|--------------|-------------|
| Servidor casual | `5` | Apaga rápido, máximo ahorro |
| Servidor normal | `10` | Balance entre ahorro y disponibilidad |
| Servidor activo | `30` | Más tiempo de espera para reconexiones |
| Deshabilitado | `ENABLE_HIBERNATE=false` | Servidor 24/7 |

### ¿Cómo encender el servidor después de hibernar?

#### Con Template Completo (Recomendado) ✅

**¡Automático!** Si usaste el botón "Deploy on Railway" del inicio:
- ✅ El proxy detecta cuando alguien intenta conectarse
- ✅ Enciende el servidor automáticamente
- ✅ Muestra "Iniciando servidor..." mientras arranca
- ✅ El jugador solo debe reconectarse en 1-2 minutos

**No necesitas hacer nada manualmente** 🎉

---

#### Sin Template (Deploy manual)

Si desplegaste solo el servidor sin el proxy, puedes encenderlo manualmente:

<details>
<summary>Ver opciones manuales de encendido</summary>

**Opción A: Desde Railway Dashboard**
1. Ve a tu proyecto en [Railway.app](https://railway.app)
2. Click en tu servicio de MineChamp
3. Ve a **Deployments** → Click en **"Redeploy"**
4. El servidor iniciará en ~1-2 minutos

#### Opción 3: Con la CLI de Railway
```bash
# Instalar Railway CLI
npm install -g @railway/cli

# Login
railway login

# Redeploy del proyecto
railway up
```

**Opción B: Bot de Discord**
Puedes crear un bot de Discord que use la API de Railway para encender el servidor:

```javascript
// Ejemplo básico de encendido via Railway API
const response = await fetch('https://backboard.railway.app/graphql/v2', {
  method: 'POST',
  headers: {
    'Authorization': 'Bearer TU_TOKEN_DE_RAILWAY',
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    query: `mutation { serviceInstanceRedeploy(serviceId: "TU_SERVICE_ID", environmentId: "production") }`
  })
});
```

</details>

---

### Estimación de Ahorro

| Escenario | Sin Hibernación | Con Hibernación + Proxy | Ahorro |
|-----------|-----------------|-------------------------|--------|
| Juego casual (20h/semana) | ~$15/mes | ~$4-6/mes | **60-70%** |
| Juego regular (40h/semana) | ~$15/mes | ~$7-9/mes | **40-50%** |
| Juego intensivo (80h/semana) | ~$15/mes | ~$11-13/mes | **15-25%** |

*El proxy agrega ~$0.50-1/mes pero permite encendido automático*

---

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
✅ **Auto-hibernación por inactividad (ahorra hasta 80%)**  
✅ **Apagado automático sin jugadores conectados**  
✅ **🌟 Proxy Wake-on-Connect incluido** - Encendido automático del servidor

---

## 📦 ¿Qué incluye este template?

Cuando haces deploy con el botón de arriba, Railway crea automáticamente:

### 🚪 MineChamp Proxy (~$1/mes, siempre activo)
- Detecta cuando alguien intenta conectarse
- Enciende el servidor automáticamente via Railway API
- Muestra "Iniciando servidor..." mientras arranca
- Hace forwarding directo cuando el servidor está activo
- Ultra ligero: Node.js Alpine (~50MB)

### ⛏️ MineChamp Server (solo paga cuando está activo)
- Servidor Minecraft 1.21.11 Vanilla
- Java 21 optimizado con Aikar's Flags
- Auto-hibernación tras 10 minutos sin jugadores
- Guarda el mundo antes de apagar
- Red privada (solo accesible via proxy)

### 🔄 Flujo completo automatizado
```
Jugador ──► Proxy detecta ──► ¿Server dormido? ──► Enciende via API ──► Espera 1-2 min ──► Conecta
                                      │
                                      └─► ¿Server activo? ──► Conecta inmediatamente
```

**Repositorio:** https://github.com/Dubbxd/minechamp  
**¡Servidor listo en 5 minutos! 🚂⛏️**
