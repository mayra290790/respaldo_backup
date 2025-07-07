#!/usr/bin/ksh
# Variables
localhost=$(hostname)
fecha=$(date +%y-%m-%d)

BACKUP_COBISAPP="/cobishome/backups_P690_CTS_1/"
LOGS_COBISAPP="/cobishome/backups_P690_CTS_1/cobisapp_${localhost}_backup.log"
BACKUP_COBISAPP2="/cobishome2/backups_P690_CTS_2/"
LOGS_COBISAPP="/cobishome2/backups_P690_CTS_2/cobisapp2_${localhost}_backup.log"


# Ruta de la carpeta cobisapp
COBISAPP_PATH="/cobisapp/"
COBISAPP_PATH2="/cobisapp2/"

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

echo "Generando tar cobisapp2"
cd $COBISAPP_PATH2;
tar -cvf $BACKUP_COBISAPP2/cobisapp2_"$localhost"_$fecha.tar .
echo "Comprimiendo tar"
gzip $BACKUP_COBISAPP2/cobisapp2_"$localhost"_$fecha.tar

# Verificacion del backup
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup de cobisapp realizado exitosamente" >> "$LOGS_COBISAPP"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar  Backup cobisapp " >> "$LOGS_COBISAPP"
fi
