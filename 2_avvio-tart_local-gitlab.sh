#!/usr/bin/env bash

# Percorso target
target_dir="/opt/prxmx-config"

# Controlla se lo script è eseguito dalla cartella corretta
if [ "$(pwd)" != "$target_dir" ]; then
    echo "Non sei in $target_dir. Spostamento in corso..."
    cd "$target_dir" || { echo "Errore: impossibile accedere a $target_dir"; exit 1; }
fi

echo "Ora sei in $(pwd). Avvio di start_local.sh..."

# Avvia lo script
./start_local.sh
