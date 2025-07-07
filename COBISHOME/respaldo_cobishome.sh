#!/usr/bin/ksh
# Obtener hostname
localhost=$(hostname)

# Variables
BACKUP_COBISHOME="/home/wasadmin/backups/cobishome/"
LOGS_COBISHOME="/home/wasadmin/backups/cobishome/cobishome_${localhost}_backup.log"
ARCHIVO="cobishome_${localhost}_Backup.zip"

# Ruta de la carpeta cobishome 
COBISHOME_PATH="/cobishome/"
COBISHOME_BACKUP="cobishome_backup_${localhost}.zip"

# se crea directorio que no existe
mkdir -p "$BACKUP_COBISHOME"

# Eliminar backups anteriores
rm -f "$BACKUP_COBISHOME/$ARCHIVO"
rm -f "$BACKUP_COBISHOME/$COBISHOME_BACKUP"
rm -f "$BACKUP_COBISHOME/$LOGS_COBISHOME"

# Hacer respaldo de la carpeta cobishome
tar -czf "$BACKUP_COBISHOME/$COBISHOME_BACKUP" --exclude="$COBISHOME_PATH/logs" -C "$(dirname "$COBISHOME_PATH")" "$(basename "$COBISHOME_PATH")"

# Verificación del éxito del backup
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup de cobishome realizado exitosamente" >> "$LOGS_COBISHOME"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar cobishome " >> "$LOGS_COBISHOME"
fi
