USE voting;

-- Clear existing data (if any) - in reverse order of dependencies
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE VoterNationalities;
TRUNCATE TABLE Users;
TRUNCATE TABLE Addresses;
TRUNCATE TABLE Districts;
TRUNCATE TABLE NationalityCities;
TRUNCATE TABLE Nationalities;
TRUNCATE TABLE Careers;
TRUNCATE TABLE Fields;
TRUNCATE TABLE Sectors;
TRUNCATE TABLE SeniorityLevels;
TRUNCATE TABLE CareerCategories;
SET FOREIGN_KEY_CHECKS = 1;

-- 1. Insert Career Categories
INSERT INTO CareerCategories (name) VALUES
('Technology'),
('Healthcare'),
('Education'),
('Finance'),
('Engineering'),
('Legal');

-- 2. Insert Seniority Levels
INSERT INTO SeniorityLevels (name, rnk) VALUES
('Entry Level', 1),
('Junior', 2),
('Mid Level', 3),
('Senior', 4),
('Lead', 5),
('Manager', 6),
('Director', 7),
('Executive', 8);

-- 3. Insert Sectors
INSERT INTO Sectors (name) VALUES
('Public'),
('Private'),
('Non-Profit'),
('Academic'),
('Healthcare'),
('Financial');

-- 4. Insert Fields
INSERT INTO Fields (name, category_id) VALUES
('Software Development', 1),
('Data Science', 1),
('Cybersecurity', 1),
('Nursing', 2),
('Medicine', 2),
('Primary Education', 3),
('Secondary Education', 3),
('Accounting', 4),
('Investment Banking', 4),
('Civil Engineering', 5),
('Criminal Law', 6),
('Corporate Law', 6);

-- 5. Insert Careers
INSERT INTO Careers (name, description, category_id, seniority_level_id, sector_id, field_id, start_date, end_date) VALUES
('Software Engineer', 'Development of software applications', 1, 4, 2, 1, '2020-01-01', NULL),
('Data Scientist', 'Analysis of large datasets', 1, 3, 2, 2, '2021-03-15', NULL),
('Cybersecurity Analyst', 'Protection of IT systems', 1, 3, 1, 3, '2019-07-01', NULL),
('Registered Nurse', 'Patient care in hospital settings', 2, 3, 5, 4, '2018-06-15', NULL),
('Physician', 'Medical diagnosis and treatment', 2, 4, 5, 5, '2015-08-01', NULL),
('Elementary Teacher', 'Teaching grades 1-6', 3, 3, 4, 6, '2019-08-01', NULL),
('High School Teacher', 'Teaching grades 9-12', 3, 4, 4, 7, '2017-08-15', NULL),
('Accountant', 'Financial reporting and analysis', 4, 3, 6, 8, '2020-02-10', NULL),
('Investment Banker', 'Financial deal-making', 4, 5, 6, 9, '2018-01-20', NULL),
('Civil Engineer', 'Infrastructure design', 5, 4, 1, 10, '2016-05-05', NULL),
('Criminal Lawyer', 'Defense attorney', 6, 4, 2, 11, '2014-09-01', NULL),
('Corporate Counsel', 'In-house legal advisor', 6, 6, 2, 12, '2013-11-15', NULL),
('IT Manager', 'Management of IT department', 1, 6, 2, 1, '2015-04-10', NULL),
('Nurse Practitioner', 'Advanced nursing practice', 2, 5, 5, 4, '2017-03-01', NULL),
('School Principal', 'School administration', 3, 7, 4, 6, '2012-07-15', NULL);

-- 6. Insert Nationalities
INSERT INTO Nationalities (name) VALUES
('American'),
('Canadian'),
('British'),
('Australian'),
('German'),
('French'),
('Japanese'),
('Indian');

-- 7. Insert Cities by Nationality
INSERT INTO NationalityCities (nationality_id, name) VALUES
-- American Cities
(1, 'New York'),
(1, 'Los Angeles'),
(1, 'Chicago'),
(1, 'Houston'),
(1, 'Miami'),
-- Canadian Cities
(2, 'Toronto'),
(2, 'Vancouver'),
(2, 'Montreal'),
(2, 'Calgary'),
-- British Cities
(3, 'London'),
(3, 'Manchester'),
(3, 'Birmingham'),
(3, 'Edinburgh'),
-- Australian Cities
(4, 'Sydney'),
(4, 'Melbourne'),
(4, 'Brisbane'),
(4, 'Perth'),
-- German Cities
(5, 'Berlin'),
(5, 'Munich'),
(5, 'Hamburg'),
-- French Cities
(6, 'Paris'),
(6, 'Lyon'),
(6, 'Marseille'),
-- Japanese Cities
(7, 'Tokyo'),
(7, 'Osaka'),
(7, 'Kyoto'),
-- Indian Cities
(8, 'Mumbai'),
(8, 'Delhi'),
(8, 'Bangalore');

-- 8. Insert Districts
INSERT INTO Districts (name, city_id) VALUES
-- New York Districts
('Manhattan', 1),
('Brooklyn', 1),
('Queens', 1),
('Bronx', 1),
('Staten Island', 1),
-- Los Angeles Districts
('Downtown', 2),
('Hollywood', 2),
('Venice', 2),
('Santa Monica', 2),
-- Chicago Districts
('Loop', 3),
('Lincoln Park', 3),
('Wicker Park', 3),
-- Houston Districts
('Downtown Houston', 4),
('Midtown', 4),
('Montrose', 4),
-- Miami Districts
('Downtown Miami', 5),
('South Beach', 5),
('Wynwood', 5),
-- Toronto Districts
('Downtown Toronto', 6),
('North York', 6),
('Scarborough', 6),
-- Vancouver Districts
('Downtown Vancouver', 7),
('West End', 7),
('Kitsilano', 7),
-- Montreal Districts
('Downtown Montreal', 8),
('Old Montreal', 8),
('Plateau Mont-Royal', 8),
-- Calgary Districts
('Downtown Calgary', 9),
('Beltline', 9),
('Inglewood', 9),
-- London Districts
('Westminster', 10),
('Camden', 10),
('Kensington', 10),
('Hackney', 10),
-- Manchester Districts
('City Centre', 11),
('Salford', 11),
('Didsbury', 11),
-- Birmingham Districts
('City Centre Birmingham', 12),
('Edgbaston', 12),
('Moseley', 12),
-- Edinburgh Districts
('Old Town', 13),
('New Town', 13),
('Leith', 13),
-- Sydney Districts
('CBD', 14),
('Bondi', 14),
('Manly', 14),
-- Melbourne Districts
('CBD Melbourne', 15),
('St Kilda', 15),
('Fitzroy', 15),
-- Brisbane Districts
('CBD Brisbane', 16),
('South Bank', 16),
('Fortitude Valley', 16),
-- Perth Districts
('CBD Perth', 17),
('Fremantle', 17),
('Subiaco', 17),
-- Berlin Districts
('Mitte', 18),
('Kreuzberg', 18),
('Charlottenburg', 18),
-- Munich Districts
('Altstadt', 19),
('Schwabing', 19),
('Maxvorstadt', 19),
-- Hamburg Districts
('Altstadt Hamburg', 20),
('St. Pauli', 20),
('Eimsbuettel', 20),
-- Paris Districts
('1st Arrondissement', 21),
('Montmartre', 21),
('Le Marais', 21),
-- Lyon Districts
('Presqu\'île', 22),
('Croix-Rousse', 22),
('Vieux Lyon', 22),
-- Marseille Districts
('Vieux-Port', 23),
('Le Panier', 23),
('Notre-Dame', 23),
-- Tokyo Districts
('Shinjuku', 24),
('Shibuya', 24),
('Ginza', 24),
-- Osaka Districts
('Umeda', 25),
('Namba', 25),
('Tennoji', 25),
-- Kyoto Districts
('Higashiyama', 26),
('Arashiyama', 26),
('Gion', 26),
-- Mumbai Districts
('South Mumbai', 27),
('Bandra', 27),
('Andheri', 27),
-- Delhi Districts
('New Delhi', 28),
('Old Delhi', 28),
('Connaught Place', 28),
-- Bangalore Districts
('MG Road', 29),
('Indiranagar', 29),
('Koramangala', 29);
select 1;
-- Insert Addresses with both district_id and city_id
INSERT INTO Addresses (street, district_id, city_id, postal_code) VALUES
-- New York addresses (city_id = 1)
('123 Broadway', 1, 1, '10001'),
('456 Bedford Ave', 2, 1, '11201'),
('789 Queens Blvd', 3, 1, '11375'),
('321 Grand Concourse', 4, 1, '10451'),
('654 Victory Blvd', 5, 1, '10301'),
-- Los Angeles addresses (city_id = 2)
('123 Main St', 6, 2, '90012'),
('456 Sunset Blvd', 7, 2, '90028'),
('789 Abbot Kinney Blvd', 8, 2, '90291'),
('321 Ocean Ave', 9, 2, '90401'),
-- Chicago addresses (city_id = 3)
('123 Michigan Ave', 10, 3, '60601'),
('456 Fullerton Pkwy', 11, 3, '60614'),
('789 Milwaukee Ave', 12, 3, '60622'),
-- Houston addresses (city_id = 4)
('123 Main St Houston', 13, 4, '77002'),
('456 Gray St', 14, 4, '77002'),
('789 Westheimer Rd', 15, 4, '77006'),
-- Miami addresses (city_id = 5)
('123 Biscayne Blvd', 16, 5, '33132'),
('456 Ocean Drive', 17, 5, '33139'),
('789 NW 2nd Ave', 18, 5, '33127'),
-- Toronto addresses (city_id = 6)
('123 Yonge St', 19, 6, 'M5B 2H1'),
('456 Sheppard Ave', 20, 6, 'M2N 6S6'),
('789 Kingston Rd', 21, 6, 'M1N 1S5'),
-- Vancouver addresses (city_id = 7)
('123 Robson St', 22, 7, 'V6Z 2E7'),
('456 Denman St', 23, 7, 'V6G 2L5'),
('789 West 4th Ave', 24, 7, 'V6K 1N8'),
-- Montreal addresses (city_id = 8)
('123 Rue Sainte-Catherine', 25, 8, 'H2X 1K4'),
('456 Rue Saint-Paul', 26, 8, 'H2Y 1Y6'),
('789 Avenue Mont-Royal', 27, 8, 'H2J 1W8'),
-- Calgary addresses (city_id = 9)
('123 Stephen Ave', 28, 9, 'T2P 1K3'),
('456 17th Ave SW', 29, 9, 'T2S 0A1'),
('789 9th Ave SE', 30, 9, 'T2G 5H6'),
-- London addresses (city_id = 10)
('10 Downing Street', 31, 10, 'SW1A 2AA'),
('123 Camden High St', 32, 10, 'NW1 7JR'),
('456 Kensington High St', 33, 10, 'W8 5ED'),
('789 Broadway Market', 34, 10, 'E8 4QJ'),
-- Manchester addresses (city_id = 11)
('123 Deansgate', 35, 11, 'M3 4EN'),
('456 Chapel St', 36, 11, 'M3 5DF'),
('789 Wilmslow Rd', 37, 11, 'M20 6RA'),
-- Birmingham addresses (city_id = 12)
('123 New St', 38, 12, 'B2 4DR'),
('456 Hagley Rd', 39, 12, 'B16 8NH'),
('789 St Mary\'s Row', 40, 12, 'B13 9EZ'),
-- Edinburgh addresses (city_id = 13)
('123 Royal Mile', 41, 13, 'EH1 1SG'),
('456 Princes St', 42, 13, 'EH2 4BJ'),
('789 Constitution St', 43, 13, 'EH6 7BS'),
-- Sydney addresses (city_id = 14)
('123 George St', 44, 14, '2000'),
('456 Campbell Parade', 45, 14, '2026'),
('789 The Corso', 46, 14, '2095'),
-- Melbourne addresses (city_id = 15)
('123 Collins St', 47, 15, '3000'),
('456 Acland St', 48, 15, '3182'),
('789 Brunswick St', 49, 15, '3065'),
-- Brisbane addresses (city_id = 16)
('123 Queen St', 50, 16, '4000'),
('456 Grey St', 51, 16, '4101'),
('789 Brunswick St', 52, 16, '4006'),
-- Perth addresses (city_id = 17)
('123 St Georges Terrace', 53, 17, '6000'),
('456 South Terrace', 54, 17, '6162'),
('789 Rokeby Rd', 55, 17, '6008'),
-- Berlin addresses (city_id = 18)
('123 Unter den Linden', 56, 18, '10117'),
('456 Oranienstr', 57, 18, '10999'),
('789 Kurfürstendamm', 58, 18, '10719'),
-- Munich addresses (city_id = 19)
('123 Maximilianstrasse', 59, 19, '80539'),
('456 Leopoldstrasse', 60, 19, '80802'),
('789 Ludwigstrasse', 61, 19, '80539'),
-- Hamburg addresses (city_id = 20)
('123 Jungfernstieg', 62, 20, '20354'),
('456 Reeperbahn', 63, 20, '20359'),
('789 Osterstrasse', 64, 20, '20259'),
-- Paris addresses (city_id = 21)
('123 Rue de Rivoli', 65, 21, '75001'),
('456 Rue Lepic', 66, 21, '75018'),
('789 Rue des Rosiers', 67, 21, '75004'),
-- Lyon addresses (city_id = 22)
('123 Rue de la République', 68, 22, '69002'),
('456 Rue des Capucins', 69, 22, '69001'),
('789 Rue Saint-Jean', 70, 22, '69005'),
-- Marseille addresses (city_id = 23)
('123 Quai du Port', 71, 23, '13002'),
('456 Rue du Panier', 72, 23, '13002'),
('789 Rue Breteuil', 73, 23, '13006'),
-- Tokyo addresses (city_id = 24)
('123 Shinjuku Dori', 74, 24, '160-0022'),
('456 Dogenzaka', 75, 24, '150-0043'),
('789 Chuo Dori', 76, 24, '104-0061'),
-- Osaka addresses (city_id = 25)
('123 Umeda', 77, 25, '530-0001'),
('456 Dotonbori', 78, 25, '542-0071'),
('789 Tennoji', 79, 25, '543-0055'),
-- Kyoto addresses (city_id = 26)
('123 Higashiyama-ku', 80, 26, '605-0825'),
('456 Arashiyama', 81, 26, '616-0007'),
('789 Gion', 82, 26, '605-0073'),
-- Mumbai addresses (city_id = 27)
('123 Colaba Causeway', 83, 27, '400005'),
('456 Linking Road', 84, 27, '400050'),
('789 Andheri East', 85, 27, '400069'),
-- Delhi addresses (city_id = 28)
('123 Connaught Place', 86, 28, '110001'),
('456 Chandni Chowk', 87, 28, '110006'),
('789 Connaught Circus', 88, 28, '110001'),
-- Bangalore addresses (city_id = 29)
('123 MG Road', 89, 29, '560001'),
('456 100 Feet Road', 90, 29, '560038'),
('789 80 Feet Road', 91, 29, '560034');

-- 10. Insert Users
INSERT INTO Users (user_id, first_name, middle_name, last_name, gender, address_id, nationality_id, career_id) VALUES
(1001, 'John', 'Robert', 'Smith', 'male', 1, 1, 1),
(1002, 'Emma', NULL, 'Johnson', 'female', 2, 1, 2),
(1003, 'Michael', 'James', 'Williams', 'male', 3, 1, 3),
(1004, 'Sarah', 'Elizabeth', 'Brown', 'female', 4, 1, 4),
(1005, 'David', NULL, 'Miller', 'male', 5, 1, 5),
(1006, 'Lisa', 'Marie', 'Davis', 'female', 6, 1, 6),
(1007, 'Robert', 'Joseph', 'Garcia', 'male', 7, 1, 7),
(1008, 'Jennifer', 'Lynn', 'Rodriguez', 'female', 8, 1, 8),
(1009, 'William', 'Thomas', 'Martinez', 'male', 9, 1, 9),
(1010, 'Patricia', NULL, 'Hernandez', 'female', 10, 1, 10),
(1011, 'James', 'Edward', 'Lopez', 'male', 11, 1, 11),
(1012, 'Mary', 'Ann', 'Gonzalez', 'female', 12, 1, 12),
(1013, 'Charles', 'Richard', 'Wilson', 'male', 13, 1, 13),
(1014, 'Susan', 'Marie', 'Anderson', 'female', 14, 1, 14),
(1015, 'Joseph', 'Daniel', 'Thomas', 'male', 15, 1, 15),
(1016, 'Margaret', 'Jean', 'Taylor', 'female', 16, 1, 1),
(1017, 'Christopher', NULL, 'Moore', 'male', 17, 1, 2),
(1018, 'Jessica', 'Louise', 'Jackson', 'female', 18, 1, 3),
(1019, 'Daniel', 'Paul', 'Martin', 'male', 19, 2, 4),
(1020, 'Nancy', 'Carol', 'Lee', 'female', 20, 2, 5),
(1021, 'Matthew', 'John', 'Perez', 'male', 21, 2, 6),
(1022, 'Karen', 'Elizabeth', 'Thompson', 'female', 22, 2, 7),
(1023, 'Anthony', NULL, 'White', 'male', 23, 2, 8),
(1024, 'Betty', 'Ann', 'Harris', 'female', 24, 2, 9),
(1025, 'Donald', 'Joseph', 'Sanchez', 'male', 25, 2, 10),
(1026, 'Helen', 'Marie', 'Clark', 'female', 26, 2, 11),
(1027, 'Mark', 'Steven', 'Ramirez', 'male', 27, 2, 12),
(1028, 'Sandra', 'Lee', 'Lewis', 'female', 28, 2, 13),
(1029, 'Paul', 'Michael', 'Robinson', 'male', 29, 2, 14),
(1030, 'Ashley', NULL, 'Walker', 'female', 30, 2, 15),
(1031, 'Steven', 'Edward', 'Young', 'male', 31, 3, 1),
(1032, 'Kimberly', 'Ann', 'Allen', 'female', 32, 3, 2),
(1033, 'Andrew', 'James', 'King', 'male', 33, 3, 3),
(1034, 'Donna', 'Marie', 'Wright', 'female', 34, 3, 4),
(1035, 'Joshua', NULL, 'Scott', 'male', 35, 3, 5),
(1036, 'Carol', 'Jean', 'Torres', 'female', 36, 3, 6),
(1037, 'Timothy', 'Robert', 'Nguyen', 'male', 37, 3, 7),
(1038, 'Michelle', 'Lynn', 'Hill', 'female', 38, 3, 8),
(1039, 'George', 'Thomas', 'Flores', 'male', 39, 3, 9),
(1040, 'Stephanie', NULL, 'Green', 'female', 40, 3, 10),
(1041, 'Kenneth', 'William', 'Adams', 'male', 41, 3, 11),
(1042, 'Deborah', 'Ann', 'Nelson', 'female', 42, 3, 12),
(1043, 'Brian', 'Joseph', 'Baker', 'male', 43, 3, 13),
(1044, 'Amanda', 'Marie', 'Hall', 'female', 44, 4, 14),
(1045, 'Kevin', 'Michael', 'Rivera', 'male', 45, 4, 15),
(1046, 'Melissa', 'Jean', 'Campbell', 'female', 46, 4, 1),
(1047, 'Edward', NULL, 'Mitchell', 'male', 47, 4, 2),
(1048, 'Debra', 'Lynn', 'Carter', 'female', 48, 4, 3),
(1049, 'Ronald', 'James', 'Roberts', 'male', 49, 4, 4),
(1050, 'Stephanie', 'Elizabeth', 'Gomez', 'female', 50, 4, 5);
select 1;

-- 11. Insert VoterNationalities
INSERT INTO VoterNationalities (NID, user_id, nationality_id, city_id, district_id) VALUES
-- American voters in different U.S. cities
(100101, 1001, 1, 1, 1),  -- John Smith in Manhattan, New York
(100202, 1002, 1, 1, 2),  -- Emma Johnson in Brooklyn, New York
(100303, 1003, 1, 1, 3),  -- Michael Williams in Queens, New York
(100404, 1004, 1, 1, 4),  -- Sarah Brown in Bronx, New York
(100505, 1005, 1, 1, 5),  -- David Miller in Staten Island, New York
(100606, 1006, 1, 2, 6),  -- Lisa Davis in Downtown LA
(100707, 1007, 1, 2, 7),  -- Robert Garcia in Hollywood
(100808, 1008, 1, 2, 8),  -- Jennifer Rodriguez in Venice
(100909, 1009, 1, 2, 9),  -- William Martinez in Santa Monica
(101010, 1010, 1, 3, 10), -- Patricia Hernandez in Loop, Chicago
(101111, 1011, 1, 3, 11), -- James Lopez in Lincoln Park, Chicago
(101212, 1012, 1, 3, 12), -- Mary Gonzalez in Wicker Park, Chicago
(101313, 1013, 1, 4, 13), -- Charles Wilson in Downtown Houston
(101414, 1014, 1, 4, 14), -- Susan Anderson in Midtown Houston
(101515, 1015, 1, 4, 15), -- Joseph Thomas in Montrose Houston
(101616, 1016, 1, 5, 16), -- Margaret Taylor in Downtown Miami
(101717, 1017, 1, 5, 17), -- Christopher Moore in South Beach Miami
(101818, 1018, 1, 5, 18), -- Jessica Jackson in Wynwood Miami

-- Canadian voters in different Canadian cities
(201919, 1019, 2, 6, 19), -- Daniel Martin in Downtown Toronto
(202020, 1020, 2, 6, 20), -- Nancy Lee in North York
(202121, 1021, 2, 6, 21), -- Matthew Perez in Scarborough
(202222, 1022, 2, 7, 22), -- Karen Thompson in Downtown Vancouver
(202323, 1023, 2, 7, 23), -- Anthony White in West End Vancouver
(202424, 1024, 2, 7, 24), -- Betty Harris in Kitsilano Vancouver
(202525, 1025, 2, 8, 25), -- Donald Sanchez in Downtown Montreal
(202626, 1026, 2, 8, 26), -- Helen Clark in Old Montreal
(202727, 1027, 2, 8, 27), -- Mark Ramirez in Plateau Mont-Royal
(202828, 1028, 2, 9, 28), -- Sandra Lewis in Downtown Calgary
(202929, 1029, 2, 9, 29), -- Paul Robinson in Beltline Calgary
(203030, 1030, 2, 9, 30), -- Ashley Walker in Inglewood Calgary

-- British voters in different UK cities
(303131, 1031, 3, 10, 31), -- Steven Young in Westminster London
(303232, 1032, 3, 10, 32), -- Kimberly Allen in Camden London
(303333, 1033, 3, 10, 33), -- Andrew King in Kensington London
(303434, 1034, 3, 10, 34), -- Donna Wright in Hackney London
(303535, 1035, 3, 11, 35), -- Joshua Scott in City Centre Manchester
(303636, 1036, 3, 11, 36), -- Carol Torres in Salford Manchester
(303737, 1037, 3, 11, 37), -- Timothy Nguyen in Didsbury Manchester
(303838, 1038, 3, 12, 38), -- Michelle Hill in City Centre Birmingham
(303939, 1039, 3, 12, 39), -- George Flores in Edgbaston Birmingham
(304040, 1040, 3, 12, 40), -- Stephanie Green in Moseley Birmingham
(304141, 1041, 3, 13, 41), -- Kenneth Adams in Old Town Edinburgh
(304242, 1042, 3, 13, 42), -- Deborah Nelson in New Town Edinburgh
(304343, 1043, 3, 13, 43), -- Brian Baker in Leith Edinburgh

-- Australian voters in different Australian cities
(404444, 1044, 4, 14, 44), -- Amanda Hall in CBD Sydney
(404545, 1045, 4, 14, 45), -- Kevin Rivera in Bondi Sydney
(404646, 1046, 4, 14, 46), -- Melissa Campbell in Manly Sydney
(404747, 1047, 4, 15, 47), -- Edward Mitchell in CBD Melbourne
(404848, 1048, 4, 15, 48), -- Debra Carter in St Kilda Melbourne
(404949, 1049, 4, 15, 49), -- Ronald Roberts in Fitzroy Melbourne
(405050, 1050, 4, 16, 50); -- Stephanie Gomez in CBD Brisbane

select "zobr";