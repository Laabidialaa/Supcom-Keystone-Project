#!/bin/bash

# Inclure le fichier utilitaire
source ./utils.sh

# Vérifier la distribution Linux
detect_linux_distribution

# Mettre à jour les paquets Ubuntu
echo "Mise à jour des paquets..."
sudo apt-get update && sudo apt-get upgrade -y || { echo "Échec de la mise à jour des paquets."; exit 1; }

# Ajouter le dépôt OISF pour Suricata
echo "Ajout du dépôt OISF..."
sudo add-apt-repository ppa:oisf/suricata-stable -y || { echo "Échec d'ajout du dépôt OISF."; exit 1; }
sudo apt-get update

# Installer Suricata et jq
echo "Installation de Suricata et jq..."
sudo apt-get install suricata jq -y || { echo "Échec de l'installation de Suricata."; exit 1; }

# Activer le service Suricata au démarrage
echo "Activation de Suricata au démarrage..."
sudo systemctl enable suricata.service || { echo "Erreur lors de l'activation du service Suricata."; exit 1; }

# Vérifier le statut du service Suricata
echo "Vérification du statut de Suricata..."
sudo systemctl status suricata.service

