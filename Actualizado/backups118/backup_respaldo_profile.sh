#!/usr/bin/ksh
# Variables
fecha=$(date +%y-%m-%d)
localhost=$(hostname)
PROFILE="AppServer01"
PROFILE2="AppServer02"
SCRIPT_DIR="/usr/IBM/WebSphere/AppServer/profiles/AppServer01/bin/"
SCRIPT_DIR2="/usr/IBM/WebSphere/AppServer/profiles/AppServer02/bin/"
BACKUP_PROFILE="/cobishome/backups_P690_CTS_1"
BACKUP_PROFILE2="/cobishome2/backups_P690_CTS_2"
LOGS_PROFILE="/cobishome/backups_P690_CTS_1/$PROFILE_${localhost}_backup.log"
LOGS_PROFILE2="/cobishome2/backups_P690_CTS_2/$PROFILE2_${localhost}_backup.log"


# Crear el directorio si no existe
#mkdir -p "$BACKUP_PROFILE"

# Eliminar el backup anterior si existe
#rm -f "$BACKUP_PROFILE/$ARCHIVO"

# Ejecutar el backup
echo "Generando respaldo Profile AppServer01 "
"$SCRIPT_DIR/backupConfig.sh" $BACKUP_PROFILE/"$PROFILE"_$fecha.zip -nostop >> "$LOGS_PROFILE" 2>&1

echo "Generando respaldo Profile AppServer02"
"$SCRIPT_DIR2/backupConfig.sh" $BACKUP_PROFILE2/"$PROFILE2"_$fecha.zip -nostop >> "$LOGS_PROFILE2" 2>&1

# Verificación del exito
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup realizado exitosamente" >> "$LOGS_PROFILE"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar el backup" >> "$LOGS_PROFILE2"
fi