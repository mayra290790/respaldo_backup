#!/usr/bin/ksh
#Variables 
localhost=$(hostname)
QUUE_MANAGER1="QM.COBISTS"
QUUE_MANAGER2="QM.COBISMT"
DESTINO_BACKUP="/home/wasadmin/backups/Profile/MQM"
LOGS_PROFILE="/home/wasadmin/backups/Profile/MQM/mq_profile_${localhost}_log_backup.log"
# Variables para el nombre del archivo
W="respaldo_"
T=$(date +"%Y%m%d_%H%M%S")
# Crear el directorio si no existe
mkdir -p "$DESTINO_BACKUP"
# Comando de respaldo
dmpmqcfg -m "$QUUE_MANAGER1" -a > "$DESTINO/${W}bkp_QM.COBISTS_.mqsc"
dmpmqcfg -m "$QUUE_MANAGER2" -a > "$DESTINO/${W}bkp_QM.COBISMT_.mqsc"
# Verificación del éxito
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup realizado exitosamente" >> "$LOGS_PROFILE"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar el backup" >> "$LOGS_PROFILE"
fi