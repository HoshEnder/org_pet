#!/bin/bash

# Lancer les services définis dans le fichier docker-compose.yml
docker-compose -f mysql-compose.yml up -d

# Attendre que le conteneur MySQL soit complètement lancé
echo "Attente du démarrage de MySQL..."
sleep 10 # Ce délai dépend de la rapidité avec laquelle votre conteneur MySQL démarre

# Connexion à la base de données MySQL et exécution des commandes SQL
docker exec -it local_mysql_db mysql -uroot -p <<EOF
SHOW GRANTS FOR 'admin'@'%';
GRANT ALL PRIVILEGES ON petclinic.* TO 'admin'@'%';
FLUSH PRIVILEGES;
EOF

# Lancer les services locaux définis dans un autre docker-compose.yml
docker-compose up -d
