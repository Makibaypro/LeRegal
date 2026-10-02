# Le Régal

Base de données de gestion d'un cinéma (salles, films, séances, spectateurs, réservations), accompagnée d'une page de présentation du cinéma en HTML/CSS.

Projet individuel réalisé pendant ma formation à Ada Tech School (semaine 11), pour pratiquer la conception d'une base de données relationnelle et PostgreSQL avec Docker.

<!-- Ajoute ici une capture d'écran de la page : ![Aperçu de la page](./docs/apercu.png) -->

## Contenu

- **Schéma relationnel** de 5 tables : `salle`, `film`, `spectateur`, `seance`, `reservation` (voir `schemaLogique.md`)
- **Scripts SQL** de création et de suppression des tables, avec clés primaires, clés étrangères, contraintes `NOT NULL` et un type `ENUM` pour la langue des séances (VF / VOST)
- **Base PostgreSQL 16** lancée avec Docker Compose, avec un volume pour conserver les données
- **Page de présentation** du cinéma (`index.html`, `style.css`) : le cinéma, les services, comment réserver, nous trouver

## Stack

- PostgreSQL 16
- SQL
- Docker Compose
- HTML, CSS

## Lancer la base de données

Prérequis : Docker installé.

```bash
git clone git@github.com:Makibaypro/LeRegal.git
cd LeRegal

# Démarrer PostgreSQL
docker compose up -d

# Créer les tables
docker compose exec -T db psql -U regalAdmin -d cinema < mount_up_data.sql

# Supprimer les tables
docker compose exec -T db psql -U regalAdmin -d cinema < mount_down_data.sql
```

Autres commandes utiles :

```bash
docker compose down       # arrêter (les données restent dans le volume)
docker compose down -v    # arrêter et supprimer le volume
```

La page de présentation s'ouvre directement avec `index.html` dans un navigateur.

## Fichiers

```
schemaLogique.md       Schéma relationnel (clés primaires et étrangères)
mount_up_data.sql      Création du type ENUM et des 5 tables
mount_down_data.sql    Suppression des tables et du type
tp-create.sql          Version de travail commentée des requêtes
docker-compose.yml     Service PostgreSQL
index.html, style.css  Page de présentation du cinéma
```

## Ce que j'ai pratiqué

- Passer d'un besoin à un schéma relationnel (tables, clés primaires et étrangères)
- Écrire les requêtes de création de tables avec leurs contraintes
- Lancer et initialiser une base PostgreSQL dans un conteneur Docker

## Pistes d'amélioration

- Ajouter un jeu de données d'exemple
- Charger automatiquement le script de création au premier démarrage du conteneur
- Relier la page à la base avec une API (Node.js / Express)

## Auteur

Maxence Chotard
