-- Active: 1747504319902@@localhost@5432@conservation_db@public
CREATE DATABASE conservation_db
--// creating tables

CREATE TABLE
    rangers (
        ranger_id SERIAL PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        region TEXT NOT NULL
    )

CREATE TABLE
    species (
        species_id SERIAL PRIMARY KEY,
        common_name VARCHAR(50) NOT NULL,
        scientific_name text NOT NULL,
        discover_date DATE NOT NULL,
        conservation_status TEXT NOT NULL CHECK (
            conservation_status IN (
                'Critically Endangered',
                'Endangered',
                'Vulnerable',
                'Least Concern',
                'Historic'
            )
        )
    )

CREATE TABLE
    sightings (
        sighting_id SERIAL PRIMARY KEY,
        sighting_time TIMESTAMP NOT NULL,
        location TEXT NOT NULL,
        notes TEXT,
        ranger_id INT,
        species_id INT,
        Foreign Key (ranger_id) REFERENCES rangers (ranger_id),
        Foreign Key (species_id) REFERENCES species (species_id)
    )

    -- //Droping table

DROP TABLE rangers;

DROP TABLE species;

DROP TABLE sightings;

SELECT  * from rangers;

SELECT * from species;

SELECT * from sightings;

--// Inserting data

INSERT INTO rangers (name, region) VALUES
('João Silva', 'Upper Amazon Basin'),
('Maria Torres', 'Upper Amazon Basin'),
('Carlos Mendoza', 'Tapajós River Area'),
('Luna Ferreira', 'Tapajós River Area'),
('Ricardo Gomez', 'Xingu Rainforest'),
('Elena Ramos', 'Xingu Rainforest'),
('Mateo Costa', 'Purus River Pass'),
('Ana Morales', 'Purus River Pass'),
('Bruno Oliveira', 'Madeira River Zone'),
('Isabela Rocha', 'Madeira River Zone');

SELECT * FROM rangers

INSERT INTO species (common_name, scientific_name, discover_date, conservation_status)
VALUES
('Jaguar', 'Panthera onca', '1758-01-01', 'Endangered'),
('Harpy Eagle', 'Harpia harpyja', '1758-01-01', 'Vulnerable'),
('Giant Otter', 'Pteronura brasiliensis', '1788-01-01', 'Endangered'),
('Green Anaconda', 'Eunectes murinus', '1758-01-01', 'Least Concern'),
('Amazon River Dolphin', 'Inia geoffrensis', '1817-01-01', 'Endangered'),
('Poison Dart Frog', 'Dendrobates tinctorius', '1865-06-12', 'Least Concern'),
('Black Caiman', 'Melanosuchus niger', '1801-01-01', 'Vulnerable'),
('Sloth', 'Bradypus tridactylus', '1758-01-01', 'Least Concern'),
('Howler Monkey', 'Alouatta seniculus', '1812-03-15', 'Least Concern'),
('Amazonian Manatee', 'Trichechus inunguis', '1883-09-25', 'Vulnerable'),
('Spectacled Owl', 'Pulsatrix perspicillata', '1830-07-01', 'Least Concern'),
('Tamarin Monkey', 'Saguinus mystax', '1840-02-05', 'Endangered'),
('Capybara', 'Hydrochoerus hydrochaeris', '1766-01-01', 'Least Concern'),
('Pygmy Marmoset', 'Cebuella pygmaea', '1823-01-01', 'Least Concern'),
('Bush Dog', 'Speothos venaticus', '1842-01-01', 'Endangered'),
('Red-Bellied Piranha', 'Pygocentrus nattereri', '1858-01-01', 'Least Concern'),
('Tapir', 'Tapirus terrestris', '1758-01-01', 'Vulnerable'),
('Amazon Tree Boa', 'Corallus hortulanus', '1843-08-12', 'Least Concern'),
('Kinkajou', 'Potos flavus', '1774-05-10', 'Least Concern'),
('Amazonian Royal Flycatcher', 'Onychorhynchus coronatus', '1847-11-11', 'Least Concern'),
('Ocelot', 'Leopardus pardalis', '1758-01-01', 'Least Concern'),
('Titi Monkey', 'Callicebus moloch', '1811-04-10', 'Vulnerable'),
('Amazonian Umbrellabird', 'Cephalopterus ornatus', '1831-02-18', 'Vulnerable'),
('Saki Monkey', 'Pithecia pithecia', '1766-01-01', 'Least Concern'),
('Blue Morpho Butterfly', 'Morpho menelaus', '1758-01-01', 'Least Concern'),
('Amazonian Antbird', 'Percnostola rufifrons', '1825-05-12', 'Least Concern'),
('Spixs Macaw', 'Cyanopsitta spixii', '1819-01-01', 'Critically Endangered'),
('Golden Lion Tamarin', 'Leontopithecus rosalia', '1820-01-01', 'Endangered'),
('Arrau Turtle', 'Podocnemis expansa', '1783-01-01', 'Vulnerable'),
('Sunbittern', 'Eurypyga helias', '1789-01-01', 'Least Concern');

SELECT * from species

INSERT INTO sightings (sighting_time, location, notes, ranger_id, species_id) VALUES
('2025-03-01 07:45:00', 'Purus River Pass', 'Observed crossing riverbank', 7, 1),
('2025-03-03 10:15:00', 'Tapajós Forest Trail', 'Tracks along muddy trail', 3, 2),
('2025-03-05 07:46:00', 'Xingu Canopy Zone', 'Seen high in canopy', 6, 3),
('2024-03-06 15:30:00', 'Manaus Observation Deck', 'Adult with cubs', 1, 4),
('2024-03-08 08:20:00', 'Amazon Creek Pass', 'Swimming in shallow waters', 8, 5),
('2024-03-10 06:50:00', 'Madeira River Edge', 'Nest spotted near reeds', 10, 6),
('2024-03-11 09:10:00', 'Tapajós Forest Trail', 'Sunbathing on log', 4, 7),
('2024-03-12 11:00:00', 'Upper Amazon Basin', 'Roaming herd sighted', 2, 8),
('2024-03-13 14:15:00', 'Shadowed Stream Pass', 'Loud vocalizations heard', 5, 9),
('2024-03-15 17:00:00', 'Xingu Rainforest Floor', 'Sighting near fallen tree', 5, 10),
('2024-03-16 07:00:00', 'Purus River Pass', 'Solitary adult', 7, 11),
('2024-03-18 12:20:00', 'Canopy Watchpoint', 'Brief overhead flight', 6, 12),
('2024-03-19 10:40:00', 'Madeira River Edge', 'Swimming activity', 9, 13),
('2024-03-20 09:25:00', 'Amazon Creek Pass', 'Resting on rock', 8, 14),
('2024-03-21 16:00:00', 'Manaus Observation Deck', 'Flock observed feeding', 1, 15);

SELECT * FROM sightings;

--* 1️⃣ Query to register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'

INSERT INTO rangers (name,region) VALUES ('Derek Fox', 'Coastal Plains');

SELECT * from rangers;

-- *2️⃣ Query to count unique specis ever sighted

SELECT * from sightings

SELECT COUNT(DISTINCT species_id) AS unique_species_count FROM sightings;

-- *3️⃣ Query to find all sightings where the location includes "Pass".

SELECT * FROM sightings WHERE location LIKE '%Pass%';

-- *4️⃣ Query to List each ranger's name and their total number of sightings.

select * from rangers

SELECT * from sightings

SELECT name, count(*) AS total_sightings from rangers 
    JOIN sightings ON rangers.ranger_id = sightings.ranger_id 
        GROUP BY rangers.name;

-- *5️⃣ Query to List species that have never been sighted.

SELECT * FROM species;
SELECT * FROM sightings;

SELECT sp.common_name  from species AS sp FULL JOIN sightings AS si  
    ON sp.species_id = si.species_id 
    GROUP BY common_name, si.sighting_id HAVING si.sighting_id IS NULL

-- *6️⃣ Query to find the most recent 2 sightings of each species.

SELECT * FROM sightings;
SELECT * from rangers

SELECT * from species

SELECT common_name,sighting_time,name FROM sightings JOIN species ON sightings.species_id = species.species_id JOIN rangers ON sightings.ranger_id=rangers.ranger_id ORDER BY sightings.sighting_time DESC LIMIT 2;