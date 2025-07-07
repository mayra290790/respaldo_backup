#!/usr/bin/sh
# Variables donde estan los scripts
script1="/home/wasadmin/backups/respaldo_cobisapp.sh"
script2="/home/wasadmin/backups/backup_respaldo_profile.sh"
script3="/home/wasadmin/backups/respaldo_profile_mq.sh"
script4="/home/wasadmin/backups/respaldo_cobishome.sh"
# Archivo de log
log_file="/home/wasadmin/backups/registro_ejecucion.log"

# Ejecucion y verificacion de los scripts
ejecutar_script() {
    local script_path=$1
    local script_name=$(basename "$script_path")
    
    echo "Ejecutando $script_name..." | tee -a "$log_file"
    
    # Ejecuta directamente el script si tiene permisos y shebang correcto
    "$script_path" >> "$log_file" 2>&1
    if [ $? -eq 0 ]; then
        echo "$script_name se ejecutó con éxito." | tee -a "$log_file"
    else
        echo "Error al ejecutar $script_name." | tee -a "$log_file"
    fi
    echo "----------------------------------------" | tee -a "$log_file"
}
# Ejecutar los scripts
ejecutar_script "$script1"
ejecutar_script "$script2"
ejecutar_script "$script3"
ejecutar_script "$script4"

echo "Proceso completo." | tee -a "$log_file"