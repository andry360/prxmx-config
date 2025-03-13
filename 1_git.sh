#!/usr/bin/env bash

header_info() {
  clear
  cat <<"EOF"
  Install Git and clone prxmx-config project
EOF
}

# Installazione di Git (opzionale)
install_git() {
  read -p "Do you want to install Git? (y/n): " choice
  case "$choice" in
    y|yes)
      msg_info "Installing Git"
      apt-get install -y git &>/dev/null
      msg_ok "Git installed successfully"
      ;;
    *)
      msg_error "Git installation skipped"
      ;;
  esac
}

# Clonazione della repo (opzionale)
clone_git_project() {
  read -p "Do you want to clone prxmx repository? (y/n): " choice
  case "$choice" in
    y|yes)
      # Richiedi username e token all'utente
      read -p "Enter your GitLab username: " username
      read -p "Enter your GitLab password: " password
      echo  # Vai a capo dopo l'input della pwd

      # Clona il repository utilizzando le credenziali fornite
      cd /opt/
      git clone https://username:password@gitlab.com/andry360/prxmx-config.git /opt/prxmx-config
      
      # Verifica se il clone è riuscito
      if [ $? -eq 0 ]; then
        cd /opt/prxmx-config
        msg_ok "Project cloned in /opt/prxmx-config successfully"
      else
        msg_error "Failed to clone the project. Please check your credentials and try again."
      fi
      ;;
    *)
      msg_error "Project clone skipped"
      ;;
  esac
}

# Esecuzione delle routine
start_routines() {
  header_info
  install_git
  clone_git_project
}

# Avvio dello script
start_routines
