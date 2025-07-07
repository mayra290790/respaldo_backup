#!/usr/bin/ksh
# Variables
localhost=$(hostname)
fecha=$(date +%y-%m-%d)

BACKUP_COBISHOME="/cobishome/backups_cobissrv2_CTS_1/"
LOGS_COBISHOME="/cobishome/backups_cobissrv2_CTS_1/cobishome_${localhost}_backup.log"


# Ruta de la carpeta cobishome
COBISHOME_PATH="/cobishome/"

# se crea directorio que no existe
#mkdir -p "$BACKUP_COBISHOME"
#mkdir -p "$BACKUP_COBISHOME2"
# Eliminar backups anteriores
#rm -f "$BACKUP_COBISHOME/$ARCHIVO"
#rm -f "$BACKUP_COBISHOME/$COBISHOME_BACKUP"
#rm -f "$BACKUP_COBISHOME/$LOGS_COBISHOME"
#rm -f "$BACKUP_COBISHOME/$ARCHIVO2"
#rm -f "$BACKUP_COBISHOME/$COBISHOME_BACKUP2"
#rm -f "$BACKUP_COBISHOME/$LOGS_COBISHOME2"

# Hacer respaldo de la carpeta cobishome
echo "Generando tar"
cd $COBISHOME_PATH;
tar -cvf $BACKUP_COBISHOME/cobishome_"$localhost"_$fecha.tar -X excluirbackups.txt . 
echo "Comprimiendo tar"
gzip -9 $BACKUP_COBISHOME/cobishome_"$localhost"_$fecha.tar
echo "Generando tar de /cobishomeT"

# Verificacion del backup
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup de cobishome realizado exitosamente" >> "$LOGS_COBISHOME"
	echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup de cobishome realizado exitosamente" >> "$LOGS_COBISHOME2"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar cobishome " >> "$LOGS_COBISHOME"
	echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar cobishome " >> "$LOGS_COBISHOME2"
fi
