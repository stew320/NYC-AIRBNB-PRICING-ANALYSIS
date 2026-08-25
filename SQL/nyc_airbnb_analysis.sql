
--NYC AirBnB Market & Pricing Analysis
--Tool: Google BigQuery


--PROJECT OBJECTIVE:
--Analyze the NYC AirBnB market to identify pricing patterns, competitive positioning, market segment, and potential 
--opportunities across neighborhoods and room types.


--SECTION 1: DATA EXPLORATION & QUALITY CHECKS USING SQL

-- Total Listings: 48,895 - establishes size of dataset prior to any filtering.
--
-- SELECT 
--   COUNT(*) AS total_listings
-- FROM 
--  `sixth-beaker-478016-f6.NYC_AIRBNB.NYC_AIRBNB_LISTINGS`;
--
-- Duplicate Listing IDs: No duplicate listing IDs were found.
--
-- SELECT 
--   id,
-- COUNT(*) AS duplicate_count
-- FROM 
--  `sixth-beaker-478016-f6.NYC_AIRBNB.NYC_AIRBNB_LISTINGS`
-- GROUP BY
--  id
-- HAVING
--  COUNT(*) > 1;
--
--  Missing Values: 21 listings have missing host_name, 10,052 listings have missing reviews_per_month.
--
-- SELECT 
--  COUNTIF(host_name IS NULL) AS missing_host_names,
--  COUNTIF(reviews_per_month IS NULL) AS missing_reviews_per_month
-- FROM 
--  `sixth-beaker-478016-f6.NYC_AIRBNB.NYC_AIRBNB_LISTINGS`;
--
-- I compared the number of listings with 0 total reviews to the number of listings with a missing reviews_per_monnth value.
-- Result: Both were 10,052 listings, suggesting that the missing monthly reviews are associated with listings that have not yet received any reviews.
--
-- SELECT 
--  COUNTIF(number_of_reviews = 0 ) AS zero_review_listings,
--  COUNTIF(reviews_per_month IS NULL) AS missing_reviews_per_month
-- FROM 
--  `sixth-beaker-478016-f6.NYC_AIRBNB.NYC_AIRBNB_LISTINGS`;
--
-- Price Quality Check: Checked price field for missing or zero-dollar values that could potentially distort pricing calculations.
-- 11 listings have a price of $0.  These listings will be excluded when performing price related analysis.
--
-- SELECT 
--  COUNTIF(price = 0 ) AS zero_price_listings,
--  COUNTIF(price IS NULL) AS missing_price_listings
-- FROM 
--  `sixth-beaker-478016-f6.NYC_AIRBNB.NYC_AIRBNB_LISTINGS`;
--
-- Data Quality Summary
-- The dataset contains 48,895 listings with no duplicate listing IDs. Main quality issues found were 21 missing host names,
-- 10,052 missing monthly review values, and 11 zero-dollar listings.
-- Further analysis showed the missing reviews_per_month values correspond with listings that have zero reviews.
--
-- SECTION 2: Business Analysis
-- After completing data quality check, I used SQL to explore pricing patterns, listing volumes, and possible indicators of AirBnB demand across NYC neighborhoods.
--
-- Business Question 1: Which neighborhoods have the highest average listing prices?
--
-- Tribeca - average $490.64 - avg-median difference $199.64 - total listings 177
-- Battery Park City - average 367.56 - avg-median differnce $172.56 - total listings 70
-- Flatiron District - average $341.93 - avg-median difference $116.93 - total listings 80
--
-- SELECT 
--  neighbourhood_group,
--  neighbourhood,
--  COUNT(*) AS total_listings,
--  ROUND(AVG(price), 2) AS avg_price,
--  APPROX_QUANTILES(price, 2)[OFFSET (1)] AS median_price,
--  ROUND(AVG(price) - APPROX_QUANTILES(price, 2)[OFFSET (1)], 2) AS avg_median_difference
-- FROM 
--  `sixth-beaker-478016-f6.NYC_AIRBNB.NYC_AIRBNB_LISTINGS`
-- WHERE
--  price > 0 
-- GROUP BY
--  neighbourhood_group,
--  neighbourhood
-- HAVING 
--  COUNT(*) > 20
-- ORDER BY
--  avg_price DESC;
--
-- 

-- FINDINGS: The large gap bewtween average and median prices can indicate the high-priced outliers are inflating the neighborhood's average, and smaller
-- gaps may suggest the average is more representative of typical listing prices. Also, the volume of listings in top average price neighborhoods are
-- considerably less listings in comparison to other neighborhoods within the top average list. 

-- To identify neighborhoods where high prices are supported by a larger number of listings, I narrowed the analysis to the top 50 neighborhoods by average price, 
-- then identified those with more than 1,000 listings and compared their average and median prices to determine how representative the average price is of a 
-- typical listing.
--
-- WITH top_50 AS (
-- SELECT 
--  neighbourhood_group,
--  neighbourhood,
--  COUNT(*) AS total_listings,
--  ROUND(AVG(price), 2) AS avg_price,
--  APPROX_QUANTILES(price, 2)[OFFSET (1)] AS median_price,
--  ROUND(AVG(price) - APPROX_QUANTILES(price, 2)[OFFSET (1)], 2) AS avg_median_difference
-- FROM 
--  `sixth-beaker-478016-f6.NYC_AIRBNB.NYC_AIRBNB_LISTINGS`
-- WHERE
--  price > 0 
-- GROUP BY
--  neighbourhood_group,
--  neighbourhood
-- ORDER BY
--  avg_price DESC
-- LIMIT 50
-- )
-- SELECT *
-- FROM top_50
-- WHERE total_listings > 1000
-- ORDER BY avg_price DESC;



--
--
-- 

-- 

-- 








