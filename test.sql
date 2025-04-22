USE voting;

-- Test 1: Basic consistency check
-- Verify that districts belong to the correct cities
SELECT 
    d.district_id, 
    d.name AS district_name, 
    d.city_id AS district_city_id,
    nc.city_id AS city_id,
    nc.name AS city_name,
    n.name AS nationality_name
FROM 
    Districts d
JOIN 
    NationalityCities nc ON d.city_id = nc.city_id
JOIN 
    Nationalities n ON nc.nationality_id = n.nationality_id
LIMIT 15;

-- Test 2: Address validation
-- Check that addresses have consistent district and city IDs
SELECT 
    a.address_id,
    a.street,
    a.district_id,
    a.city_id AS address_city_id,
    d.city_id AS district_city_id,
    d.name AS district_name,
    nc.name AS city_name
FROM 
    Addresses a
JOIN 
    Districts d ON a.district_id = d.district_id
JOIN 
    NationalityCities nc ON a.city_id = nc.city_id
WHERE 
    a.city_id != d.city_id
LIMIT 10;
-- If this query returns rows, there are inconsistencies between address city and district city

-- Test 3: Complete user profile data
-- Join all tables to get complete user profiles
SELECT 
    u.user_id,
    CONCAT(u.first_name, ' ', IFNULL(u.middle_name, ''), ' ', u.last_name) AS full_name,
    u.gender,
    a.street AS address,
    a.postal_code,
    d.name AS district,
    nc.name AS city,
    n.name AS nationality,
    c.name AS career,
    cc.name AS career_category,
    f.name AS field,
    s.name AS sector,
    sl.name AS seniority_level
FROM 
    Users u
JOIN 
    Addresses a ON u.address_id = a.address_id
JOIN 
    Districts d ON a.district_id = d.district_id
JOIN 
    NationalityCities nc ON a.city_id = nc.city_id
JOIN 
    Nationalities n ON u.nationality_id = n.nationality_id
JOIN 
    Careers c ON u.career_id = c.career_id
LEFT JOIN 
    CareerCategories cc ON c.category_id = cc.id
LEFT JOIN 
    Fields f ON c.field_id = f.id
LEFT JOIN 
    Sectors s ON c.sector_id = s.id
LEFT JOIN 
    SeniorityLevels sl ON c.seniority_level_id = sl.id
LIMIT 10;

-- Test 4: Voter validation
-- Test that voters are registered in districts that match their nationality
SELECT 
    vn.NID,
    CONCAT(u.first_name, ' ', u.last_name) AS voter_name,
    n.name AS registered_nationality,
    nc.name AS registered_city,
    d.name AS registered_district,
    original_n.name AS user_nationality
FROM 
    VoterNationalities vn
JOIN 
    Users u ON vn.user_id = u.user_id
JOIN 
    Nationalities n ON vn.nationality_id = n.nationality_id
JOIN 
    NationalityCities nc ON vn.city_id = nc.city_id
JOIN 
    Districts d ON vn.district_id = d.district_id
JOIN 
    Nationalities original_n ON u.nationality_id = original_n.nationality_id
WHERE 
     vn.nationality_id != u.nationality_id
LIMIT 10;
-- If this returns rows, there are voters registered with a different nationality than their user profile

-- Test 5: Test the trigger functionality
-- This should succeed - valid city/district for nationality
INSERT INTO VoterNationalities (NID, user_id, nationality_id, city_id, district_id) 
VALUES (999001, 1001, 1, 3, 10)  -- American nationality with Chicago city and Loop district
ON DUPLICATE KEY UPDATE user_id = 1001;

-- This should fail - invalid city/district for nationality
-- Uncomment to test the error (Tokyo is not an American city)
/*
INSERT INTO VoterNationalities (NID, user_id, nationality_id, city_id, district_id) 
VALUES (999002, 1002, 1, 24, 74);
*/

-- Test 6: Career statistics
-- Count users by career category
SELECT 
    cc.name AS career_category,
    COUNT(u.user_id) AS user_count
FROM 
    CareerCategories cc
JOIN 
    Careers c ON cc.id = c.category_id
JOIN 
    Users u ON c.career_id = u.career_id
GROUP BY 
    cc.id, cc.name
ORDER BY 
    user_count DESC;

-- Test 7: Geographic distribution
-- Count users by nationality and city
SELECT 
    n.name AS nationality,
    nc.name AS city,
    COUNT(u.user_id) AS user_count
FROM 
    Users u
JOIN 
    Addresses a ON u.address_id = a.address_id
JOIN 
    NationalityCities nc ON a.city_id = nc.city_id
JOIN 
    Nationalities n ON nc.nationality_id = n.nationality_id
GROUP BY 
    n.nationality_id, n.name, nc.city_id, nc.name
ORDER BY 
    n.name, user_count DESC;

-- Test 8: Find users who live in a district but are registered to vote in another
SELECT 
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    d_live.name AS residence_district,
    nc_live.name AS residence_city,
    d_vote.name AS voting_district,
    nc_vote.name AS voting_city
FROM 
    Users u
JOIN 
    Addresses a ON u.address_id = a.address_id
JOIN 
    Districts d_live ON a.district_id = d_live.district_id
JOIN 
    NationalityCities nc_live ON a.city_id = nc_live.city_id
JOIN 
    VoterNationalities vn ON u.user_id = vn.user_id
JOIN 
    Districts d_vote ON vn.district_id = d_vote.district_id
JOIN 
    NationalityCities nc_vote ON vn.city_id = nc_vote.city_id
WHERE 
    a.district_id != vn.district_id
LIMIT 20;

-- Test 9: Gender distribution by nationality
SELECT 
    n.name AS nationality,
    u.gender,
    COUNT(u.user_id) AS count
FROM 
    Users u
JOIN 
    Nationalities n ON u.nationality_id = n.nationality_id
GROUP BY 
    n.nationality_id, n.name, u.gender
ORDER BY 
    n.name, u.gender;

-- Test 10: Career progression by seniority level
SELECT 
    sl.name AS seniority,
    sl.rnk,
    COUNT(u.user_id) AS count
FROM 
    SeniorityLevels sl
JOIN 
    Careers c ON sl.id = c.seniority_level_id
JOIN 
    Users u ON c.career_id = u.career_id
GROUP BY 
    sl.id, sl.name, sl.rnk
ORDER BY 
    sl.rnk;