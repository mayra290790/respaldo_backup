<<<<<<< HEAD
#!/usr/bin/ksh
# Variables
localhost=$(hostname)
fecha=$(date +%y-%m-%d)

BACKUP_COBISAPP="/cobishome/backups_SOC2_CTS_1/"
LOGS_COBISAPP="/cobishome/backups_SOC2_CTS_1/cobisapp_${localhost}_backup.log"

# Ruta de la carpeta cobisapp
COBISAPP_PATH="/cobisapp/"


# se crea directorio que no existe
#mkdir -p "$BACKUP_COBISAPP"

# Eliminar backups anteriores
#rm -f "$BACKUP_COBISAPP/$ARCHIVO"
#rm -f "$BACKUP_COBISAPP/$COBISAPP_BACKUP"
#rm -f "$BACKUP_COBISAPP/$LOGS_COBISAPP"

# Hacer respaldo de la carpeta cobisapp

echo "Generando tar cobisapp"
cd $COBISAPP_PATH;
tar -cvf $BACKUP_COBISAPP/cobisapp_"$localhost"_$fecha.tar .
echo "Comprimiendo tar"
gzip $BACKUP_COBISAPP/cobisapp_"$localhost"_$fecha.tar


# Verificacion del backup
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup de cobisapp realizado exitosamente" >> "$LOGS_COBISAPP"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar  Backup cobisapp " >> "$LOGS_COBISAPP"
fi
=======
#!/usr/bin/ksh
# Variables
localhost=$(hostname)
fecha=$(date +%y-%m-%d)

BACKUP_COBISAPP="/cobishome/backups_SOC2_CTS_1/"
LOGS_COBISAPP="/cobishome/backups_SOC2_CTS_1/cobisapp_${localhost}_backup.log"

# Ruta de la carpeta cobisapp
COBISAPP_PATH="/cobisapp/"


# se crea directorio que no existe
#mkdir -p "$BACKUP_COBISAPP"

# Eliminar backups anteriores
#rm -f "$BACKUP_COBISAPP/$ARCHIVO"
#rm -f "$BACKUP_COBISAPP/$COBISAPP_BACKUP"
#rm -f "$BACKUP_COBISAPP/$LOGS_COBISAPP"

# Hacer respaldo de la carpeta cobisapp

echo "Generando tar cobisapp"
cd $COBISAPP_PATH;
tar -cvf $BACKUP_COBISAPP/cobisapp_"$localhost"_$fecha.tar .
echo "Comprimiendo tar"
gzip $BACKUP_COBISAPP/cobisapp_"$localhost"_$fecha.tar


# Verificacion del backup
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup de cobisapp realizado exitosamente" >> "$LOGS_COBISAPP"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar  Backup cobisapp " >> "$LOGS_COBISAPP"
fi
>>>>>>> 7e8873460e85ef9cd782ece6c547d219ad0e430d
