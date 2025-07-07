#!/usr/bin/ksh

localhost=$(hostname)

# Variables
localhost=$(hostname)
BACKUP_COBISAPP="/home/wasadmin/backups/cobisapp/"
LOGS_COBISAPP="/home/wasadmin/backups/cobisapp/cobisapp_${localhost}_backup.log"
ARCHIVO="cobisapp_${localhost}_Backup.zip"

# Ruta de la carpeta cobisapp
COBISAPP_PATH="/cobisapp/"
COBISAPP_BACKUP="cobisapp_backup_${localhost}.zip"

# se crea directorio que no existe
mkdir -p "$BACKUP_COBISAPP"

# Eliminar backups anteriores
rm -f "$BACKUP_COBISAPP/$ARCHIVO"
rm -f "$BACKUP_COBISAPP/$COBISAPP_BACKUP"
rm -f "$BACKUP_COBISAPP/$LOGS_COBISAPP"

# Hacer respaldo de la carpeta cobisapp
tar cvf - /"$COBISAPP_PATH"/CIS/SERVICES /"$COBISAPP_PATH"/CTS_MF_WS /"$COBISAPP_PATH"/CTS_MF /"$COBISAPP_PATH"/CTS_MF | gzip > "$BACKUP_COBISAPP"/"$COBISAPP_BACKUP"
# Verificacion del backup
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup de cobisapp realizado exitosamente" >> "$LOGS_COBISAPP"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar  Backup cobisapp " >> "$LOGS_COBISAPP"
fi
