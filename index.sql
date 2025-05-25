-- Active: 1747504319902@@localhost@5432@conservation_db@public
CREATE DATABASE conservation_db
--// creating tables
CREATE TABLE
    rangers (
        ranger_id SERIAL PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        region TEXT NOT NULL,
    )
CREATE TABLE
    species (
        species_id SERIAL PRIMARY KEY,
        common_name VARCHAR(50) NOT NULL,
        conservation_status TEXT NOT NULL CHECK (
            conservation_status IN (
                'Critically Endangered',
                'Endangered',
                'Vulnerable',
                'Least Concern'
            )
        )
    )

    