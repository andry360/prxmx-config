#!/bin/bash

# Il comando per lanciare questo script da github è: bash -c "$(wget -qLO - https://raw.githubusercontent.com/andry360/prxmx-post-script/refs/heads/main/start_local.sh)"
echo "Script progetto proxmox v1"

GITHUB_URL_= "https://raw.githubusercontent.com/andry360/prxmx-post-script/refs/heads/main/"

# Elenco degli script
scripts=(
    "https://raw.githubusercontent.com/andry360/prxmx-post-script/refs/heads/main/1_pxmx-post-install.sh Script post-installazione Proxmox con git"
    "https://gitlab.com/andry360/prxmx-config/-/raw/main/start_local.sh?ref_type=heads Avvio script gitlab"
)

# Mostra l'elenco numerato
echo "Seleziona lo script da eseguire:"
for i in "${!scripts[@]}"; do
    echo "$((i+1)) - ${scripts[$i]#* }"
done

# Leggi la scelta dell'utente
read -p "Inserisci il numero dello script da eseguire: " choice

# Controlla se la scelta è valida
if [[ "$choice" -ge 1 && "$choice" -le ${#scripts[@]} ]]; then
    # Seleziona l'URL dello script scelto
    script_url="${scripts[$((choice-1))]%% *}"
    echo "Eseguendo lo script: ${scripts[$((choice-1))]#* }"
    # Esegui lo script selezionato
    bash -c "$(wget -qLO - $script_url)"
else
    echo "Scelta non valida. Uscita."
    exit 1
fi
