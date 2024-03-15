------------------------------------------------------------
--        Script Postgre 
------------------------------------------------------------
DROP SCHEMA IF EXISTS ikeem CASCADE;
CREATE SCHEMA ikeem;
SET SEARCH_PATH TO ikeem;


------------------------------------------------------------
-- Table: utilisateur
------------------------------------------------------------
CREATE TABLE ikeem.utilisateur(
	id_utilisateur   INT  NOT NULL ,
	login            VARCHAR  NOT NULL ,
	email            VARCHAR  NOT NULL ,
	nom              VARCHAR  NOT NULL ,
	pwd              VARCHAR  NOT NULL ,
	user_role        VARCHAR  NOT NULL  ,
	CONSTRAINT utilisateur_PK PRIMARY KEY (id_utilisateur)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: etat
------------------------------------------------------------
CREATE TABLE ikeem.etat(
	id_etat   INT  NOT NULL ,
	libelle   VARCHAR  NOT NULL  ,
	CONSTRAINT etat_PK PRIMARY KEY (id_etat)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: commande
------------------------------------------------------------
CREATE TABLE ikeem.commande(
	id_commande      INT  NOT NULL ,
	date_achat       DATE  NOT NULL ,
	id_etat          INT  NOT NULL ,
	id_utilisateur   INT  NOT NULL  ,
	CONSTRAINT commande_PK PRIMARY KEY (id_commande)

	,CONSTRAINT commande_etat_FK FOREIGN KEY (id_etat) REFERENCES ikeem.etat(id_etat)
	,CONSTRAINT commande_utilisateur0_FK FOREIGN KEY (id_utilisateur) REFERENCES ikeem.utilisateur(id_utilisateur)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: materiau
------------------------------------------------------------
CREATE TABLE ikeem.materiau(
	id_materiau        INT  NOT NULL ,
	libelle_materiau   VARCHAR  NOT NULL  ,
	CONSTRAINT materiau_PK PRIMARY KEY (id_materiau)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: type_meuble
------------------------------------------------------------
CREATE TABLE ikeem.type_meuble(
	id_type        INT  NOT NULL ,
	libelle_type   VARCHAR  NOT NULL  ,
	CONSTRAINT type_meuble_PK PRIMARY KEY (id_type)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: meuble
------------------------------------------------------------
CREATE TABLE ikeem.meuble(
	id_meuble     INT  NOT NULL ,
	nom_meuble    VARCHAR  NOT NULL ,
	largeur       INT  NOT NULL ,
	hauteur       INT  NOT NULL ,
	prix_meuble   FLOAT  NOT NULL ,
	fournisseur   VARCHAR  NOT NULL ,
	marque        VARCHAR  NOT NULL ,
	id_type       INT  NOT NULL ,
	id_materiau   INT  NOT NULL  ,
	CONSTRAINT meuble_PK PRIMARY KEY (id_meuble)

	,CONSTRAINT meuble_type_meuble_FK FOREIGN KEY (id_type) REFERENCES ikeem.type_meuble(id_type)
	,CONSTRAINT meuble_materiau0_FK FOREIGN KEY (id_materiau) REFERENCES ikeem.materiau(id_materiau)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: ligne_commande
------------------------------------------------------------
CREATE TABLE ikeem.ligne_commande(
	id_meuble     INT  NOT NULL ,
	id_commande   INT  NOT NULL ,
	prix          FLOAT  NOT NULL ,
	quantite      INT  NOT NULL  ,
	CONSTRAINT ligne_commande_PK PRIMARY KEY (id_meuble,id_commande)

	,CONSTRAINT ligne_commande_meuble_FK FOREIGN KEY (id_meuble) REFERENCES ikeem.meuble(id_meuble)
	,CONSTRAINT ligne_commande_commande0_FK FOREIGN KEY (id_commande) REFERENCES ikeem.commande(id_commande)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: ligne_panier
------------------------------------------------------------
CREATE TABLE ikeem.ligne_panier(
	id_meuble        INT  NOT NULL ,
	id_utilisateur   INT  NOT NULL ,
	quantite         INT  NOT NULL ,
	date_ajout       DATE  NOT NULL  ,
	CONSTRAINT ligne_panier_PK PRIMARY KEY (id_meuble,id_utilisateur)

	,CONSTRAINT ligne_panier_meuble_FK FOREIGN KEY (id_meuble) REFERENCES ikeem.meuble(id_meuble)
	,CONSTRAINT ligne_panier_utilisateur0_FK FOREIGN KEY (id_utilisateur) REFERENCES ikeem.utilisateur(id_utilisateur)
)WITHOUT OIDS;


INSERT INTO ikeem.utilisateur (id_utilisateur, login, email, nom, pwd, user_role) VALUES
(1, 'Tayrell', 'tayrell@email.com', 'Tayrell', 'P@ssw0rd123', 'Staff'),
(2, 'Tony', 'tony@email.com', 'Tony', 'SecurePa$$', 'Client'),
(3, 'Samantha', 'samantha@email.com', 'Samantha', 'Str0ngP@ss!', 'Client'),
(4, 'Julien', 'julien@email.com', 'Julien', 'Juli1234!', 'Staff'),
(5, 'Amelie', 'amelie@email.com', 'Amelie', 'Am3l!3P@ss', 'Client'),
(6, 'Louis', 'louis@email.com', 'Louis', 'L0u!s987#', 'Staff'),
(7, 'Claire', 'claire@email.com', 'Claire', 'Cla!re123$', 'Client'),
(8, 'Antoine', 'antoine@email.com', 'Antoine', 'S3cur3@987', 'Staff'),
(9, 'Laura', 'laura@email.com', 'Laura', 'L@ur@456#', 'Stagiaire'),
(10, 'Nathan', 'nathan@email.com', 'Nathan', 'N@th@n12!', 'Client'),
(11, 'Alice', 'alice@email.com', 'Alice', 'Al1c3@PWD', 'Staff'),
(12, 'Bob', 'bob@email.com', 'Bob', 'B0bPa$$w0rd', 'Client'),
(13, 'Eva', 'eva@email.com', 'Eva', 'Ev@123', 'Client'),
(14, 'Maxime', 'maxime@email.com', 'Maxime', 'M@x!m3', 'Staff'),
(15, 'Sophie', 'sophie@email.com', 'Sophie', 'S0ph!e123', 'Stagiaire'),
(16, 'Claudia', 'claudia@email.com', 'Claudia', 'Claud1@2023', 'Staff');

INSERT INTO ikeem.etat (id_etat, libelle) VALUES
(1, 'En attente'),
(2, 'En cours de traitement'),
(3, 'Terminée'),
(4, 'Annulée'),
(5, 'En livraison'),
(6, 'Retardée'),
(7, 'En cours de préparation'),
(8, 'En cours de livraison'),
(9, 'En cours de fabrication'),
(10, 'En réparation'),
(11, 'En attente de paiement'),
(12, 'Expédiée'),
(13, 'En retour'),
(14, 'En cours de validation'),
(15, 'Terminée avec succès');

INSERT INTO ikeem.commande (id_commande, date_achat, id_etat, id_utilisateur) VALUES
(1, '2024-03-01', 1, 1),
(2, '2024-03-02', 2, 2),
(3, '2024-03-03', 3, 3),
(4, '2024-03-04', 4, 4),
(5, '2024-03-05', 5, 5),
(6, '2024-03-06', 6, 6),
(7, '2024-03-07', 7, 7),
(8, '2024-03-08', 8, 8),
(9, '2024-03-09', 9, 9),
(10, '2024-03-10', 10, 10),
(11, '2024-03-11', 11, 1),
(12, '2024-03-12', 12, 2),
(13, '2024-03-13', 13, 3),
(14, '2024-03-14', 14, 4),
(15, '2024-03-15', 15, 5),
(16, '2024-04-04', 1, 16),
(17, '2024-03-16', 3, 16), 
(18, '2024-03-17', 2, 1);

INSERT INTO ikeem.materiau (id_materiau, libelle_materiau) VALUES
(1, 'Bois'),
(2, 'Métal'),
(3, 'Plastique'),
(4, 'Verre'),
(5, 'Cuir'),
(6, 'Tissu'),
(7, 'Pierre'),
(8, 'Argent'),
(9, 'Or'),
(10, 'Céramique'),
(11, 'Béton'),
(12, 'Aluminium'),
(13, 'Acier'),
(14, 'Bronze'),
(15, 'Titane');

INSERT INTO ikeem.type_meuble (ID_TYPE, LIBELLE_TYPE) VALUES
(1, 'Chaise'),
(2, 'Table'),
(3, 'Armoire'),
(4, 'Canapé'),
(5, 'Lit'),
(6, 'Bureau'),
(7, 'Étagère'),
(8, 'Commode'),
(9, 'Buffet'),
(10, 'Banc'),
(11, 'Fauteuil'),
(12, 'Console'),
(13, 'Table basse'),
(14, 'Lampadaire'),
(15, 'Porte-manteau');

INSERT INTO ikeem.meuble (ID_MEUBLE, NOM_MEUBLE, LARGEUR, HAUTEUR, PRIX_MEUBLE, FOURNISSEUR, MARQUE, ID_TYPE, ID_MATERIAU) VALUES
(1, 'Chaise en bois', 50, 80, 50.99, 'Fournisseur A', 'Marque A', 1, 1),
(2, 'Table en métal', 120, 70, 129.99, 'Fournisseur B', 'Marque B', 2, 2),
(3, 'Armoire en plastique', 180, 200, 199.99, 'Fournisseur C', 'Marque C', 3, 3),
(4, 'Canapé en cuir', 200, 90, 499.99, 'Fournisseur D', 'Marque D', 4, 5),
(5, 'Lit en bois', 160, 120, 299.99, 'Fournisseur E', 'Marque E', 5, 1),
(6, 'Bureau en métal', 150, 75, 189.99, 'Fournisseur F', 'Marque F', 6, 2),
(7, 'Étagère en bois', 100, 180, 79.99, 'Fournisseur G', 'Marque G', 7, 1),
(8, 'Commode en plastique', 120, 90, 129.99, 'Fournisseur H', 'Marque H', 8, 3),
(9, 'Buffet en bois', 180, 100, 249.99, 'Fournisseur I', 'Marque I', 9, 1),
(10, 'Banc en métal', 150, 50, 89.99, 'Fournisseur J', 'Marque J', 10, 2),
(11, 'Fauteuil en cuir', 100, 100, 199.99, 'Fournisseur K', 'Marque K', 11, 5),
(12, 'Console en bois', 120, 80, 159.99, 'Fournisseur L', 'Marque L', 12, 1),
(13, 'Table basse en verre', 90, 40, 79.99, 'Fournisseur M', 'Marque M', 13, 4),
(14, 'Lampadaire en métal', 180, 180, 149.99, 'Fournisseur N', 'Marque N', 14, 2),
(15, 'Porte-manteau en bois', 60, 180, 39.99, 'Fournisseur O', 'Marque O', 15, 1);

INSERT INTO ikeem.ligne_commande (ID_MEUBLE, ID_COMMANDE, PRIX, QUANTITE) VALUES
(1, 1, 50.99, 2),
(2, 2, 129.99, 1),
(3, 3, 199.99, 3),
(4, 16, 499.99, 1),
(5, 16, 299.99, 1),
(6, 6, 189.99, 1),
(7, 7, 79.99, 2),
(8, 8, 129.99, 1),
(9, 9, 249.99, 1),
(10, 10, 89.99, 2),
(11, 11, 199.99, 1),
(12, 12, 159.99, 1),
(13, 13, 79.99, 2),
(14, 14, 149.99, 1),
(15, 15, 39.99, 3);


INSERT INTO ikeem.ligne_panier (ID_MEUBLE, ID_UTILISATEUR, QUANTITE, DATE_AJOUT) VALUES
(1, 1, 1, '2024-03-11'),
(2, 2, 2, '2024-03-10'),
(3, 3, 3, '2024-03-09'),
(4, 4, 1, '2024-03-08'),
(5, 5, 1, '2024-03-07'),
(6, 6, 2, '2024-03-06'),
(7, 7, 1, '2024-03-05'),
(8, 8, 2, '2024-03-04'),
(9, 9, 1, '2024-03-03'),
(10, 10, 3, '2024-03-02'),
(11, 11, 1, '2024-03-01'),
(12, 12, 2, '2024-02-29'),
(13, 13, 1, '2024-02-28'),
(14, 14, 3, '2024-02-27'),
(15, 15, 1, '2024-02-26');

--Requête
--1
SELECT tm.libelle_type, COUNT(lc.id_meuble) AS nombre_ventes
FROM ikeem.type_meuble tm
JOIN ikeem.meuble m ON tm.id_type = m.id_type
JOIN ikeem.ligne_commande lc ON m.id_meuble = lc.id_meuble
GROUP BY tm.libelle_type;

/*
 libelle_type  | nombre_ventes 
---------------+---------------
 Porte-manteau |             1
 Canapé        |             1
 Fauteuil      |             1
 Lit           |             1
 Armoire       |             1
 Banc          |             1
 Buffet        |             1
 Chaise        |             1
 Commode       |             1
 Étagère       |             1
 Table basse   |             1
 Table         |             1
 Lampadaire    |             1
 Console       |             1
*/

--2










