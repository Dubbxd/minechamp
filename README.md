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

## 🚀 Cómo Desplegarse en Railway

### Paso 1: Click en Deploy to Railway 🚀

Haz click en el botón para iniciar el despliegue automático:

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/minechamp)

**¿Qué va a pasar?**
- Railway desplegará automáticamente **2 servicios** en tu cuenta:
  - 🚪 **Proxy Conect** - Proxy ligero para encendido automático
  - ⛏️ **MineChamp** - Servidor de Minecraft 1.21.11
- Los servicios se construirán automáticamente (3-5 minutos)
- NO se te cobrará nada hasta que te conectes y juegues

---

### Paso 2: Espera a que se construyan los servicios (3-5 min) ⏳

Verás en tu Dashboard de Railway:
- 🟡 **Building...** → Construyendo contenedores Docker
- 🟢 **Active** → ¡Servicios listos!

**Espera a que AMBOS servicios muestren** ✅ **Active**

---

### Paso 3: Configura 2 Variables en el Proxy 🔑

**¿Por qué?** Para que el proxy pueda encender automáticamente el servidor cuando alguien intente conectarse.

#### 3.1 Crear Railway Token

1. Abre: **https://railway.app/account/tokens**
2. Click en **"Create Token"**
3. Nombre: `minechamp-proxy`
4. **Copia el token** (⚠️ solo se muestra una vez)

#### 3.2 Obtener Service ID del Servidor

1. En Railway Dashboard → Click en servicio **"MineChamp"**
2. Pestaña **"Settings"**
3. Busca **"Service ID"** (abajo en la página)
4. **Copia el ID** (ejemplo: `abc12345-def6-7890-ghij-klmnopqrstuv`)

#### 3.3 Agregar Variables al Proxy

1. Click en servicio **"Proxy Conect"**
2. Pestaña **"Variables"**
3. Agrega estas 2 variables:

```
RAILWAY_TOKEN = [el-token-que-copiaste]
RAILWAY_SERVICE_ID = [el-service-id-que-copiaste]
```

4. Guarda (Enter en cada una)
5. El proxy se reiniciará automáticamente (~30 segundos)

---

### Paso 4: Obtén la Dirección del Servidor 🌐

1. Click en servicio **"Proxy Conect"** (⚠️ NO en MineChamp)
2. Pestaña **"Settings"**
3. Sección **"Networking"** → Busca **"TCP Proxy"**
4. **Copia la dirección completa** (ejemplo: `proxy-production.up.railway.app:12345`)

---

### Paso 5: ¡Conéctate desde Minecraft! 🎮

1. Abre **Minecraft 1.21.11** (Java Edition)
2. Multijugador → Añadir Servidor
3. **Dirección:** Pega la dirección TCP del Proxy (del Paso 4)
4. **¡Juega!**

**Primera conexión:**
- Si el servidor está dormido verás: "Iniciando servidor..."
- Espera **1-2 minutos** y reconecta
- El servidor se está encendiendo automáticamente

**Próximas conexiones:**
- Si jugaste recientemente: conexión **instantánea**
- Si nadie jugó por 10+ min: espera 1-2 min (está hibernando)

---

### 📖 ¿Necesitas ayuda detallada?

👉 **[Ver guía completa paso a paso (SETUP-INSTRUCTIONS.md)](SETUP-INSTRUCTIONS.md)**
- Troubleshooting de errores comunes
- Cómo optimizar costos
- Configuraciones avanzadas
- Comandos de administrador

---

## 💡 Opciones Alternativas de Deploy

### Opción 2: Deploy Manual (Sin proxy wake-on-connect)

---

## 💡 Opciones Alternativas de Deploy

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

MineChamp es un servidor de Minecraft 1.21.11 optimizado para Railway.app que se despliega automáticamente con dos servicios: un proxy para wake-on-connect y el servidor de Minecraft con auto-hibernación.

## About Hosting

MineChamp proporciona una solución completa de hosting para Minecraft con auto-hibernación inteligente que reduce costos hasta en un 70%. El sistema despliega automáticamente:

**🚪 Proxy Conect** - Servicio ligero (~50MB) que detecta conexiones de jugadores y enciende automáticamente el servidor de Minecraft mediante la API de Railway. Siempre activo pero consume recursos mínimos (~$1/mes).

**⛏️ MineChamp Server** - Servidor de Minecraft 1.21.11 completamente configurado con auto-hibernación. Se apaga automáticamente después de 10 minutos sin jugadores y se enciende cuando alguien intenta conectarse.

El servidor viene preconfigurado con:
- ✅ Java 21 Runtime optimizado para mejor rendimiento
- ✅ Docker containerizado para despliegues consistentes
- ✅ Variables de entorno para configuración sin editar archivos
- ✅ Optimizaciones JVM (Aikar's Flags) para gestión eficiente de memoria
- ✅ Sistema de hibernación que monitorea jugadores activos
- ✅ Compatible con todos los launchers (TLauncher, Mojang, MultiMC)

Railway proporciona hosting en la nube con recursos escalables, facturación por uso real, y TCP Proxy automático para accesibilidad global.

## Why Deploy

**🎯 Encendido Automático (Wake-on-Connect)**  
El proxy detecta cuando alguien intenta conectarse y enciende el servidor automáticamente via la API de Railway. No necesitas abrir Railway manualmente ni mantener el servidor activo 24/7.

**💰 Ahorra 60-70% en Costos**  
Con auto-hibernación, solo pagas cuando juegas. Un servidor que se usa 20h/semana cuesta ~$4-5/mes en lugar de $15-20/mes 24/7. El proxy siempre activo suma solo ~$1/mes adicional.

**🔧 Deploy en 1 Click - Configuración en 2 Minutos**  
El template despliega automáticamente ambos servicios. Solo necesitas configurar 2 variables en el proxy (RAILWAY_TOKEN y RAILWAY_SERVICE_ID) y listo para jugar.

**✅ Compatible con Todos los Launchers**  
Funciona con Mojang oficial, TLauncher, MultiMC, ATLauncher, y cualquier cliente de Minecraft Java Edition 1.21.11. Configuración `ONLINE_MODE=false` por defecto.

**📊 Monitoreo y Logs en Tiempo Real**  
Railway proporciona visualización de logs, métricas de CPU/RAM, y seguimiento de costos sin configuración adicional. Ve exactamente cuánto estás gastando.

**🛡️ Persistencia Garantizada**  
Soporte para Railway Volumes para que tu mundo nunca se pierda entre deployments. El servidor guarda automáticamente antes de apagarse.

## Common Use Cases

**🎮 Servidor Privado para Amigos (2-10 jugadores)**  
Perfecto para jugar con amigos sin pagar por hosting 24/7. El servidor se enciende solo cuando alguien quiere jugar. Configura whitelist para mantenerlo privado. Costo típico: $4-7/mes.

**🏫 Servidor Educativo o de Aula**  
Ideal para profesores que necesitan un servidor temporal para clases. Se apaga automáticamente fuera del horario escolar. Control total sobre configuración y comandos. Económico para presupuestos limitados.

**🎯 Servidor de Pruebas y Desarrollo**  
Testea mods, plugins o configuraciones sin desperdiciar recursos. El servidor se apaga cuando no lo usas. Crea múltiples instancias fácilmente para diferentes versiones o configuraciones.

**🌐 Servidor Comunitario Pequeño (10-20 jugadores)**  
Para comunidades con actividad variable durante el día. Auto-hibernación durante horas de poca actividad. Escala recursos según crezca tu comunidad. Monitorea costos y ajusta según necesidad.

**💼 Servidor SMP (Survival Multiplayer) Casual**  
Para grupos que juegan fines de semana o algunas tardes. El proxy permite acceso 24/7 pero solo pagas las horas de juego real. Perfecto para equipos distribuidos en diferentes zonas horarias.

## Dependencies for

### Deployment Dependencies

El template despliega automáticamente con las siguientes dependencias incluidas:

**Servicio 1: Proxy Conect**
- Node.js 20 Alpine (incluido en Dockerfile)
- minecraft-protocol npm package (auto-instalado)
- Railway API GraphQL client (integrado)

**Servicio 2: MineChamp Server**
- Java 21 Eclipse Temurin (incluido en Dockerfile)
- Bash shell (Alpine Linux base)
- server.jar Minecraft 1.21.11 (incluido en repositorio)
- hibernate-monitor.sh (script de monitoreo incluido)

**Configuración Requerida Post-Deploy:**
- Railway Account Token (crear en railway.app/account/tokens)
- Service ID del servidor MineChamp (copiar desde Railway Settings)

**Archivos de Configuración Incluidos:**
- `eula.txt` - EULA de Minecraft aceptada
- `server.properties` - Configuración base del servidor
- `start.sh` - Script de inicio optimizado con JVM flags
- `railway.json` - Configuración del template multi-servicio

**Opcional para Mayor Persistencia:**
- Railway Volume montado en `/minecraft/world` (recomendado para mundos importantes)
- Custom Domain para el proxy TCP (requiere Railway Pro)

Todas las dependencias críticas están pre-instaladas. El template es funcional inmediatamente después del deploy, solo requiere 2 variables de configuración en el proxy.

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
