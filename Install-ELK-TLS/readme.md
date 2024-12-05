# Configuration pour Elasticsearch, Kibana et Logstash


## Description

Ce script installe et configure la stack Elastic (Elasticsearch, Kibana et Logstash) sur une seule machine, en utilisant les paramètres définis dans le fichier .env. Il exécute également plusieurs tâches, telles que la génération de certificats auto-signés et la configuration des fichiers nécessaires. 

Nous allons mettre en place une stack Elastic comprenant Elasticsearch, Kibana et Logstash, tout en assurant la sécurité des communications entre les différents composants grâce à des certificats auto-signés.

## Exigences Matérielles
Pour une installation optimale, la machine doit répondre aux exigences suivantes :
- CPU: 8 cœurs ou plus
- RAM: Minimum 16 Go
- Stockage: Minimum 100 Go

## Utilisation
1. Assurez-vous d'avoir défini les variables nécessaires dans le fichier .env avant d'exécuter ce script.
2. Exécutez le script en tant qu'utilisateur avec les privilèges suffisants.

## Installation
Pour installer et utiliser ce script :
1. Clonez ce dépôt Git sur votre machine locale :
   ```bash
   git clone https://github.com/Laabidialaa/Supcom-Keystone-Project.git
   cd Install-ELK-TLS
   cp env.sample .env #modifier .env selon vos préférences n oublier pas de modifier la valeur IP_ADDRESS à celle de votre machine
   chmod +x main.sh
   sudo ./main.sh

## Réinitialisation du mot de passe Elasticsearch

Si vous n'avez pas sauvegardé le mot de passe généré pour Elasticsearch lors de l'installation, vous pouvez le réinitialiser en exécutant la commande suivante :
1. Command:
   ```bash
   /usr/share/elasticsearch/bin/elasticsearch-reset-password -i -u elastic --url https://ip_address:http_port


## Kibana URL
Après l'installation, vous pouvez accéder à Kibana via l'URL suivante : https://votre-adresse-ip:5601
N'oubliez pas de remplacer `votre-adresse-ip` par l'adresse IP de votre serveur où Kibana est installé. 'username' : elastic et 'password' : celui généré lors de l'installation ou ce que vous venez juste de réinitialiser
N'oublier pas d'autoriser le port de kibana si le firewall est activer
Exemple centos 7 
1. Command:
   ```bash
   firewall-cmd --zone=public --add-port=5601/tcp --permanent
   firewall-cmd --reload


