------------------------------------------------------------
--        Script Postgre 
------------------------------------------------------------



------------------------------------------------------------
-- Table: utilisateur
------------------------------------------------------------
CREATE TABLE public.utilisateur(
	id_utilisateur   INT   ,
	login            Varchar (50)  ,
	email            Varchar (50)  ,
	nom              Varchar (50)  ,
	pwd              Varchar (50)  ,
	user_role        Varchar (50)   ,
	CONSTRAINT utilisateur_PK PRIMARY KEY (id_utilisateur)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: etat
------------------------------------------------------------
CREATE TABLE public.etat(
	id_etat   INT   ,
	libelle   Varchar (50)   ,
	CONSTRAINT etat_PK PRIMARY KEY (id_etat)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: commande
------------------------------------------------------------
CREATE TABLE public.commande(
	id_commande   INT   ,
	date_achat    DATE   ,
	id_etat       INT    ,
	CONSTRAINT commande_PK PRIMARY KEY (id_commande)

	,CONSTRAINT commande_etat_FK FOREIGN KEY (id_etat) REFERENCES public.etat(id_etat)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: materiau
------------------------------------------------------------
CREATE TABLE public.materiau(
	id_materiau        INT   ,
	libelle_materiau   Varchar (50)   ,
	CONSTRAINT materiau_PK PRIMARY KEY (id_materiau)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: type_meuble
------------------------------------------------------------
CREATE TABLE public.type_meuble(
	id_type        INT   ,
	libelle_type   Varchar (50)  ,
	CONSTRAINT type_meuble_PK PRIMARY KEY (id_type)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: meuble
------------------------------------------------------------
CREATE TABLE public.meuble(
	id_meuble     INT   ,
	nom_meuble    Varchar (50)  ,
	largeur       INT   ,
	hauteur       INT   ,
	prix_meuble   FLOAT   ,
	fournisseur   Varchar (50)  ,
	marque        Varchar (50)  ,
	id_type       INT    ,
	CONSTRAINT meuble_PK PRIMARY KEY (id_meuble)

	,CONSTRAINT meuble_type_meuble_FK FOREIGN KEY (id_type) REFERENCES public.type_meuble(id_type)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: contenir
------------------------------------------------------------
CREATE TABLE public.contenir(
	id_commande   INT   ,
	id_meuble     INT    ,
	CONSTRAINT contenir_PK PRIMARY KEY (id_commande,id_meuble)

	,CONSTRAINT contenir_commande_FK FOREIGN KEY (id_commande) REFERENCES public.commande(id_commande)
	,CONSTRAINT contenir_meuble0_FK FOREIGN KEY (id_meuble) REFERENCES public.meuble(id_meuble)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: etre_fait
------------------------------------------------------------
CREATE TABLE public.etre_fait(
	id_materiau   INT   ,
	id_meuble     INT    ,
	CONSTRAINT etre_fait_PK PRIMARY KEY (id_materiau,id_meuble)

	,CONSTRAINT etre_fait_materiau_FK FOREIGN KEY (id_materiau) REFERENCES public.materiau(id_materiau)
	,CONSTRAINT etre_fait_meuble0_FK FOREIGN KEY (id_meuble) REFERENCES public.meuble(id_meuble)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: ligne_commande
------------------------------------------------------------
CREATE TABLE public.ligne_commande(
	id_meuble     INT   ,
	id_commande   INT   ,
	prix          INT   ,
	quantite      INT    ,
	CONSTRAINT ligne_commande_PK PRIMARY KEY (id_meuble,id_commande)

	,CONSTRAINT ligne_commande_meuble_FK FOREIGN KEY (id_meuble) REFERENCES public.meuble(id_meuble)
	,CONSTRAINT ligne_commande_commande0_FK FOREIGN KEY (id_commande) REFERENCES public.commande(id_commande)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: a_pour_commande
------------------------------------------------------------
CREATE TABLE public.a_pour_commande(
	id_commande      INT   ,
	id_utilisateur   INT    ,
	CONSTRAINT a_pour_commande_PK PRIMARY KEY (id_commande,id_utilisateur)

	,CONSTRAINT a_pour_commande_commande_FK FOREIGN KEY (id_commande) REFERENCES public.commande(id_commande)
	,CONSTRAINT a_pour_commande_utilisateur0_FK FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id_utilisateur)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: ligne_panier
------------------------------------------------------------
CREATE TABLE public.ligne_panier(
	id_meuble        INT   ,
	id_utilisateur   INT   ,
	quantite         INT   ,
	date_ajout       DATE    ,
	CONSTRAINT ligne_panier_PK PRIMARY KEY (id_meuble,id_utilisateur)

	,CONSTRAINT ligne_panier_meuble_FK FOREIGN KEY (id_meuble) REFERENCES public.meuble(id_meuble)
	,CONSTRAINT ligne_panier_utilisateur0_FK FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id_utilisateur)
)WITHOUT OIDS;


