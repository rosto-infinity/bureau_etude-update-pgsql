-- Créer la base de données
CREATE DATABASE bureau_etude;

-- Se connecter à la base de données (à faire dans le client, pas dans le script)
-- \c bureau_etude

-- Créer la table produit avec la colonne description
CREATE TABLE IF NOT EXISTS produit (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);

-- Créer la table composant avec la colonne description
CREATE TABLE IF NOT EXISTS composant (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    cout DECIMAL(10, 2) NOT NULL
);

-- Créer la table nomenclature pour représenter la relation plusieurs-à-plusieurs
CREATE TABLE IF NOT EXISTS nomenclature (
    id_produit INT NOT NULL,
    id_composant INT NOT NULL,
    nombre INT NOT NULL,
    PRIMARY KEY (id_produit, id_composant),
    FOREIGN KEY (id_produit) REFERENCES produit(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_composant) REFERENCES composant(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Insérer des données dans la table produit
INSERT INTO produit (libelle, description) VALUES
('Smartphone X1', 'Smartphone haut de gamme avec écran OLED.'),
('Tablette Y2', 'Tablette légère avec une grande autonomie.'),
('Ordinateur portable Z3', 'Ordinateur portable avec processeur i7.'),
('Montre connectée A4', 'Montre connectée avec suivi de santé.'),
('Écouteurs sans fil B5', 'Écouteurs Bluetooth avec réduction de bruit.');

-- Insérer des données dans la table composant
INSERT INTO composant (libelle, description, cout) VALUES
('Carte mère', 'Carte mère avec chipset avancé.', 150.00),
('Batterie', 'Batterie lithium-ion de 3000 mAh.', 30.00),
('Écran OLED', 'Écran OLED de 6,5 pouces.', 80.00),
('Processeur', 'Processeur Intel i7.', 250.00),
('Boîtier', 'Boîtier en aluminium.', 50.00),
('Haut-parleur', 'Haut-parleur stéréo.', 20.00),
('Capteur de santé', 'Capteur de fréquence cardiaque.', 15.00);

-- Insérer des données dans la table nomenclature
INSERT INTO nomenclature (id_produit, id_composant, nombre) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(3, 1, 1),
(3, 4, 1),
(3, 5, 1),
(4, 6, 2),
(4, 7, 1),
(5, 6, 1);
