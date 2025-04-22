DROP DATABASE IF EXISTS voting;
CREATE DATABASE voting;
USE voting;

-- 1. Career Categories
CREATE TABLE CareerCategories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Seniority Levels
CREATE TABLE SeniorityLevels (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    rnk INT NOT NULL DEFAULT 0
);

-- 3. Sectors
CREATE TABLE Sectors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- 4. Fields
CREATE TABLE Fields (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES CareerCategories(id) ON DELETE CASCADE
);


CREATE TABLE Careers (
    career_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    category_id INT,
    seniority_level_id INT,
    sector_id INT,
    field_id INT,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES CareerCategories(id) ON DELETE CASCADE,
    FOREIGN KEY (seniority_level_id) REFERENCES SeniorityLevels(id) ON DELETE CASCADE,
    FOREIGN KEY (sector_id) REFERENCES Sectors(id) ON DELETE CASCADE,
    FOREIGN KEY (field_id) REFERENCES Fields(id) ON DELETE CASCADE
);
