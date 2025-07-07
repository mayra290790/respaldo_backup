#!/bin/bash

# Obtener hostname
localhost=$(hostname)

# Definir la fecha para usar en el nombre del archivo y logs
DATE=$(date +'%Y-%m-%d_%H-%M-%S')

# Variables
SCRIPT_DIR="/usr/IBM/WebSphere/AppServer/bin/"
BACKUP_PROFILE="/tmp/profiles/"
LOGS_PROFILE="/tmp/profiles/was_profile_${localhost}_log_${DATE}.log"
ARCHIVO="was_profile_${localhost}_${DATE}.zip"

# Crear los directorios si no existen
mkdir -p "$BACKUP_PROFILE"

# Ejecutar el backup
"$SCRIPT_DIR/backupConfig.sh" "$BACKUP_PROFILE/$ARCHIVO" -nostop >> "$LOGS_PROFILE" 2>&1

# Verificación del éxito
if [ $? -eq 0 ]; then
    echo "$DATE - Backup realizado exitosamente" >> "$LOGS_PROFILE"
else
    echo "$DATE - Error al realizar el backup" >> "$LOGS_PROFILE"
fi