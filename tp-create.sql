/*
CREATE TABLE conge (
  id INTEGER PRIMARY KEY, -> Creer une colonne id de type integer et qui sera la clé primaire
  employe_id INTEGER NOT NULL REFERENCES employe(id), -> creer une colonne employe_id qui devra toujours avoir une valeur, de plus si la valeur n'existe pas dans la table employe et colonne id on refuse l'ajout
  date_debut DATE NOT NULL, -> Creer une colonne date_debut de type date qui devra toujours avoir une valeur
  date_fin DATE NOT NULL, -> Creer une colonne date_fin de type date qui devra toujours avoir une valeur
  type type_conge NOT NULL -> Creer une colonne type de type type_conge définit plus tôt qui devra toujours avoir une valeur
);

*/
--Create queries :
CREATE TYPE langue_type AS ENUM ('VF', 'VOST');

CREATE TABLE salle (
    numero_salle INTEGER PRIMARY KEY,
    capacite INTEGER NOT NULL
);

CREATE TABLE film (
    id INTEGER PRIMARY KEY,
    titre VARCHAR(50) NOT NULL,
    duree_minute INTEGER NOT NULL,
    annee_sortie INTEGER NOT NULL
);

CREATE TABLE spectateur (
    id INTEGER PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    mail VARCHAR(75) NOT NULL
);

CREATE TABLE seance (
    id INTEGER PRIMARY KEY,
    numero_salle INTEGER NOT NULL,
    id_film INTEGER NOT NULL,
    date_seance DATE NOT NULL,
    heure_seance TIME NOT NULL,
    langue langue_type NOT NULL,
    FOREIGN KEY (numero_salle) REFERENCES 
    salle (numero_salle),
    FOREIGN KEY (id_film) REFERENCES 
    film (id)
);

CREATE TABLE reservation (
    id INTEGER PRIMARY KEY,
    nb_place INTEGER NOT NULL,
    date_reservation DATE NOT NULL,
    id_seance INTEGER NOT NULL,
    id_spectateur INTEGER NOT NULL,
    FOREIGN KEY (id_seance) REFERENCES 
    seance (id),
    FOREIGN KEY (id_spectateur) REFERENCES 
    spectateur (id)
);

-- Delete queries :
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS seance;
DROP TABLE IF EXISTS spectateur;
DROP TABLE IF EXISTS film;
DROP TABLE IF EXISTS salle;

DROP TYPE IF EXISTS langue_type;


