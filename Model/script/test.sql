CREATE DATABASE massar;
use massar;
CREATE TABLE IF NOT EXISTS Client(
    id_client int(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom_client VARCHAR(30) NOT NULL,
    prenom_client VARCHAR(30) NOT NULL,
    adresse VARCHAR(40),
    code_postal_client VARCHAR(30),
    tel_client VARCHAR(20),
    anciennete VARCHAR(20));

CREATE TABLE IF NOT EXISTS AgentCommercial(
    id_agent int(5) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom_agent VARCHAR(20) NOT NULL,
    prenom_agent VARCHAR(20) NOT NULL
    );
CREATE TABLE IF NOT EXISTS CategorieGarage(
    id_cat INT(5) UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nom_cat VARCHAR(20) NOT NULL,
    prix_cat DOUBLE NOT NULL
);

CREATE TABLE IF NOT EXISTS Residence (
    id_resid INT(5) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom_resid VARCHAR(40) NOT NULL,
    rue_resid VARCHAR(40) NOT NULL,
    ville_resid VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS Reservation(
    id_reservation INT(5) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_reservation DATE NOT NULL,
    nature_reservation VARCHAR(200) NOT NULL,
    id_agent INT(5) UNSIGNED NOT NULL,
    id_client INT(8) UNSIGNED NOT NULL,
    KEY cle1 (id_reservation,id_agent),
    KEY cle2 (id_reservation,id_client),
    CONSTRAINT fk_id_agent FOREIGN KEY(id_agent) REFERENCES AgentCommercial(id_agent) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_id_client FOREIGN KEY(id_client) REFERENCES Client(id_client) ON DELETE CASCADE ON UPDATE CASCADE

);
CREATE TABLE IF NOT EXISTS Etage (
    id_etage INT(5) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    niveau_etage VARCHAR(20),
    nom_residence VARCHAR(100) NOT NULL,
    id_reservation INT(5) UNSIGNED NOT NULL,
    id_resid INT(5) UNSIGNED NOT NULL,
    KEY cle1 (id_etage,id_reservation),
    KEY cle2 (id_etage,id_resid),
    CONSTRAINT fk_id_reservat FOREIGN KEY(id_reservation) REFERENCES Reservation(id_reservation) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_residd FOREIGN KEY(id_resid) REFERENCES Residence (id_resid) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS Garage(
    id_garage INT(5) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom_garage VARCHAR(30),
    type_garage VARCHAR(50),
    id_resid INT(5) UNSIGNED NOT NULL,
    id_reservation INT(5) UNSIGNED NOT NULL,
    id_cat INT(5) UNSIGNED NOT NULL,
    KEY cle1 (id_garage,id_resid),
    KEY cle2 (id_garage,id_reservation),
    KEY cle3 (id_garage,id_cat),
    CONSTRAINT fk_id_resid FOREIGN KEY(id_resid) REFERENCES Residence(id_resid) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_id_reservation FOREIGN KEY(id_reservation) REFERENCES Reservation(id_reservation) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_id_cat FOREIGN KEY(id_cat) REFERENCES CategorieGarage(id_cat) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS Appartement(
    id_appart INT(5) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    surface VARCHAR(50) NOT NULL,
    type_appart VARCHAR(200) NOT NULL,
    id_resid INT(5) UNSIGNED NOT NULL,
    id_reservation INT(5) UNSIGNED NOT NULL,
    KEY cle1 (id_appart,id_resid),
    KEY cle2 (id_appart,id_reservation),
    CONSTRAINT fk_id_reside FOREIGN KEY(id_resid) REFERENCES Residence(id_resid) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_id_reserv FOREIGN KEY(id_reservation) REFERENCES Reservation(id_reservation) ON DELETE CASCADE ON UPDATE CASCADE
)