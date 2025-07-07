#!/usr/bin/ksh
#Variables 
fecha=$(date +%y-%m-%d)
localhost=$(hostname)
QMANAGER1="QM.COBISTS"
DESTINO_BACKUP="/cobishome/backups_ctstest5"
LOGS_PROFILE="/cobishome/backups_ctstest5/QM.COBISTS_${localhost}_backup.log"

# Crear el directorio si no existe
#mkdir -p "$DESTINO_BACKUP"

# Comando de respaldo
echo "Generando Backup"
dmpmqcfg -m "$QMANAGER1" -a > "$DESTINO_BACKUP/QM.COBISTS_$fecha.mqsc"
# Verificacion del exito
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup realizado exitosamente" >> "$LOGS_PROFILE"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar el backup" >> "$LOGS_PROFILE"
fi