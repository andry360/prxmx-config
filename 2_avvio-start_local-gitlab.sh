#!/usr/bin/env bash

# Percorso target
target_dir="/opt/prxmx-config"

# Controlla se lo script è eseguito dalla cartella corretta
if [ "$(pwd)" != "$target_dir" ]; then
    echo "Non sei in $target_dir. Spostamento in corso..."
    cd "$target_dir" || { echo "Errore: impossibile accedere a $target_dir"; exit 1; }
fi

echo "Ora sei in $(pwd). Aggiornamento repository..."

# Esegui git pull per aggiornare la repository
if git rev-parse --is-inside-work-tree &>/dev/null; then
    git reset --hard origin/main
    git pull origin main
    echo "Repository aggiornata con successo!"
else
    echo "❌ Errore: /opt/prxmx-config non è un repository Git valida."
    exit 1
fi

echo "Avvio di start_local.sh..."
./start_local.sh
