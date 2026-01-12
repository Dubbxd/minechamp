# 🎮 MineChamp - Instrucciones de Configuración Post-Deploy

¡Gracias por usar MineChamp! Sigue estos pasos para configurar tu servidor de Minecraft.

---

## ✅ Paso 1: Espera a que termine el Deploy (2-3 minutos)

Railway está construyendo dos servicios:
- 🚪 **MineChamp Proxy** - Encendido automático del servidor
- ⛏️ **MineChamp** - Servidor de Minecraft 1.21.11

**Espera a que ambos servicios muestren** ✅ **"Active"**

---

## 🔑 Paso 2: Configurar el Railway Token (IMPORTANTE)

Para que el proxy pueda encender automáticamente el servidor, necesitas configurar un token de Railway:

### 2.1 Crear el Token

1. Ve a: **https://railway.app/account/tokens**
2. Click en **"Create Token"**
3. Dale un nombre: `minechamp-proxy`
4. **Copia el token** que se genera (solo se muestra una vez)

### 2.2 Agregar el Token al Proxy

1. En tu proyecto de Railway, click en el servicio **"MineChamp Proxy"**
2. Ve a la pestaña **"Variables"**
3. Busca la variable **`RAILWAY_TOKEN`**
4. Pega el token que copiaste
5. Click en **"Save"** o presiona Enter

El proxy se reiniciará automáticamente con el nuevo token.

---

## 🌐 Paso 3: Obtener la Dirección del Servidor

1. Click en el servicio **"MineChamp Proxy"** (no el servidor)
2. Ve a la pestaña **"Settings"** o **"Networking"**
3. Busca el **TCP Proxy Domain**
4. Copia la dirección completa (ejemplo: `minechamp-production.up.railway.app:12345`)

⚠️ **Importante:** Usa la dirección del **Proxy**, NO del servidor de Minecraft.

---

## 🎮 Paso 4: Conectarte desde Minecraft

1. Abre **Minecraft 1.21.11**
2. Click en **"Multijugador"**
3. Click en **"Añadir Servidor"**
4. **Nombre del servidor:** Lo que quieras (ej: "MineChamp")
5. **Dirección del servidor:** Pega la dirección TCP del Proxy
6. Click en **"Listo"**
7. ¡Conéctate y juega!

---

## 💡 ¿Cómo funciona la Auto-Hibernación?

### Primera vez / Servidor apagado
- Intentas conectarte → Verás "Iniciando servidor..."
- **Espera 1-2 minutos** mientras el servidor arranca
- Vuelve a conectarte → ¡Listo para jugar!

### Servidor activo
- Conexión instantánea, sin esperas

### Auto-apagado
- Si no hay jugadores por **10 minutos**, el servidor se apaga automáticamente
- El mundo se guarda antes de apagar
- ¡Solo pagas cuando juegas! 💰

---

## ⚙️ Configuración Opcional

### Cambiar tiempo de inactividad

1. En Railway → Servicio **"MineChamp"**
2. Variables → `IDLE_TIMEOUT`
3. Cambia el valor (minutos): `5` = más ahorro, `30` = más tiempo activo

### Permitir launchers alternativos (TLauncher, etc.)

Ya está configurado por defecto. Variable `ONLINE_MODE=false`

### Cambiar RAM del servidor

1. Variables → `MEMORY_MAX`
2. Valores recomendados:
   - **1G** - Para 2-5 jugadores
   - **2G** - Para 10-20 jugadores (default)
   - **4G** - Para 20+ jugadores

### Cambiar dificultad o modo de juego

Variables disponibles:
- `DIFFICULTY`: `peaceful`, `easy`, `normal`, `hard`
- `GAMEMODE`: `survival`, `creative`, `adventure`, `spectator`
- `PVP`: `true` o `false`
- `MAX_PLAYERS`: Número máximo de jugadores

---

## 🛠️ Comandos de Administrador

Para ejecutar comandos, ve a Railway → Servicio **"MineChamp"** → Pestaña **"Logs"**

**Comandos útiles:**
```
/op <jugador>              # Dar permisos de operador
/whitelist add <jugador>   # Añadir a lista blanca
/gamemode creative         # Cambiar a creativo
/time set day              # Cambiar a día
/difficulty peaceful       # Cambiar dificultad
/stop                      # Apagar servidor manualmente
```

---

## 🐛 Solución de Problemas

### "No puedo conectarme"
✅ Verifica que estás usando la dirección del **Proxy** (no del servidor)  
✅ Asegúrate de tener **Minecraft 1.21.11**  
✅ Espera 1-2 minutos si dice "Iniciando servidor..."

### "El servidor no se enciende automáticamente"
✅ ¿Configuraste el `RAILWAY_TOKEN` en el Proxy?  
✅ Ve a los logs del Proxy, busca errores  
✅ Verifica que ambos servicios estén "Active"

### "Dice 'Connection timed out'"
✅ El servidor podría estar iniciándose, espera 2 minutos  
✅ Verifica en Railway que el servidor esté "Active"  
✅ Revisa los logs del servidor para ver si hay errores

### "Los logs del Proxy muestran errores de API"
✅ El `RAILWAY_TOKEN` podría estar incorrecto, créalo de nuevo  
✅ El token debe tener permisos para manejar el proyecto

### "El mundo se perdió"
❌ Esto no debería pasar. El servidor guarda automáticamente  
✅ Para más seguridad, configura un **Volume** en Railway:
   - Settings → Volumes → Add Volume
   - Mount path: `/minecraft/world`

---

## 💰 Monitorear Costos

1. Railway Dashboard → Tu proyecto
2. Click en **"Usage"** o **"Metrics"**
3. Verás el consumo de CPU, RAM y costos estimados

**Costos estimados:**
- **Proxy**: ~$0.50-1.00/mes (siempre activo, muy ligero)
- **Servidor**: Variable según uso
  - 20h/semana: ~$3-4/mes
  - 40h/semana: ~$6-7/mes
  - 24/7: ~$15-20/mes

---

## 📊 Optimizar para Ahorrar Más

1. **Reduce RAM** si tienes pocos jugadores: `MEMORY_MAX=1G`
2. **Reduce View Distance**: `VIEW_DISTANCE=6`
3. **Baja Idle Timeout**: `IDLE_TIMEOUT=5` (apaga más rápido)
4. **Limita jugadores**: `MAX_PLAYERS=10`

---

## 🎯 Próximos Pasos

- ✅ Invita amigos a jugar
- ✅ Personaliza el MOTD del servidor
- ✅ Añade plugins (coloca `.jar` en carpeta `plugins/`)
- ✅ Configura whitelist si quieres servidor privado
- ✅ Monitorea costos y ajusta según necesites

---

## 📚 Documentación Completa

Para más información detallada:
- **GitHub:** https://github.com/Dubbxd/minechamp
- **README completo:** [Ver README.md](https://github.com/Dubbxd/minechamp/blob/main/README.md)
- **Guía de despliegue:** [Ver DEPLOY-GUIDE.md](https://github.com/Dubbxd/minechamp/blob/main/DEPLOY-GUIDE.md)

---

## ❓ ¿Necesitas Ayuda?

- 🐛 **Issues:** https://github.com/Dubbxd/minechamp/issues
- 💬 **Discusiones:** https://github.com/Dubbxd/minechamp/discussions
- 👨‍💻 **Creador:** [@Dubbxd](https://github.com/Dubbxd)

---

**¡Disfruta tu servidor MineChamp! ⛏️🎮**
