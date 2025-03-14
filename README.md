Architecture du projet

projet-esgi/

├── Dockerfile
├── docker-compose.yml
├── paymybuddy.jar

├── initdb/

│   └── (vos scripts SQL d'initialisation)

├── kubernetes/

│   ├── backend-deployment.yaml

│   ├── backend-service.yaml

│   ├── mysql-deployment.yaml

│   ├── mysql-service.yaml

│   ├── mysql-pvc.yaml

│   ├── mysql-configmap.yaml

│   ├── mysql-secret.yaml

│   └── mysql-init-configmap.yaml

└── README.md


## Dockerfile
Ce fichier définit comment construire le conteneur pour l'application Spring Boot. Le système utilise Java 17 sur une image Alpine légère, place l'application dans un répertoire de travail dédié, configure les paramètres de connexion à la base de données et lance l'application au démarrage du conteneur.
![image](https://github.com/user-attachments/assets/ed545727-7bde-4d41-8a1b-e464f32a47c2)

## docker-compose.yml
Ce fichier orchestre le déploiement de deux services interconnectés. Le premier service déploie l'application backend en construisant l'image à partir du Dockerfile et expose l'application sur le port 8080. Le second service déploie une base de données MySQL avec des volumes pour la persistance des données et les scripts d'initialisation. Les deux services communiquent via un réseau dédié.
![image](https://github.com/user-attachments/assets/e8d92c78-6077-4e34-9613-ed8d89119722)

## kubernetes/backend-deployment.yaml
Ce manifeste déploie l'application Spring Boot dans le cluster Kubernetes. Il crée un pod avec un conteneur exécutant l'image de l'application et configure la connexion à la base de données en récupérant les informations depuis un ConfigMap et un Secret pour une gestion sécurisée des configurations.
![image](https://github.com/user-attachments/assets/d1bd7d82-2e27-4fea-b3a3-ec4e3895e6bc)

## kubernetes/backend-service.yaml
Ce service Kubernetes expose l'application backend au sein du cluster, rendant l'application accessible aux autres composants via le port 8080 en utilisant un service de type ClusterIP.
![image](https://github.com/user-attachments/assets/5cdd60ce-dedc-4ed7-b414-1e4446fe8ad5)

## kubernetes/mysql-deployment.yaml
Ce manifeste déploie la base de données MySQL dans le cluster Kubernetes. Il configure un pod avec un conteneur MySQL, monte un volume persistant pour les données et un ConfigMap pour les scripts d'initialisation, garantissant ainsi la persistance et la configuration correcte de la base de données.
![image](https://github.com/user-attachments/assets/87366cf5-8eff-4dd7-ae36-1dcbec60acf3)

## kubernetes/mysql-service.yaml
Ce service Kubernetes expose la base de données MySQL sur le port standard 3306 au sein du cluster, permettant à l'application backend de s'y connecter.
![image](https://github.com/user-attachments/assets/1c15a4fb-1a42-48cc-a877-80e73766ab1b)

## kubernetes/mysql-pvc.yaml
Cette demande de volume persistant réserve 1 Go d'espace de stockage pour la base de données MySQL, assurant que les données survivent même si le pod MySQL est redémarré ou déplacé.
![image](https://github.com/user-attachments/assets/e6406894-2807-4621-8925-021ce683f8ae)

## kubernetes/mysql-configmap.yaml
Ce ConfigMap stocke l'URL de connexion à la base de données, permettant de centraliser cette configuration et de la modifier sans avoir à reconstruire l'image du backend.
![image](https://github.com/user-attachments/assets/b21cead8-b51f-47f4-8d57-be31c838a1ca)

## kubernetes/mysql-secret.yaml
Ce Secret stocke de manière sécurisée les identifiants de connexion à la base de données (nom d'utilisateur et mot de passe), évitant d'exposer ces informations sensibles en texte clair dans les déploiements.
![image](https://github.com/user-attachments/assets/8e5e7e2f-f576-4df3-9790-30fdc2b952ed)

## kubernetes/mysql-init-configmap.yaml
Ce ConfigMap contient les scripts SQL qui seront exécutés lors de l'initialisation de la base de données, permettant de créer automatiquement le schéma et les données initiales nécessaires au fonctionnement de l'application PayMyBuddy.
![image](https://github.com/user-attachments/assets/08450366-c550-431b-9f0c-b19e20634f14)



Pods running, application running
![image](https://github.com/user-attachments/assets/fd2a1529-e04f-443e-8e53-16e142601da3)
![image](https://github.com/user-attachments/assets/b7492655-2abb-4c72-8f0a-75aaa8d55bdd)


