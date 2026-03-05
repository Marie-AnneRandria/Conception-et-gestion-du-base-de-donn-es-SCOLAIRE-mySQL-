# Système de Gestion d'une base de données SCOLAIRE - MySQL

## Apercu du projet 📌
Ce projet consiste à **concevoir et implémenter une base de données relationnelle complète pour la gestion d'un système scolaire** en utilisant **MySQL**.

La base de données permet de centraliser et d’organiser les informations relatives aux **écoles, élèves, employés, cours, locaux et évaluations**. Elle inclut également plusieurs requêtes SQL analytiques permettant d’exploiter les données pour répondre à des besoins de gestion et d’analyse.

Ce projet met en pratique les principes fondamentaux de la **modélisation relationnelle, de l’intégrité des données et de l’optimisation des requêtes SQL**.

## Objectifs du projet 🎯
 - Concevoir un **schéma relationnel structuré**
 - Implémenter les **relations entre entités via clés primaires et étrangères**
 - Garantir l'**intégrité des données**
 - Optimiser les requêtes avec des **index**
 - Développer des **requêtes SQL pour l'exploration et l'analyse de données**

## Architecture de la base de données 🗄

| Table          | Champs                                                 |
| -------------- | -----------------------------------------------------------         |
| **ECOLE**      | id_ecole, Nom_ecole, Adresse, Niveau, Statut, Date_Creation, Budget         |
| **ELEVE**      | id_eleve, Nom_eleve, Prenom_eleve, Date_naissance, Budget                  |
| **EMPLOYE**    | id_employe, date_naissance, Nom_employe, Prenom_employe, Sexe, Fonction, Date_Debut, Salaire |
| **LOCAL**      | id_local, Etage, Batiment, Capacite, id_ecole                                |
| **COURS**      | id_cours, Nom_cours, Description, Niveau, id_local, id_employe                            |
| **TRAVAILLE**  | id_travaille, id_employe, id_ecole                 |
| **EVALUATION** | id_evaluation, Date_evaluation, Type_evaluation, Note_max,Durée, id_cours, id_local                            |

### Relations
Le modèle relationnel utilise:
 - **Clés primaires** pour identifier chaque enregistrement
 - **Clés étrangères** pour relier les tables
 - **Contraintes d'intégrité référentielle**

Exemples de relations:
 - Un employé peut travailler dans une école
 - Un cours est associé à un local
 - Une évaluation est associée à un cours

## Technologies utilisées ⚙️
    - MySQL
    - SQL(DDL,DML)
    - MySQL Workbench

## Requêtes SQL implémentées 📊
 - Liste des **cours avec les enseignants et les locaux respectifs**
 - Liste des **employés recrutés après une date donnée**
 - Identification des **écoles secondaires publiques avec un budget supérieur à 5500**
 - **Nombre d'employés** pour chaque école
 - Liste des employés ayant un **salaire supérieur au salaire moyen**
 - Analyse des **relations entre les écoles, les cours et les employés**

## Exécution du projet 🚀
### 1. Cloner le dépôt

>git clone [https://github.com/Marie-AnneRandria/Conception-et-gestion-du-base-de-donn-es-SCOLAIRE-mySQL-.git]

### 2. Ouvrir MySQL Workbench ou Visual Code
### 3. Importer le script SQL
Exécuter le fichier:
>Requêtes.sql

Ce script: 
 - créer la base de données
 - créer les tables
 - crée les index
 - insère les données
 - exécute les requêtes

   ## Auteur 👨‍💻
   Ce projet a été réalisé dans le cadre du cours **Introduction aux bases de données**.
   
