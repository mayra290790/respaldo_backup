<<<<<<< HEAD
#!/usr/bin/ksh

localhost=$(hostname)
fecha=$(date +%y-%m-%d)

# Variables
BACKUP_COBISAPP="/cobishome/backups_ctstest5"
LOGS_COBISAPP="/cobishome/backups_ctstest5/cobisapp_${localhost}_backup.log"

# Ruta de la carpeta cobisapp
COBISAPP_PATH="/cobisapp/"
COBISAPP_BACKUP="cobisapp_backup_${localhost}.zip"


# Eliminar backups anteriores
#rm -f "$BACKUP_COBISAPP/$ARCHIVO"
#rm -f "$BACKUP_COBISAPP/$COBISAPP_BACKUP"
#rm -f "$BACKUP_COBISAPP/$LOGS_COBISAPP"

# Hacer respaldo de la carpeta cobisapp
echo "Generando tar"
cd $COBISAPP_PATH;
tar -cvf $BACKUP_COBISAPP/cobisapp_"$localhost"_$fecha.tar .

echo "Comprimiendo tar"
gzip $BACKUP_COBISAPP/cobisapp_"$localhost"_$fecha.tar
#tar cvf - /"$COBISAPP_PATH"/CIS/SERVICES /"$COBISAPP_PATH"/CTS_MF_WS /"$COBISAPP_PATH"/CTS_MF /"$COBISAPP_PATH"/CTS_MF | gzip > "$BACKUP_COBISAPP"/"$COBISAPP_BACKUP"
# Verificacion del backup
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup de cobisapp realizado exitosamente" >> "$LOGS_COBISAPP"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar  Backup cobisapp " >> "$LOGS_COBISAPP"
fi
=======
#!/usr/bin/ksh

localhost=$(hostname)
fecha=$(date +%y-%m-%d)

# Variables
BACKUP_COBISAPP="/cobishome/backups_ctstest5"
LOGS_COBISAPP="/cobishome/backups_ctstest5/cobisapp_${localhost}_backup.log"

# Ruta de la carpeta cobisapp
COBISAPP_PATH="/cobisapp/"
COBISAPP_BACKUP="cobisapp_backup_${localhost}.zip"


# Eliminar backups anteriores
#rm -f "$BACKUP_COBISAPP/$ARCHIVO"
#rm -f "$BACKUP_COBISAPP/$COBISAPP_BACKUP"
#rm -f "$BACKUP_COBISAPP/$LOGS_COBISAPP"

# Hacer respaldo de la carpeta cobisapp
echo "Generando tar"
cd $COBISAPP_PATH;
tar -cvf $BACKUP_COBISAPP/cobisapp_"$localhost"_$fecha.tar .

echo "Comprimiendo tar"
gzip $BACKUP_COBISAPP/cobisapp_"$localhost"_$fecha.tar
#tar cvf - /"$COBISAPP_PATH"/CIS/SERVICES /"$COBISAPP_PATH"/CTS_MF_WS /"$COBISAPP_PATH"/CTS_MF /"$COBISAPP_PATH"/CTS_MF | gzip > "$BACKUP_COBISAPP"/"$COBISAPP_BACKUP"
# Verificacion del backup
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup de cobisapp realizado exitosamente" >> "$LOGS_COBISAPP"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar  Backup cobisapp " >> "$LOGS_COBISAPP"
fi
>>>>>>> 7e8873460e85ef9cd782ece6c547d219ad0e430d
