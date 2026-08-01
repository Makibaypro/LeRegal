

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