<<<<<<< HEAD
#!/usr/bin/ksh
# Variables
fecha=$(date +%y-%m-%d)
localhost=$(hostname)
PROFILE="AppSrv"
SCRIPT_DIR="/usr/IBM/WebSphere7/AppServer/profiles/AppSrv/bin"
BACKUP_PROFILE="/cobishome/backups_ctstest5"
LOGS_PROFILE="/cobishome/backups_ctstest5/$PROFILE_${localhost}_backup.log"


# Crear el directorio si no existe
#mkdir -p "$BACKUP_PROFILE"

# Eliminar el backup anterior si existe
#rm -f "$BACKUP_PROFILE/$ARCHIVO"

# Ejecutar el backup
echo "Generando respaldo"
"$SCRIPT_DIR/backupConfig.sh" $BACKUP_PROFILE/"$PROFILE"_$fecha.zip -nostop >> "$LOGS_PROFILE" 2>&1

# Verificación del exito
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup realizado exitosamente" >> "$LOGS_PROFILE"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar el backup" >> "$LOGS_PROFILE"
=======
#!/usr/bin/ksh
# Variables
fecha=$(date +%y-%m-%d)
localhost=$(hostname)
PROFILE="AppSrv"
SCRIPT_DIR="/usr/IBM/WebSphere7/AppServer/profiles/AppSrv/bin"
BACKUP_PROFILE="/cobishome/backups_ctstest5"
LOGS_PROFILE="/cobishome/backups_ctstest5/$PROFILE_${localhost}_backup.log"


# Crear el directorio si no existe
#mkdir -p "$BACKUP_PROFILE"

# Eliminar el backup anterior si existe
#rm -f "$BACKUP_PROFILE/$ARCHIVO"

# Ejecutar el backup
echo "Generando respaldo"
"$SCRIPT_DIR/backupConfig.sh" $BACKUP_PROFILE/"$PROFILE"_$fecha.zip -nostop >> "$LOGS_PROFILE" 2>&1

# Verificación del exito
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup realizado exitosamente" >> "$LOGS_PROFILE"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar el backup" >> "$LOGS_PROFILE"
>>>>>>> 7e8873460e85ef9cd782ece6c547d219ad0e430d
fi