#!/bin/bash

# Inclure le fichier utilitaire
source ./utils.sh

# Vérifier que Suricata est installé
if ! command -v suricata &> /dev/null; then
    echo "Suricata n'est pas installé. Veuillez exécuter install_suricata.sh d'abord."
    exit 1
fi

# Modifier la configuration de Suricata
echo "Modification de la configuration de Suricata..."
sudo sed -i 's/community-id:false/community-id:true/' /etc/suricata/suricata.yaml || { echo "Erreur lors de la modification de community-id."; exit 1; }
sudo sed -i 's/af-packet:/af-packet:\n  - interface: ens33/' /etc/suricata/suricata.yaml || { echo "Erreur lors de la configuration de l'interface."; exit 1; }

# Ajouter la ligne pour recharger les règles
echo "detect-engine:" >> /etc/suricata/suricata.yaml || { echo "Erreur lors de l'ajout de detect-engine."; exit 1; }
echo "  - rule-reload: true" >> /etc/suricata/suricata.yaml || { echo "Erreur lors de l'ajout de rule-reload."; exit 1; }

# Redémarrer le service Suricata
echo "Redémarrage de Suricata..."
sudo service suricata restart || { echo "Erreur lors du redémarrage de Suricata."; exit 1; }

# Mettre à jour les règles après configuration
echo "Mise à jour des règles de Suricata..."
sudo suricata-update || { echo "Erreur lors de la mise à jour des règles."; exit 1; }

# Vérifier le fonctionnement de Suricata
echo "Vérification de la configuration de Suricata..."
sudo kill -USR2 $(pidof suricata)
if ! sudo suricata -T -c /etc/suricata/suricata.yaml -v; then 
    echo "Erreur dans la vérification de la configuration."; 
    exit 1; 
fi

# Configurer UFW pour utiliser NFQUEUE
echo "Configuration d'UFW pour utiliser NFQUEUE..."
{
    echo "*filter"
    echo ":INPUT ACCEPT [0:0]"
    echo ":FORWARD ACCEPT [0:0]"
    echo ":OUTPUT ACCEPT [0:0]"
    echo "-I INPUT -j NFQUEUE"
    echo "-I OUTPUT -j NFQUEUE"
    echo "COMMIT"
} | sudo tee /etc/ufw/before.rules > /dev/null

# Activer UFW si ce n'est pas déjà fait
if ! sudo ufw status | grep -q 'active'; then 
    echo "Activation d'UFW..."
    sudo ufw enable || { echo "Erreur lors de l'activation d'UFW."; exit 1; }
fi

# Changer le mode d'écoute dans le fichier default sur icône nfqueue.
sudo sed -i 's/^LISTENMODE=.*/#LISTENMODE=af-packet\nLISTENMODE=nfqueue/' /etc/default/suricata || { echo "Erreur lors du changement du mode d'écoute."; exit 1; }

# Redémarrer le service après modification du mode d'écoute.
sudo service suricata restart || { echo "Erreur lors du redémarrage après modification du mode d'écoute."; exit 1; }

echo "Configuration terminée."

