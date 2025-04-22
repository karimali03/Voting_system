

INSERT INTO Nationalities (name) VALUES 
('American'),
('British'),
('Canadian'),
('French'),
('German');

INSERT INTO NationalityCities (nationality_id, name) VALUES 
(1, 'New York'),
(1, 'Los Angeles'),
(2, 'London'),
(2, 'Manchester'),
(3, 'Toronto'),
(3, 'Vancouver'),
(4, 'Paris'),
(4, 'Lyon'),
(5, 'Berlin'),
(5, 'Munich');

INSERT INTO Districts (name, city_id) VALUES 
('Manhattan', 1),
('Brooklyn', 1),
('Hollywood', 2),
('Downtown LA', 2),
('Westminster', 3),
('Camden', 3),
('City Centre', 4),
('Salford', 4),
('Downtown', 5),
('Scarborough', 5),
('West End', 6),
('Gastown', 6),
('Le Marais', 7),
('Montmartre', 7),
('Presqu''île', 8),
('Vieux Lyon', 8),
('Mitte', 9),
('Kreuzberg', 9),
('Altstadt', 10),
('Schwabing', 10);

INSERT INTO Users (user_id, first_name, middle_name, last_name, gender, nationality_id) VALUES 
(1, 'John', 'A', 'Smith', 'male', 1),
(2, 'Emily', NULL, 'Johnson', 'female', 2),
(3, 'Michael', 'B', 'Williams', 'male', 3),
(4, 'Sarah', 'C', 'Brown', 'female', 4),
(5, 'David', NULL, 'Jones', 'male', 5),
(6, 'Jennifer', 'D', 'Miller', 'female', 1),
(7, 'Robert', NULL, 'Davis', 'male', 2),
(8, 'Lisa', 'E', 'Garcia', 'female', 3),
(9, 'Thomas', NULL, 'Rodriguez', 'male', 4),
(10, 'Jessica', 'F', 'Wilson', 'female', 5);

INSERT INTO VoterNationalities (NID, user_id, nationality_id, city_id, district_id) VALUES 
(1001, 1, 1, 1, 1),  -- American in New York/Manhattan
(1002, 2, 2, 3, 5),  -- British in London/Westminster
(1003, 3, 3, 5, 9),  -- Canadian in Toronto/Downtown
(1004, 4, 4, 7, 13), -- French in Paris/Le Marais
(1005, 5, 5, 9, 17), -- German in Berlin/Mitte
(1006, 6, 1, 2, 3),  -- American in Los Angeles/Hollywood
(1007, 7, 2, 4, 7),  -- British in Manchester/City Centre
(1008, 8, 3, 6, 11), -- Canadian in Vancouver/West End
(1009, 9, 4, 8, 15), -- French in Lyon/Presqu'île
(1010, 10, 5, 10, 19); -- German in Munich/Altstadt

SELECT u.user_id, u.first_name, u.last_name, n.name AS nationality, 
       nc.name AS city, d.name AS district
FROM Users u
JOIN VoterNationalities vn ON u.user_id = vn.user_id
JOIN Nationalities n ON vn.nationality_id = n.nationality_id
JOIN NationalityCities nc ON vn.city_id = nc.city_id
JOIN Districts d ON vn.district_id = d.district_id;

-- This should fail because city_id 1 (New York) doesn't belong to nationality_id 2 (British)
INSERT INTO VoterNationalities (NID, user_id, nationality_id, city_id, district_id) 
VALUES (1011, 2, 2, 1, 1);

