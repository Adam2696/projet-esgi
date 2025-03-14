# Utiliser une image de base d'Amazon Corretto avec Java 17
FROM amazoncorretto:21-alpine

# Définir un répertoire de travail pour recevoir le fichier JAR
WORKDIR /app

# Copier le fichier JAR du backend dans le conteneur
COPY target/paymybuddy.jar /app/paymybuddy.jar

# Exposer le port 8080 pour l'application Spring Boot
EXPOSE 8080

# Commande pour exécuter le backend Spring Boot
CMD ["java", "-jar", "paymybuddy.jar"]
