#!/bin/bash
# Configuración
LOCALHOST=$(hostname)
DATE=$(date +'%Y-%m-%d_%H-%M-%S')
SCRIPT_DIR="/usr/IBM/WebSphere/AppServer/bin/"
BACKUP_PROFILE="/tmp/profiles/"
LOGS_PROFILE="/tmp/profiles/was_profile_${LOCALHOST}_log_${DATE}.log"
ARCHIVO="was_profile_${LOCALHOST}_${DATE}.zip"
UMBRAL_MB=1024  # umbral en MB
# Verificar espacio en disco
DISK_USADO_KB=$(df "$BACKUP_PROFILE" | awk 'NR==2{print $4}')
DISK_USADO_MB=$(("$DISK_USADO_KB"/"$UMBRAL_MB"))
# Comparar con umbral
if [ "$DISK_USADO_MB" -lt "$UMBRAL_MB" ]; then
    echo "$(date) - Espacio insuficiente para realizar backup." >> "$LOGS_PROFILE"
    # Aquí NO enviamos correo, solo registramos y salimos
    exit 1
fi

# Crear directorios si no existen
mkdir -p "$BACKUP_PROFILE"

# Ejecutar backup
"$SCRIPT_DIR/backupConfig.sh" "$BACKUP_PROFILE/$ARCHIVO" -nostop >> "$LOGS_PROFILE" 2>&1

# Verificar si el backup fue exitoso
if [ $? -eq 0 ]; then
    echo "$DATE - Backup realizado exitosamente" >> "$LOGS_PROFILE"
else
    echo "$DATE - Error al realizar el backup" >> "$LOGS_PROFILE"
fi