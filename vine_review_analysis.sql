-- Deliverable 2: Determine Bias of Vine Reviews

-- Create Vine Table
-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

-- Import data from vine_table.csv
-- Check Table
SELECT * FROM vine_table; 


-- Filter data and create where the total_votes count is greater or equal to 20
Select  review_id, star_rating, helpful_votes, total_votes, 
vine, verified_purchase 
INTO votes20_table
FROM vine_table
WHERE total_votes >= 20;

-- Check table
SELECT * FROM votes20_table;


--  Filter data for all rows where the number of helpful_votes divided by total_votes is equal to or greater than 50%
SELECT review_id, star_rating, helpful_votes,
total_votes, vine, verified_purchase
INTO help_votes_table
FROM votes20_table
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5;

-- check table
SELECT * FROM  help_votes_table; 


-- Retrieve all rows where a reviews was vine a 'Y' (paid)
SELECT review_id, star_rating, helpful_votes, total_votes,
vine, verified_purchase 
INTO vine_yes_paid
FROM help_votes_table
WHERE vine = 'Y'; 

--  check table 
SELECT * FROM  vine_yes_paid; 


-- Retrieve all rows where a reviews was vine a 'N' (unpaid)
SELECT review_id, star_rating, helpful_votes, total_votes,
vine, verified_purchase 
INTO vine_no_unpaid
FROM help_votes_table
WHERE vine = 'N'; 

-- check table 
SELECT * FROM vine_no_unpaid;

--SELECT Count
-- Determine the total number of reviews, the number of 5-star reviews, and percentage of 5-star reviews for paid vs unpaid
-- Vine Reviews Paid, 'Y'
SELECT * FROM  vine_yes_paid; 

--SELECT COUNT (review_id)
--Sum (CASE WHEN star_rating = 5 then 'Five Star Rating')
   Else  'less that 5 stars'
--FROM vine_yes_paid; 