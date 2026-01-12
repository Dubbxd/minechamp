# Cómo publicar MineChamp como Template en Railway

## Preparación

1. **Asegúrate de que todo esté en GitHub:**
   ```bash
   git add .
   git commit -m "Template completo con proxy wake-on-connect"
   git push origin main
   ```

2. **Verifica que los archivos clave existan:**
   - ✅ `railway.json` - Configuración multi-servicio
   - ✅ `Dockerfile` - Para el servidor de Minecraft
   - ✅ `proxy/Dockerfile` - Para el proxy
   - ✅ `README.md` - Documentación completa

## Publicar en Railway

### Opción 1: Template Público (Recomendado)

1. **Ve a Railway Template Creator:**
   - https://railway.app/new/template

2. **Configura el template:**
   - **Repository URL:** `https://github.com/Dubbxd/minechamp`
   - **Name:** `MineChamp - Minecraft Server con Auto-Hibernación`
   - **Description:** `Servidor de Minecraft 1.21.11 con proxy Wake-on-Connect que enciende automáticamente el servidor cuando alguien intenta conectarse. Ahorra hasta 70% en costos.`
   - **Icon:** ⛏️ o 🎮
   - **Demo URL:** (opcional) `https://github.com/Dubbxd/minechamp`

3. **Configura los servicios:**
   
   **Servicio 1: MineChamp Proxy**
   - Name: `MineChamp Proxy`
   - Root Directory: `proxy`
   - Icon: 🚪
   - Variables requeridas:
     - `RAILWAY_TOKEN` (tipo: secret, descripción: "Token de Railway API - crear en railway.app/account/tokens")
   
   **Servicio 2: MineChamp Server**
   - Name: `MineChamp`
   - Root Directory: `/` (raíz)
   - Icon: ⛏️
   - Variables opcionales con defaults ya configurados en `railway.json`

4. **Publica:**
   - Click en **"Publish Template"**
   - Railway generará una URL como: `https://railway.app/template/minechamp`

### Opción 2: Botón en README

Actualiza el README.md con la URL del template:

```markdown
[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/minechamp)
```

Reemplaza `/minechamp` con el slug que Railway te asigne.

## Probar el Template

1. **Haz click en tu botón de Deploy**
2. **Verifica que:**
   - Se crean ambos servicios (Proxy + Server)
   - Las variables de entorno se configuran correctamente
   - El Proxy obtiene un TCP domain automáticamente
   - El Server usa solo Private Networking

3. **Configura el RAILWAY_TOKEN:**
   - Ve a https://railway.app/account/tokens
   - Crea un token
   - Pégalo en la variable del Proxy

4. **Prueba la conexión:**
   - Copia el TCP domain del Proxy
   - Conéctate desde Minecraft
   - Verifica que el servidor se encienda automáticamente

## Mantener el Template Actualizado

Cada vez que actualices el repositorio:

```bash
git add .
git commit -m "Actualización: descripción del cambio"
git push origin main
```

Railway actualizará automáticamente el template para nuevos deploys.

## Promocionar el Template

1. **Añade badges al README:**
   ```markdown
   ![Railway Deploy](https://img.shields.io/badge/Deploy-Railway-blueviolet)
   ![Minecraft Version](https://img.shields.io/badge/Minecraft-1.21.11-green)
   ![License](https://img.shields.io/badge/License-MIT-blue)
   ```

2. **Comparte en:**
   - Railway Discord
   - Reddit: r/admincraft, r/railway
   - Twitter/X con hashtags: #minecraft #railway #gamedev

3. **Crea un video tutorial** (opcional)
   - Muestra el deploy en 5 minutos
   - Explica la auto-hibernación
   - Sube a YouTube

## Métricas y Analytics

Monitorea el uso del template en:
- Railway Dashboard → Templates → Ver estadísticas
- GitHub Insights → Traffic

---

**¡Listo para compartir tu template con la comunidad!** 🚀
