------------------------------------------------------------
--        Script Postgre 
------------------------------------------------------------



------------------------------------------------------------
-- Table: utilisateur
------------------------------------------------------------
CREATE TABLE public.utilisateur(
	id_utilisateur   INT  NOT NULL ,
	login            VARCHAR (-1) NOT NULL ,
	email            VARCHAR (-1) NOT NULL ,
	nom              VARCHAR (-1) NOT NULL ,
	pwd              VARCHAR (-1) NOT NULL ,
	user_role        VARCHAR (-1) NOT NULL  ,
	CONSTRAINT utilisateur_PK PRIMARY KEY (id_utilisateur)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: etat
------------------------------------------------------------
CREATE TABLE public.etat(
	id_etat   INT  NOT NULL ,
	libelle   VARCHAR (50) NOT NULL  ,
	CONSTRAINT etat_PK PRIMARY KEY (id_etat)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: commande
------------------------------------------------------------
CREATE TABLE public.commande(
	id_commande   INT  NOT NULL ,
	date_achat    DATE  NOT NULL ,
	id_etat       INT  NOT NULL  ,
	CONSTRAINT commande_PK PRIMARY KEY (id_commande)

	,CONSTRAINT commande_etat_FK FOREIGN KEY (id_etat) REFERENCES public.etat(id_etat)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: materiau
------------------------------------------------------------
CREATE TABLE public.materiau(
	id_materiau        INT  NOT NULL ,
	libelle_materiau   VARCHAR (50) NOT NULL  ,
	CONSTRAINT materiau_PK PRIMARY KEY (id_materiau)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: type_meuble
------------------------------------------------------------
CREATE TABLE public.type_meuble(
	id_type        INT  NOT NULL ,
	libelle_type   VARCHAR (50) NOT NULL  ,
	CONSTRAINT type_meuble_PK PRIMARY KEY (id_type)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: meuble
------------------------------------------------------------
CREATE TABLE public.meuble(
	id_meuble     INT  NOT NULL ,
	nom_meuble    VARCHAR (-1) NOT NULL ,
	largeur       INT  NOT NULL ,
	hauteur       INT  NOT NULL ,
	prix_meuble   FLOAT  NOT NULL ,
	fournisseur   VARCHAR (-1) NOT NULL ,
	marque        VARCHAR (-1) NOT NULL ,
	id_type       INT  NOT NULL  ,
	CONSTRAINT meuble_PK PRIMARY KEY (id_meuble)

	,CONSTRAINT meuble_type_meuble_FK FOREIGN KEY (id_type) REFERENCES public.type_meuble(id_type)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: contenir
------------------------------------------------------------
CREATE TABLE public.contenir(
	id_commande   INT  NOT NULL ,
	id_meuble     INT  NOT NULL  ,
	CONSTRAINT contenir_PK PRIMARY KEY (id_commande,id_meuble)

	,CONSTRAINT contenir_commande_FK FOREIGN KEY (id_commande) REFERENCES public.commande(id_commande)
	,CONSTRAINT contenir_meuble0_FK FOREIGN KEY (id_meuble) REFERENCES public.meuble(id_meuble)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: etre_fait
------------------------------------------------------------
CREATE TABLE public.etre_fait(
	id_materiau   INT  NOT NULL ,
	id_meuble     INT  NOT NULL  ,
	CONSTRAINT etre_fait_PK PRIMARY KEY (id_materiau,id_meuble)

	,CONSTRAINT etre_fait_materiau_FK FOREIGN KEY (id_materiau) REFERENCES public.materiau(id_materiau)
	,CONSTRAINT etre_fait_meuble0_FK FOREIGN KEY (id_meuble) REFERENCES public.meuble(id_meuble)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: ligne_commande
------------------------------------------------------------
CREATE TABLE public.ligne_commande(
	id_meuble     INT  NOT NULL ,
	id_commande   INT  NOT NULL ,
	prix          INT  NOT NULL ,
	quantite      INT  NOT NULL  ,
	CONSTRAINT ligne_commande_PK PRIMARY KEY (id_meuble,id_commande)

	,CONSTRAINT ligne_commande_meuble_FK FOREIGN KEY (id_meuble) REFERENCES public.meuble(id_meuble)
	,CONSTRAINT ligne_commande_commande0_FK FOREIGN KEY (id_commande) REFERENCES public.commande(id_commande)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: a_pour_commande
------------------------------------------------------------
CREATE TABLE public.a_pour_commande(
	id_commande      INT  NOT NULL ,
	id_utilisateur   INT  NOT NULL  ,
	CONSTRAINT a_pour_commande_PK PRIMARY KEY (id_commande,id_utilisateur)

	,CONSTRAINT a_pour_commande_commande_FK FOREIGN KEY (id_commande) REFERENCES public.commande(id_commande)
	,CONSTRAINT a_pour_commande_utilisateur0_FK FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id_utilisateur)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: ligne_panier
------------------------------------------------------------
CREATE TABLE public.ligne_panier(
	id_meuble        INT  NOT NULL ,
	id_utilisateur   INT  NOT NULL ,
	quantite         INT  NOT NULL ,
	date_ajout       DATE  NOT NULL  ,
	CONSTRAINT ligne_panier_PK PRIMARY KEY (id_meuble,id_utilisateur)

	,CONSTRAINT ligne_panier_meuble_FK FOREIGN KEY (id_meuble) REFERENCES public.meuble(id_meuble)
	,CONSTRAINT ligne_panier_utilisateur0_FK FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id_utilisateur)
)WITHOUT OIDS;


