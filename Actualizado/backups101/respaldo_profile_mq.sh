#!/usr/bin/ksh
#Variables 
fecha=$(date +%y-%m-%d)
localhost=$(hostname)
QMANAGER1="QM.COBISTS"
DESTINO_BACKUP="/cobishome/backups_cobissrv2_CTS_1"
LOGS_PROFILE="/cobishome/backups_cobissrv2_CTS_1/QM.COBISTS_${localhost}_backup.log"

#T=$(date +"%Y%m%d_%H%M%S")
# Crear el directorio si no existe
#mkdir -p "$DESTINO_BACKUP"

# Comando de respaldo
echo "Generando Backup QM.COBISTS " 
dmpmqcfg -m "$QMANAGER1" -a > "$DESTINO_BACKUP/QM.COBISTS_$fecha.mqsc" 


# Verificación del éxito
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup realizado exitosamente" >> "$LOGS_PROFILE"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar el backup" >> "$LOGS_PROFILE"
fi