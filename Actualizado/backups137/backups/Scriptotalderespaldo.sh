<<<<<<< HEAD
#!/usr/bin/sh
# Variables donde estan los scripts
fecha=$(date +%y-%m-%d)

script1="/home/wasadmin/backups/respaldo_cobisapp.sh"
script2="/home/wasadmin/backups/backup_respaldo_profile.sh"
script3="/home/wasadmin/backups/respaldo_profile_mq.sh"
script4="/home/wasadmin/backups/respaldo_cobishome.sh"
# Archivo de log
log_file="/home/wasadmin/backups/registro_ejecucion_$fecha.log"

# Ejecucion y verificacion de los scripts
ejecutar_script() {
    local script_path=$1
    local script_name=$(basename "$script_path")
    
    echo "Ejecutando $script_name..." | tee -a "$log_file"
    
    # Ejecuta directamente el script si tiene permisos y shebang correcto
    "$script_path" >> "$log_file" 2>&1
    if [ $? -eq 0 ]; then
        echo "$script_name se ejecucion con exito." | tee -a "$log_file"
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

=======
#!/usr/bin/sh
# Variables donde estan los scripts
fecha=$(date +%y-%m-%d)

script1="/home/wasadmin/backups/respaldo_cobisapp.sh"
script2="/home/wasadmin/backups/backup_respaldo_profile.sh"
script3="/home/wasadmin/backups/respaldo_profile_mq.sh"
script4="/home/wasadmin/backups/respaldo_cobishome.sh"
# Archivo de log
log_file="/home/wasadmin/backups/registro_ejecucion_$fecha.log"

# Ejecucion y verificacion de los scripts
ejecutar_script() {
    local script_path=$1
    local script_name=$(basename "$script_path")
    
    echo "Ejecutando $script_name..." | tee -a "$log_file"
    
    # Ejecuta directamente el script si tiene permisos y shebang correcto
    "$script_path" >> "$log_file" 2>&1
    if [ $? -eq 0 ]; then
        echo "$script_name se ejecucion con exito." | tee -a "$log_file"
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

>>>>>>> 7e8873460e85ef9cd782ece6c547d219ad0e430d
echo "Proceso completo." | tee -a "$log_file"