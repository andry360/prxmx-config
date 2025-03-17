#!/usr/bin/env bash

# Il comando per lanciare questo script da github è: bash -c "$(wget --no-cache -qLO - https://raw.githubusercontent.com/andry360/prxmx-config/refs/heads/main/start.sh)"
echo "Script progetto proxmox v1.0.3"

GITHUB_URL="https://raw.githubusercontent.com/andry360/prxmx-config/refs/heads/main"

# Elenco degli script
scripts=(
    "$GITHUB_URL/1_install-git.sh|Script installazione git in Proxmox"
    "$GITHUB_URL/2_avvio-start_local-gitlab.sh|Avvio script gitlab"
)

# Mostra l'elenco numerato
echo "Seleziona lo script da eseguire:"
for i in "${!scripts[@]}"; do
    script_description="${scripts[$i]#*|}"
    echo "$((i+1)) - $script_description"
done

# Leggi la scelta dell'utente
read -p "Inserisci il numero dello script da eseguire: " choice

# Controlla se la scelta è valida
if [[ "$choice" =~ ^[0-9]+$ ]] && [[ "$choice" -ge 1 && "$choice" -le ${#scripts[@]} ]]; then
    # Seleziona l'URL dello script scelto
    script_url="${scripts[$((choice-1))]%|*}"
    script_description="${scripts[$((choice-1))]#*|}"

    echo "Eseguendo lo script: $script_description"

    # Scarica il contenuto dello script
    script_content=$(wget --no-cache -qO- "$script_url")

    # Controlla se il download è avvenuto con successo e lo esegue
    if [[ -n "$script_content" ]]; then
        echo "Scaricato con successo. Esecuzione..."
        bash -c "$script_content"
    else
        echo "❌ Errore: impossibile scaricare lo script da $script_url"
        exit 1
    fi
else
    echo "Scelta non valida. Uscita."
    exit 1
fi