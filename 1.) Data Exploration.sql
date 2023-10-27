# Airbnb JerseyCity Data Exploration

#checking the data types of all columns in listing_data
SELECT column_name, data_type
FROM `airbnb-jerseycity.listing`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'listing_data';

#checking the data types of all columns in listing_details
SELECT column_name, data_type
FROM `airbnb-jerseycity.listing`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'listing_details';

#checking for number of null values in all columns

SELECT COUNT(*) - COUNT(id) AS id,
 COUNT(*) - COUNT(name) AS name,
 COUNT(*) - COUNT(host_id) AS host_id,
 COUNT(*) - COUNT(host_name) AS host_name,
 COUNT(*) - COUNT(neighbourhood_group) AS neighbourhood_group,
 COUNT(*) - COUNT(neighbourhood) AS neighbourhood,
 COUNT(*) - COUNT(latitude) AS lat,
 COUNT(*) - COUNT(longitude) AS long,
 COUNT(*) - COUNT(room_type) AS room_type,
 COUNT(*) - COUNT(price) AS price,
 COUNT(*) - COUNT(minimum_nights) AS min_nights,
 COUNT(*) - COUNT(number_of_reviews) AS num_of_reviews,
 COUNT(*) - COUNT(last_review) AS last_review,
 COUNT(*) - COUNT(reviews_per_month) AS reviews_per_month,
 COUNT(*) - COUNT(calculated_host_listings_count) AS calculated_host_listings_count,
 COUNT(*) - COUNT(availability_365) AS availability_365,
 COUNT(*) - COUNT(number_of_reviews_ltm) AS number_of_reviews_ltm,
 COUNT(*) - COUNT(license) AS license,
FROM `airbnb-jerseycity.listing.listing_data`;

#checking for duplicate rows --- none

SELECT 
COUNT(id) - COUNT(DISTINCT id) AS duplicate_id
 FROM `airbnb-jerseycity.listing.listing_data`;

#room_type - 4 unique types of rooms - Entire home/apt 845, Private 476, Shared 2, Hotel room 1

SELECT DISTINCT room_type, COUNT(room_type) AS no_of_types
FROM `airbnb-jerseycity.listing.listing_data`
GROUP BY room_type;

#neighbourhood- 6 unique neighbourhoods - Ward A,B,C,D,E,F

SELECT DISTINCT neighbourhood, COUNT(neighbourhood) AS no_of_neighbourhoods
FROM `airbnb-jerseycity.listing.listing_data`
GROUP BY neighbourhood;


#MAX and MIN price range 2401 and 24

SELECT MAX(price) AS max_price, MIN (price) AS min_price
FROM `airbnb-jerseycity.listing.listing_data`;
