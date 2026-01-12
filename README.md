<div align="center">

![MineChamp Logo](cube-trophy.svg)

# 🎮 MineChamp - Minecraft Server 1.21.11

### Servidor de Minecraft optimizado para Railway.app con Auto-Hibernación
**✅ Compatible con todos los launchers** - Mojang, TLauncher, MultiMC, etc.  
**😴 Se apaga automáticamente** cuando no hay jugadores  
**🚀 Se enciende solo** cuando alguien intenta conectarse  
**💰 Ahorra hasta 70%** en costos de hosting

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/minechamp)

**Desarrollado por [Dubbxd](https://github.com/Dubbxd)** | 📖 **[Guía Completa](SETUP-INSTRUCTIONS.md)**

---

</div>

## 🚀 Deploy Rápido (5 Pasos)

### 1️⃣ Click en Deploy [![Deploy](https://railway.app/button.svg)](https://railway.app/template/minechamp)

Railway desplegará automáticamente 2 servicios:
- 🚪 **Proxy Conect** - Encendido automático
- ⛏️ **MineChamp** - Servidor Minecraft 1.21.11

### 2️⃣ Espera 3-5 min hasta ver ✅ Active en ambos

### 3️⃣ Configura 2 Variables en el Proxy

**Crear Token:** https://railway.app/account/tokens → Copiar  
**Service ID:** MineChamp → Settings → Service ID → Copiar

En **Proxy Conect** → Variables → Agregar:
```
RAILWAY_TOKEN = [tu-token]
RAILWAY_SERVICE_ID = [service-id-del-servidor]
```

### 4️⃣ Obtén la Dirección TCP

**Proxy Conect** → Settings → Networking → **TCP Proxy** → Copiar (ej: `proxy.railway.app:12345`)

### 5️⃣ Conecta desde Minecraft 1.21.11

Multijugador → Añadir Servidor → Pega la dirección TCP → ¡Juega!

**Primera conexión:** Espera 1-2 min si dice "Iniciando servidor..." (está encendiendo automáticamente)

👉 **[Guía detallada con troubleshooting](SETUP-INSTRUCTIONS.md)**


---

# Deploy and Host

MineChamp es un servidor de Minecraft 1.21.11 optimizado para Railway.app que se despliega automáticamente con dos servicios: un proxy ligero para wake-on-connect y el servidor de Minecraft con auto-hibernación inteligente.

## About Hosting

El sistema despliega automáticamente **2 servicios en Railway**:

**🚪 Proxy Conect** (~50MB, ~$1/mes) - Servicio ligero que detecta conexiones de jugadores y enciende automáticamente el servidor mediante la API de Railway. Siempre activo pero consume recursos mínimos.

**⛏️ MineChamp Server** - Servidor Minecraft 1.21.11 con auto-hibernación. Se apaga automáticamente tras 10 minutos sin jugadores y se enciende cuando alguien intenta conectarse. Solo pagas cuando está activo.

El servidor incluye:
- Java 21 Runtime con optimizaciones JVM (Aikar's Flags)
- Docker containerizado para despliegues consistentes
- Variables de entorno para configuración flexible
- Sistema de hibernación que monitorea jugadores activos
- Compatible con todos los launchers (TLauncher, Mojang, MultiMC)

Railway proporciona hosting en la nube con recursos escalables, facturación por uso real, y TCP Proxy automático para accesibilidad global.

## Why Deploy

**🎯 Encendido Automático** - El proxy detecta cuando alguien intenta conectarse y enciende el servidor automáticamente via API de Railway. No necesitas mantener el servidor activo 24/7.

**💰 Ahorra 60-70% en Costos** - Con auto-hibernación, solo pagas cuando juegas. Servidor 20h/semana: ~$4-5/mes vs $15-20/mes 24/7. El proxy siempre activo suma solo ~$1/mes.

**🔧 Deploy en 1 Click** - El template despliega automáticamente ambos servicios. Solo configuras 2 variables en el proxy (RAILWAY_TOKEN y RAILWAY_SERVICE_ID) y listo.

**✅ Compatible con Todos los Launchers** - Funciona con Mojang oficial, TLauncher, MultiMC, ATLauncher, y cualquier cliente Minecraft Java 1.21.11. `ONLINE_MODE=false` por defecto.

**📊 Monitoreo en Tiempo Real** - Railway proporciona logs, métricas de CPU/RAM, y seguimiento de costos sin configuración adicional.

**🛡️ Persistencia Garantizada** - Soporte para Railway Volumes. El servidor guarda automáticamente antes de apagarse.

## Common Use Cases

**🎮 Servidor Privado para Amigos (2-10 jugadores)** - El servidor se enciende solo cuando alguien quiere jugar. Configura whitelist para mantenerlo privado. Costo típico: $4-7/mes.

**🏫 Servidor Educativo** - Se apaga automáticamente fuera del horario escolar. Control total sobre configuración y comandos. Económico para presupuestos limitados.

**🎯 Servidor de Pruebas** - Testea mods, plugins o configuraciones sin desperdiciar recursos. El servidor se apaga cuando no lo usas.

**🌐 Servidor Comunitario Pequeño (10-20 jugadores)** - Auto-hibernación durante horas de poca actividad. Escala recursos según crezca tu comunidad.

**💼 Servidor SMP Casual** - Para grupos que juegan fines de semana o algunas tardes. El proxy permite acceso 24/7 pero solo pagas las horas de juego real.

## Dependencies for

### Deployment Dependencies

**Servicio 1: Proxy Conect**
- Node.js 20 Alpine (incluido en Dockerfile)
- minecraft-protocol npm package (auto-instalado)
- Railway API GraphQL client (integrado)

**Servicio 2: MineChamp Server**
- Java 21 Eclipse Temurin (incluido en Dockerfile)
- Bash shell (Alpine Linux base)
- server.jar Minecraft 1.21.11 (incluido)
- hibernate-monitor.sh (script de monitoreo incluido)

**Configuración Post-Deploy:**
- Railway Account Token (crear en railway.app/account/tokens)
- Service ID del servidor MineChamp (copiar desde Railway Settings)

**Archivos Incluidos:**
- `eula.txt` - EULA de Minecraft aceptada
- `server.properties` - Configuración base
- `start.sh` - Script optimizado con JVM flags
- `railway.json` - Configuración template multi-servicio

**Opcional:**
- Railway Volume en `/minecraft/world` (recomendado)
- Custom Domain para proxy TCP (requiere Railway Pro)

Todas las dependencias críticas están pre-instaladas. El template es funcional inmediatamente, solo requiere 2 variables de configuración en el proxy.

---

## 📚 Documentación Adicional

- **[SETUP-INSTRUCTIONS.md](SETUP-INSTRUCTIONS.md)** - Guía completa paso a paso con troubleshooting
- **[DEPLOY-GUIDE.md](DEPLOY-GUIDE.md)** - Guía rápida de despliegue
- **GitHub:** https://github.com/Dubbxd/minechamp

---

## 🛠️ Variables de Configuración

### Variables del Servidor (MineChamp)

| Variable | Default | Descripción |
|----------|---------|-------------|
| `MEMORY_MIN` | `1G` | RAM mínima |
| `MEMORY_MAX` | `2G` | RAM máxima |
| `ONLINE_MODE` | `false` | Verificación Mojang |
| `MAX_PLAYERS` | `20` | Jugadores máximos |
| `DIFFICULTY` | `normal` | Dificultad |
| `GAMEMODE` | `survival` | Modo de juego |
| `IDLE_TIMEOUT` | `10` | Minutos antes de hibernar |

### Variables del Proxy (Proxy Conect)

| Variable | Requerida | Descripción |
|----------|-----------|-------------|
| `RAILWAY_TOKEN` | ✅ Sí | Token de railway.app/account/tokens |
| `RAILWAY_SERVICE_ID` | ✅ Sí | Service ID del servidor MineChamp |
| `MC_SERVER_HOST` | No | Default: minechamp.railway.internal |
| `MC_SERVER_PORT` | No | Default: 25565 |

---

## 💰 Estimación de Costos

| Uso | Horas/mes | Proxy | Server | Total |
|-----|-----------|-------|--------|-------|
| Casual (fines de semana) | ~20h | $1 | $3-4 | **$4-5/mes** |
| Regular (tardes) | ~40h | $1 | $6-7 | **$7-8/mes** |
| Intensivo (diario) | ~80h | $1 | $10-11 | **$11-12/mes** |
| 24/7 (sin hibernar) | 730h | $1 | $18-20 | **$19-21/mes** |

⚠️ **Con hibernación ahorras 60-70%** vs servidor 24/7

---

## 👨‍💻 Autor

**Dubbxd** - [@Dubbxd](https://github.com/Dubbxd)

**Stack:** Minecraft 1.21.11 Vanilla | Java 21 | Docker Alpine | Railway.app | Aikar's JVM Flags

---

**¡Servidor listo en 5 minutos! 🚂⛏️**
