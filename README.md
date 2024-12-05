# Configuration pour Elasticsearch, Kibana et Logstash
Ce script installe et configure la stack Elastic (Elasticsearch, Kibana et Logstash) sur une seule machine, en utilisant les paramètres définis dans le fichier .env. Il exécute également plusieurs tâches, telles que la génération de certificats auto-signés et la configuration des fichiers nécessaires. Nous allons mettre en place une stack Elastic comprenant Elasticsearch, Kibana et Logstash, tout en assurant la sécurité des communications entre les différents composants grâce à des certificats auto-signés.
# Utilisation
1-Assurez-vous d'avoir défini les variables nécessaires dans le fichier .env avant d'exécuter ce script.
2-Exécutez le script en tant qu'utilisateur avec les privilèges suffisants.
