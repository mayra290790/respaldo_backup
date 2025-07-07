#!/usr/bin/ksh
# Variables
localhost=$(hostname)
SCRIPT_DIR="/usr/IBM/WebSphere/AppServer/bin/"
BACKUP_PROFILE="/home/wasadmin/backups/Profile/WAS"
LOGS_PROFILE="/home/wasadmin/backups/Profile/WAS/was_profile_${localhost}_log_backup.log"
ARCHIVO="was_profile_${localhost}_Backup.zip"
BACKUP_COBISAPP="/home/wasadmin/backups/cobisapp/"
LOGS_COBISAPP="/home/wasadmin/backups/cobisapp/cobisapp_${localhost}_backup.log"
ARCHIVO="cobisapp_${localhost}_Backup.zip"
BACKUP_COBISHOME="/home/wasadmin/backups/cobishome/"
LOGS_COBISHOME="/home/wasadmin/backups/cobishome/cobishome_${localhost}_backup.log"
ARCHIVO="cobishome_${localhost}_Backup.zip"
QUUE_MANAGER1="QM.COBISTS"
QUUE_MANAGER2="QM.COBISMT"
DESTINO_BACKUP="/home/wasadmin/backups/Profile/MQM"
LOGS_PROFILE="/home/wasadmin/backups/Profile/MQM/mq_profile_${localhost}_log_backup.log"
W="respaldo_"
T=$(date +"%Y%m%d_%H%M%S")

# Crear el directorio si no existe
mkdir -p "$BACKUP_PROFILE"
mkdir -p "$BACKUP_COBISAPP"
mkdir -p "$BACKUP_COBISHOME"
mkdir -p "$DESTINO_BACKUP"

# Eliminar el backup anterior si existe
rm -f "$BACKUP_PROFILE/$ARCHIVO"
rm -f "$BACKUP_COBISAPP/$COBISAPP_BACKUP"
rm -f "$BACKUP_COBISAPP/$LOGS_COBISAPP"
rm -f "$BACKUP_COBISHOME/$ARCHIVO"
rm -f "$BACKUP_COBISHOME/$COBISHOME_BACKUP"
rm -f "$BACKUP_COBISHOME/$LOGS_COBISHOME"

# Ejecutar el backup

"$SCRIPT_DIR/backupConfig.sh" "$BACKUP_PROFILE/$ARCHIVO" -nostop >> "$LOGS_PROFILE" 2>&1
tar cvf - /"$COBISAPP_PATH"/CIS/SERVICES /"$COBISAPP_PATH"/CTS_MF_WS /"$COBISAPP_PATH"/CTS_MF /"$COBISAPP_PATH"/CTS_MF | gzip > "$BACKUP_COBISAPP"/"$COBISAPP_BACKUP"
tar -czf "$BACKUP_COBISHOME/$COBISHOME_BACKUP" --exclude="$COBISHOME_PATH/logs" -C "$(dirname "$COBISHOME_PATH")" "$(basename "$COBISHOME_PATH")"
dmpmqcfg -m "$QUUE_MANAGER1" -a > "$DESTINO/${W}bkp_QM.COBISTS_.mqsc"
dmpmqcfg -m "$QUUE_MANAGER2" -a > "$DESTINO/${W}bkp_QM.COBISMT_.mqsc"

# Verificación del éxito
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup realizado exitosamente" >> "$LOGS_PROFILE"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar el backup" >> "$LOGS_PROFILE"
fi