#!/bin/bash

# Obtener hostname
localhost=$(hostname)

# Variables
SCRIPT_DIR="/usr/IBM/WebSphere/AppServer/bin/"
BACKUP_PROFILE="/home/wasadmin/backups/"
LOGS_PROFILE="/home/wasadmin/backup/was_profile_${localhost}_log_backup.log"
ARCHIVO="was_profile_${localhost}_Backup.zip"  # Archivo fijo para sobreescribir

# Crear el directorio si no existe
mkdir -p "$BACKUP_PROFILE"

# Eliminar el backup anterior si existe
rm -f "$BACKUP_PROFILE/$ARCHIVO"

# Ejecutar el backup
"$SCRIPT_DIR/backupConfig.sh" "$BACKUP_PROFILE/$ARCHIVO" -nostop >> "$LOGS_PROFILE" 2>&1

# Verificación del éxito
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup realizado exitosamente" >> "$LOGS_PROFILE"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar el backup" >> "$LOGS_PROFILE"
fi