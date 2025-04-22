DROP DATABASE IF EXISTS voting;
CREATE DATABASE voting;

USE voting;

CREATE TABLE Nationalities (
    nationality_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE NationalityCities(
    city_id INT PRIMARY KEY AUTO_INCREMENT,
    nationality_id INT,
    name VARCHAR(100) NOT NULL UNIQUE,
    FOREIGN KEY (nationality_id) REFERENCES Nationalities(nationality_id) ON DELETE CASCADE
);

CREATE TABLE Districts(
    district_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    city_id INT NOT NULL,
    FOREIGN KEY (city_id) REFERENCES NationalityCities(city_id) ON DELETE CASCADE
);

CREATE TABLE Users(
    user_id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    middle_name VARCHAR(30),
    last_name VARCHAR(30) NOT NULL,
    gender ENUM("male", "female") NOT NULL,
    address_id INT,
    nationality_id INT,
    FOREIGN KEY (nationality_id) REFERENCES Nationalities(nationality_id)
);

CREATE TABLE VoterNationalities (
    NID int NOT NULL UNIQUE,
    user_id INT NOT NULL,
    nationality_id INT NOT NULL,
    city_id INT NOT NULL,
    district_id INT NOT NULL,
    PRIMARY KEY (NID),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (nationality_id) REFERENCES Nationalities(nationality_id) ON DELETE CASCADE,
    FOREIGN KEY (city_id) REFERENCES NationalityCities(city_id) ON DELETE CASCADE,
    FOREIGN KEY (district_id) REFERENCES Districts(district_id) ON DELETE CASCADE
);

DELIMITER //

CREATE TRIGGER validate_city_for_nationality
BEFORE INSERT ON VoterNationalities
FOR EACH ROW
BEGIN
  DECLARE valid INT;
  SELECT COUNT(*) INTO valid
  FROM NationalityCities 
  JOIN Districts ON Districts.city_id = NationalityCities.city_id
  WHERE NationalityCities.city_id = NEW.city_id 
    AND NationalityCities.nationality_id = NEW.nationality_id 
    AND Districts.district_id = NEW.district_id;

  IF valid = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'City or district does not belong to nationality';
  END IF;
END;
//

DELIMITER ;