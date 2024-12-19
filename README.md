# Implémentation du modèle
La partie suivante sera divisée en trois modules distincts 

Le premier module se concentrera sur l’installation de Suricata et le mappage de ses règles en lien avec le cadre MITRE ATT&CK Nous utiliserons le traitement du langage naturel (NLP) comme modèle de machine learning pour établir ce mappage. Cela permettra d’analyser et d’associer efficacement les règles de détection aux techniques d’attaque identifiées par MITRE.

Le deuxième module sera dédié à l’installation de la pile ELK (Elasticsearch, Log-stash, Kibana) et à son intégration avec Suricata. Cette étape est cruciale pour la collecte, l’analyse et la visualisation des données générées par Suricata, facilitant ainsi une surveillance proactive des menaces.

Enfin, le troisième module se concentrera sur la création d’un modèle d’analyse comportementale des utilisateurs et des entités (UEBA) destiné à la recherche de menaces, en particulier pour détecter les attaques par déni de service distribué (DDoS). Nous exploiterons les journaux d’Elasticsearch pour développer ce modèle, permettant ainsi une détection avancée des anomalies et des comportements suspects.
