------------------------------------------------------------
--        Script Postgre 
------------------------------------------------------------
DROP SHEMA IF EXISTS ikeem CASCADE;
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
	prix          INT  NOT NULL ,
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

