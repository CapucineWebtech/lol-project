# LOL Tournoi Manager

Application web permettant de gérer un tournoi de League of Legends développée avec Ruby on Rails.

## À propos du projet

LOL Tournoi Manager est une application web conçue pour faciliter la gestion des tournois de League of Legends. Elle permet de créer des équipes, gérer des joueurs, organiser des matchs et suivre les résultats.

## Modèles de données

L'application comprend les modèles suivants :

- **Team** : Représente une équipe de League of Legends
  - `name` : Nom de l'équipe
  - Relations : Possède plusieurs joueurs et participe à plusieurs matchs

- **Player** : Représente un joueur de League of Legends
  - `first_name` : Prénom du joueur
  - `last_name` : Nom du joueur
  - `role` : Rôle du joueur (ex: Top, Jungle, Mid, ADC, Support)
  - `team_id` : Équipe à laquelle appartient le joueur
  - Relations : Appartient à une équipe

- **Match** : Représente un match entre deux équipes
  - `team1_id` : Première équipe du match
  - `team2_id` : Deuxième équipe du match
  - `match_date` : Date du match
  - `score_team1` : Score de la première équipe
  - `score_team2` : Score de la deuxième équipe
  - Relations : Appartient à deux équipes différentes

- **User** : Représente un utilisateur de l'application
  - `email` : Email de l'utilisateur
  - `password_digest` : Mot de passe chiffré
  - `is_admin` : Indique si l'utilisateur est administrateur

## Prérequis

- Ruby 3.2.2
- Ruby on Rails 7.1.5.1
- SQLite3
- Node.js et Yarn (pour Tailwind CSS)

## Installation

1. Cloner le dépôt
   ```
   git clone https://github.com/CapucineWebtech/lol-project
   cd lol-project
   ```

2. Installer les dépendances
   ```
   bundle install
   ```

3. Configurer la base de données
   ```
   rails db:create
   rails db:migrate
   ```

4. (Optionnel) Charger des données initiales
   ```
   rails db:seed
   ```

## Configuration

Aucune configuration spéciale n'est requise pour le développement local. L'application utilise SQLite comme base de données par défaut.

## Lancement de l'application

1. Compiler les assets Tailwind CSS
   ```
   rails tailwindcss:build
   ```

2. Lancer le serveur Rails
   ```
   rails s
   ```

3. Accéder à l'application dans votre navigateur

## Fonctionnalités

- Gestion des équipes
- Gestion des joueurs par équipe
- Création et suivi des matchs
- Mise à jour des résultats de matchs
- Système d'authentification utilisateur
- Interface administrateur pour les utilisateurs avec des privilèges

## Routes principales

- `/` : Page d'accueil
- `/login` : Connexion utilisateur
- `/teams` : Liste des équipes
- `/players` : Liste des joueurs
- `/matches` : Liste des matchs

## Technologies utilisées

- Ruby on Rails 7.1.5.1
- Ruby 3.2.2
- SQLite3
- Tailwind CSS
- BCrypt pour l'authentification