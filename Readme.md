
# Guide de démarrage du projet avec Docker Compose

Ce guide vous explique comment démarrer le projet en utilisant Docker Compose et la commande Docker exec.

## Prérequis

Assurez-vous d'avoir Docker et Docker Compose installés sur votre machine.

## Instructions

1. Clonez le dépôt du projet depuis GitHub :

```{bash}
git clone <url_du_depot>
```

3. Set les variables d'aws et exécutez le script en utilisant la commande suivante :

```bash
   source set_user.sh
````

2.Lancez le conteneur Docker en utilisant Docker Compose :
```bash
sudo docker-compose up -d
```
3. Utilisez la commande docker exec -it pour accéder au terminal .
```bash
    docker exec -it hadoopinfra_terraform /bin/bash
```

4. Vous pouvez maintenant créer votre infra avec 
```bash
    terraform init
    terraform apply
```