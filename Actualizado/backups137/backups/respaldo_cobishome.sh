#!/usr/bin/ksh
# Variables
localhost=$(hostname)
BACKUP_COBISHOME="/cobishome/backups_SOC2_CTS_1/"
BACKUP_COBISHOME2="/cobishomeINT/backups_SOC2_CTS_2/"
LOGS_COBISHOME="/cobishome/backups_SOC2_CTS_1/cobishome_${localhost}_backup.log"
LOGS_COBISHOME2="/cobishomeINT/backups_SOC2_CTS_2/cobishomeINT_${localhost}_backup.log"
# Ruta de la carpeta cobishome
COBISHOME_PATH="/cobishome/"
COBISHOME_PATH2="/cobishomeINT/"

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
gzip $BACKUP_COBISHOME/cobishome_"$localhost"_$fecha.tar

echo "Generando tar de cobishomeINT"
cd $COBISHOME_PATH2;
tar -cvf $BACKUP_COBISHOME2/cobishomeINT_"$localhost"_$fecha.tar -X excluirbackups.txt . 

echo "Comprimiendo tar"
gzip $BACKUP_COBISHOME2/cobishomeINT_"$localhost"_$fecha.tar

# Verificacion del backup
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup de cobishome realizado exitosamente" >> "$LOGS_COBISHOME"
	echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup de cobishome realizado exitosamente" >> "$LOGS_COBISHOME2"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar cobishome " >> "$LOGS_COBISHOME"
	echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar cobishome " >> "$LOGS_COBISHOME2"
fi
