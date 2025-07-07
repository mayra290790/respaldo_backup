<<<<<<< HEAD
#!/usr/bin/ksh
# Variables
localhost=$(hostname)
fecha=$(date +%y-%m-%d)
BACKUP_COBISHOME="/cobishome/backups_ctstest5"
LOGS_COBISHOME="/cobishome/backups_ctstest5/cobishome_${localhost}_backup.log"
# Ruta de la carpeta cobishome
COBISHOME_PATH="/cobishome/"

# Eliminar backups anteriores
#rm -f "$BACKUP_COBISHOME/$COBISHOME_BACKUP"
#rm -f "$BACKUP_COBISHOME/$LOGS_COBISHOME"

# Hacer respaldo de la carpeta cobishome
echo "Generando tar"
cd $COBISHOME_PATH;
tar -cvf $BACKUP_COBISHOME/cobishome_"$localhost"_$fecha.tar -X excluirbackups.txt . 

echo "Comprimiendo tar"
gzip $BACKUP_COBISHOME/cobishome_"$localhost"_$fecha.tar

# Verificacion del backup
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup de cobishome realizado exitosamente" >> "$LOGS_COBISHOME"
	
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar cobishome " >> "$LOGS_COBISHOME"
	
fi

=======
#!/usr/bin/ksh
# Variables
localhost=$(hostname)
fecha=$(date +%y-%m-%d)
BACKUP_COBISHOME="/cobishome/backups_ctstest5"
LOGS_COBISHOME="/cobishome/backups_ctstest5/cobishome_${localhost}_backup.log"
# Ruta de la carpeta cobishome
COBISHOME_PATH="/cobishome/"

# Eliminar backups anteriores
#rm -f "$BACKUP_COBISHOME/$COBISHOME_BACKUP"
#rm -f "$BACKUP_COBISHOME/$LOGS_COBISHOME"

# Hacer respaldo de la carpeta cobishome
echo "Generando tar"
cd $COBISHOME_PATH;
tar -cvf $BACKUP_COBISHOME/cobishome_"$localhost"_$fecha.tar -X excluirbackups.txt . 

echo "Comprimiendo tar"
gzip $BACKUP_COBISHOME/cobishome_"$localhost"_$fecha.tar

# Verificacion del backup
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup de cobishome realizado exitosamente" >> "$LOGS_COBISHOME"
	
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar cobishome " >> "$LOGS_COBISHOME"
	
fi

>>>>>>> 7e8873460e85ef9cd782ece6c547d219ad0e430d
