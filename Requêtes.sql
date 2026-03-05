-------- Création du base de données et des tables -----------------------------------------------------------

CREATE DATABASE IF NOT EXISTS scolaire;
USE scolaire;

-- Création de la table Ecole --
CREATE TABLE ECOLE(
    id_ecole INT PRIMARY KEY AUTO_INCREMENT,
    Nom_ecole VARCHAR(50) NOT NULL,
    Adresse VARCHAR(50) NOT NULL,
    Niveau ENUM('Primaire','Secondaire') NOT NULL,
    Statut ENUM('Public','Privé') DEFAULT 'Public',
    Date_Creation DATE,
    Budget FLOAT
);

-- Création de la table Eleve --
CREATE TABLE ELEVE(
    id_eleve INT PRIMARY KEY AUTO_INCREMENT,
    Nom_eleve VARCHAR(50) NOT NULL,
    Prenom_eleve VARCHAR(50) NOT NULL,
    Date_naissance DATE,
    Budget FLOAT
);

--Création de la table Local --
CREATE TABLE LOCAL(
    id_local INT PRIMARY KEY AUTO_INCREMENT,
    Etage INT NOT NULL,
    Batiment VARCHAR(50) NOT NULL,
    Capacite INT NOT NULL,
    id_ecole INT,
    CONSTRAINT FK_id_ecole_local FOREIGN KEY (id_ecole) REFERENCES ECOLE(id_ecole)
);

-- Création de la table Employe --
CREATE TABLE EMPLOYE(
    id_employe INT PRIMARY KEY AUTO_INCREMENT,
    date_naissance DATE,
    Nom_employe VARCHAR(50) NOT NULL,
    Prenom_employe VARCHAR(50) NOT NULL,
    Sexe VARCHAR(10),
    Fonction VARCHAR(50) NOT NULL,
    Date_debut DATE,
    Salaire FLOAT NOT NULL
);

-- Création de la table Cours --
CREATE TABLE COURS(
    id_cours INT PRIMARY KEY AUTO_INCREMENT,
    Nom_cours VARCHAR(20) NOT NULL,
    Description VARCHAR(50),
    Niveau VARCHAR(20) NOT NULL,
    id_local INT,
    id_employe INT,
    CONSTRAINT FK_id_local FOREIGN KEY (id_local) REFERENCES LOCAL(id_local),
    CONSTRAINT FK_id_employe FOREIGN KEY (id_employe) REFERENCES EMPLOYE(id_employe)
);

-- Création de la table Travaille --
CREATE TABLE TRAVAILLE(
    id_travaille INT PRIMARY KEY AUTO_INCREMENT,
    id_employe INT,
    id_ecole INT,
    CONSTRAINT FK_id_employe_travaille FOREIGN KEY (id_employe) REFERENCES EMPLOYE(id_employe),
    CONSTRAINT FK_id_ecole_travaille FOREIGN KEY (id_ecole) REFERENCES ECOLE(id_ecole)
);

-- Création de la table Évaluation  --
CREATE TABLE EVALUATION(
    id_evaluation INT PRIMARY KEY AUTO_INCREMENT,
    Date_evaluation DATE NOT NULL,
    Type_evaluation VARCHAR(50),
    Note_max FLOAT NOT NULL,
    Durrée INT NOT NULL,
    id_cours INT,
    id_local INT,
    CONSTRAINT FK_id_cours FOREIGN KEY (id_cours) REFERENCES COURS(id_cours),
    CONSTRAINT FK_id_local_evaluation FOREIGN KEY (id_local) REFERENCES LOCAL(id_local)
);

------------ Création des indexs ---------------------------------------------------------

---- Index sur le nom de l'école -----
CREATE INDEX IDX_nom_ecole ON ECOLE(Nom_ecole);

--- Index sur les informations d'un élève ----
CREATE INDEX IDX_eleve ON ELEVE(Nom_eleve, Prenom_eleve, Date_naissance);

--- Index sur les informations d'un employé ----
CREATE INDEX IDX_employe ON EMPLOYE(date_naissance,Nom_employe, Prenom_employe, Sexe, Fonction, Date_debut, Salaire);

------------Insertion des données dans les tables -----------------------------------------------------

-------Insertion des données dans la table Ecole --------
INSERT INTO ECOLE(Nom_ecole, Adresse, Niveau, Statut, Date_Creation, Budget) VALUES
('Ecole Primaire de la Paix', '123 Rue de la Paix', 'Primaire', 'Public', '2000-01-01', 50000),
('Lycée Jean Moulin', '456 Avenue des Lycéens', 'Secondaire', 'Privé', '2010-09-01', 75000),
('Collège Victor Hugo', '789 Boulevard des Collégiens', 'Secondaire', 'Public', '2005-05-15', 60000);

SELECT *FROM ECOLE;

---------Insertion des données dans la table Eleve -------------
INSERT INTO ELEVE(Nom_eleve, Prenom_eleve, Date_naissance, Budget) VALUES
('Dupont', 'Jean', '2005-03-15', 1000),
('Martin', 'Sophie', '2006-07-22', 1500),
('Durand', 'Alice', '2004-11-30', 1200);

SELECT *FROM ELEVE;

--------Insertion des données dans la table Employe-------
INSERT INTO EMPLOYE(date_naissance, Nom_employe, Prenom_employe, Sexe, Fonction, Date_debut, Salaire) VALUES
('1980-05-10', 'Lemoine', 'Marie', 'Femme', 'Professeur de Mathématiques', '2010-09-01', 3500),
('1975-12-20', 'Bernard', 'Paul', 'Homme', 'Directeur', '2005-01-15', 5000),
('1990-08-30', 'Dubois', 'Claire', 'Femme', 'Infirmière scolaire', '2015-03-01', 3000);

SELECT *FROM EMPLOYE;

-------Insertion des données dans la table Travaille ------------
INSERT INTO TRAVAILLE(id_employe, id_ecole) VALUES
(1, 1),
(2, 2),
(3, 3);

SELECT *FROM TRAVAILLE;

-------Insertion des données dans la table Local---------
INSERT INTO LOCAL(Etage, Batiment, Capacite, id_ecole) VALUES
(1, 'A', 30, 1),
(2, 'B', 25, 2),
(3, 'C', 20, 3);

SELECT *FROM LOCAL;

-------Insertion des données dans la table Cours-----
INSERT INTO COURS(Nom_cours, Description, Niveau, id_local, id_employe) VALUES
('Mathématiques', 'Cours de mathématiques pour les élèves du primaire', 'Primaire', 1, 1),
('Français', 'Cours de français pour les élèves du secondaire', 'Secondaire', 2, 2),
('Sciences', 'Cours de sciences pour les élèves du secondaire', 'Secondaire', 3, 3);

SELECT *FROM COURS;

--------Insertion des données dans la table Evaluation ------
INSERT INTO EVALUATION(Date_evaluation, Type_evaluation, Note_max, Durrée, id_cours, id_local) VALUES
('2024-06-01', 'Examen final', 20, 120, 1, 1),
('2024-06-15', 'Contrôle continu', 20, 60, 2, 2),
('2024-06-30', 'Projet de groupe', 20, 180, 3, 3);

SELECT *FROM EVALUATION;

----------------------Création des requêtes-----------------------------------------------------

--Requête 1: Afficher les cours avec les enseignants et les locaux associés--------
SELECT c.id_cours, c.Nom_cours, e.Nom_employe, e.Prenom_employe, l.Batiment, l.Etage
FROM COURS c
JOIN EMPLOYE e ON c.id_employe = e.id_employe
JOIN LOCAL l ON c.id_local = l.id_local;

--Requête 2: Afficher les écoles secondaires publiques ayant un budget supérieur à 55000----
SELECT * FROM ECOLE 
WHERE Niveau = 'Secondaire'
AND Statut = 'Public'
AND Budget > 55000;

--Requête 3: Afficher les employés recrutés après 2010----
SELECT Nom_employe, Prenom_employe, Fonction, Date_debut
FROM EMPLOYE 
WHERE Date_debut >= '2010-01-01';

--Requête 4:Afficher le nombre d'employés par école---
SELECT ec.Nom_ecole,
COUNT(t.id_employe) AS nombre_employes
FROM ECOLE ec 
LEFT JOIN TRAVAILLE t ON t.id_ecole = ec.id_ecole
GROUP BY ec.id_ecole, ec.Nom_ecole
ORDER BY nombre_employes DESC;


--Requête 5: Afficher les employés ayant gagnés plus que le salaire moyen---
SELECT Nom_employe, Prenom_employe, Salaire 
FROM EMPLOYE 
WHERE Salaire > (SELECT AVG(Salaire) FROM EMPLOYE)
ORDER BY Salaire DESC;