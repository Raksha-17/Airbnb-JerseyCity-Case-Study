# Airbnb JerseyCity Data Analysis

# How/where are tourists/Airbnb guests spending their money in JerseyCity?
# What makes a successful host in JerseyCity?
# Strategy suggestions for Airbnb in JerseyCity?

#How many Airbnb hosts are there in Jersey City currently?
SELECT COUNT (DISTINCT host_id)
 FROM `airbnb-jerseycity.listing.listing_data`;
# 579 unique hosts

#How many Airbnb listings are there in Jersey City currently?
 SELECT COUNT (DISTINCT id)
 FROM `airbnb-jerseycity.listing.listing_data`;
#1,324 unique listings

#hosts with multiple listings
SELECT no_of_listing_per_host, COUNT(host_id) AS count_of_host,COUNT(host_id)/SUM(COUNT(host_id)) over () percentage
 FROM
 (SELECT host_id, COUNT(DISTINCT id) AS no_of_listing_per_host
 FROM `airbnb-jerseycity.listing.listing_data`
 GROUP BY host_id)
 AS A
 GROUP BY no_of_listing_per_host
 ORDER BY no_of_listing_per_host;
# About (72%) hosts only have one listing, other hosts could have multiple listings (up to as many as 400)

 #Number of listings and average price by neighbourhood
 SELECT neighbourhood,COUNT (id) AS number_of_listing,
 AVG(price) AS avg_price
 FROM `airbnb-jerseycity.listing.listing_data`
 GROUP BY neighbourhood
 ORDER BY AVG(price) DESC;
# Some of the more rural/remote neighbourhoods have higher average prices, my guess is that the properties tend to be larger for these areas (room type/beds)

 #Number of listing and average price by room type
 SELECT room_type, COUNT (id) AS number_of_listing,
 AVG(price) AS avg_price
 FROM `airbnb-jerseycity.listing.listing_data`
 GROUP BY room_type
 ORDER BY AVG(price) DESC;

 #Average price per bed by neighbourhood
SELECT `airbnb-jerseycity.listing.listing_data`.neighbourhood,
SUM(`airbnb-jerseycity.listing.listing_data`.price)/SUM (`airbnb-jerseycity.listing.listing_details`.beds) AS price_per_bed
FROM `airbnb-jerseycity.listing.listing_data`
INNER JOIN `airbnb-jerseycity.listing.listing_details`
ON `airbnb-jerseycity.listing.listing_data`.id = `airbnb-jerseycity.listing.listing_details`.id
GROUP BY `airbnb-jerseycity.listing.listing_data`.neighbourhood
ORDER BY price_per_bed;
# This looks more like it, guests pay more $ for places downtown on average

# Neighbourhoods with the biggest revenue potential
# Measure "potential" - with availability 30, I am making the assumption here that more than 30 days (before 2022-12-01) is too far away for people to book Airbnb for a trip
# Limitaion - availability being 0 could also mean that the host simply blocked the calendar (I am seleting only the ones who has been reviewed in the past 12 months assuming the rest are inactive)

SELECT `airbnb-jerseycity.listing.listing_data`.neighbourhood,
SUM(`airbnb-jerseycity.listing.listing_data`.price* (30 - `airbnb-jerseycity.listing.listing_details`.availability_30)) AS potential_30
FROM `airbnb-jerseycity.listing.listing_data`
INNER JOIN `airbnb-jerseycity.listing.listing_details`
ON `airbnb-jerseycity.listing.listing_data`.id = `airbnb-jerseycity.listing.listing_details`.id
WHERE `airbnb-jerseycity.listing.listing_data`.last_review >= "2022-12-01"
GROUP BY `airbnb-jerseycity.listing.listing_data`.neighbourhood
ORDER BY potential_30 DESC;

# I would like to take a closer look at this table here - what about potential by neighbourhood and room type?
# AKA I would like to pivot the table, and turn the rows into room types, with the values being "potential"

SELECT `airbnb-jerseycity.listing.listing_data`.neighbourhood,
SUM(`airbnb-jerseycity.listing.listing_data`.price* (30 - `airbnb-jerseycity.listing.listing_details`.availability_30)) AS potential_30,
SUM(CASE WHEN `airbnb-jerseycity.listing.listing_data`.room_type = "Entire home/apt" THEN `airbnb-jerseycity.listing.listing_data`.price* (30 - `airbnb-jerseycity.listing.listing_details`.availability_30)END) AS potential_entire_home,
SUM(CASE WHEN `airbnb-jerseycity.listing.listing_data`.room_type = "Private room" THEN `airbnb-jerseycity.listing.listing_data`.price* (30 - `airbnb-jerseycity.listing.listing_details`.availability_30)END) AS potential_private_room,
SUM(CASE WHEN `airbnb-jerseycity.listing.listing_data`.room_type = "Share room" THEN `airbnb-jerseycity.listing.listing_data`.price* (30 - `airbnb-jerseycity.listing.listing_details`.availability_30)END) AS potential_share_room,
SUM(CASE WHEN `airbnb-jerseycity.listing.listing_data`.room_type = "Hotel room" THEN `airbnb-jerseycity.listing.listing_data`.price* (30 - `airbnb-jerseycity.listing.listing_details`.availability_30)END) AS potential_hotel_room
FROM `airbnb-jerseycity.listing.listing_data`
INNER JOIN `airbnb-jerseycity.listing.listing_details`
ON `airbnb-jerseycity.listing.listing_data`.id = `airbnb-jerseycity.listing.listing_details`.id
WHERE `airbnb-jerseycity.listing.listing_data`.last_review >= "2022-12-01"
GROUP BY `airbnb-jerseycity.listing.listing_data`.neighbourhood
ORDER BY potential_30 DESC;

# Now it's much clearer which neighbourhood/room type combos have the most revenue potential
# The top two are entire homes in Ward E and Ward F by far
# Also, it looks like no one really wants shared room, regardless of location
# Entire homes as a room type is the most in demand 

# Next let's analyse the reviews and ratings
# Use number_of_reviews as a metric for popularity
# From Airbnb - A Superhost is someone who goes above and beyond in their hosting duties and is a shining example of how a Host should be. You can easily identify one from the badge that appears on their listing and profile.
# I'd like to explore the "superhost" status a bit and see if it is associated with earning potential
# As well as the elements associated with being a superhost (ratings)?, do they earn more (price)? Where are they in the city?

# Number of superhosts/non-superhosts in JC
SELECT DISTINCT(host_is_superhost)
FROM `airbnb-jerseycity.listing.listing_details`;

SELECT COUNT(CASE WHEN host_is_superhost = true THEN id END)AS SuperHost,
COUNT(CASE WHEN host_is_superhost = false THEN id END)AS RegularHost
FROM `airbnb-jerseycity.listing.listing_details`;
# 384 superhosts and 940 regular hosts

# SuperHost and RegularHost By neighbourhood
SELECT `airbnb-jerseycity.listing.listing_data`.neighbourhood,
COUNT(CASE WHEN `airbnb-jerseycity.listing.listing_details`.host_is_superhost = true THEN `airbnb-jerseycity.listing.listing_details`.id END)AS SuperHost,
COUNT(CASE WHEN `airbnb-jerseycity.listing.listing_details`.host_is_superhost = false THEN `airbnb-jerseycity.listing.listing_details`.id END)AS RegularHost
FROM `airbnb-jerseycity.listing.listing_data`
INNER JOIN `airbnb-jerseycity.listing.listing_details`
ON `airbnb-jerseycity.listing.listing_data`.id = `airbnb-jerseycity.listing.listing_details`.id
WHERE `airbnb-jerseycity.listing.listing_data`.last_review >= "2022-12-01"
GROUP BY `airbnb-jerseycity.listing.listing_data`.neighbourhood;
# Ward E and Ward F are top 2 by number of superhosts

# Looking into correlation between superhost status and price
SELECT AVG(CASE WHEN `airbnb-jerseycity.listing.listing_details`.host_is_superhost = true THEN `airbnb-jerseycity.listing.listing_data`.price END)AS SuperHost_avg_price,
AVG(CASE WHEN `airbnb-jerseycity.listing.listing_details`.host_is_superhost = false THEN `airbnb-jerseycity.listing.listing_data`.price END)AS RegularHost_avg_price
FROM `airbnb-jerseycity.listing.listing_data`
INNER JOIN `airbnb-jerseycity.listing.listing_details`
ON `airbnb-jerseycity.listing.listing_data`.id = `airbnb-jerseycity.listing.listing_details`.id
WHERE `airbnb-jerseycity.listing.listing_data`.last_review >= "2022-12-01";
# 155 vs 140, superhosts charge more

# Zooming in - what about neighbourhoods?
SELECT `airbnb-jerseycity.listing.listing_data`.neighbourhood,
AVG(CASE WHEN `airbnb-jerseycity.listing.listing_details`.host_is_superhost = true THEN `airbnb-jerseycity.listing.listing_data`.price END)AS SuperHost_avg_price,
AVG(CASE WHEN `airbnb-jerseycity.listing.listing_details`.host_is_superhost = false THEN `airbnb-jerseycity.listing.listing_data`.price END)AS RegularHost_avg_price
FROM `airbnb-jerseycity.listing.listing_data`
INNER JOIN `airbnb-jerseycity.listing.listing_details`
ON `airbnb-jerseycity.listing.listing_data`.id = `airbnb-jerseycity.listing.listing_details`.id
WHERE `airbnb-jerseycity.listing.listing_data`.last_review >= "2022-12-01"
GROUP BY `airbnb-jerseycity.listing.listing_data`.neighbourhood
ORDER BY SuperHost_avg_price DESC;
# In Ward E, regular hosts charge more than superhosts on average, something is not adding up
# Again, superhosts charge more but I suspect that the rankings of neighbourhoods has been affected by room type
# Pulling the same query, but price per bed this time
SELECT `airbnb-jerseycity.listing.listing_data`.neighbourhood,
AVG(CASE WHEN `airbnb-jerseycity.listing.listing_details`.host_is_superhost = true THEN `airbnb-jerseycity.listing.listing_data`.price/`airbnb-jerseycity.listing.listing_details`.beds END)AS SuperHost_avg_price_per_bed,
AVG(CASE WHEN `airbnb-jerseycity.listing.listing_details`.host_is_superhost = false THEN `airbnb-jerseycity.listing.listing_data`.price/`airbnb-jerseycity.listing.listing_details`.beds END)AS RegularHost_avg_price_per_bed
FROM `airbnb-jerseycity.listing.listing_data`
INNER JOIN `airbnb-jerseycity.listing.listing_details`
ON `airbnb-jerseycity.listing.listing_data`.id = `airbnb-jerseycity.listing.listing_details`.id
WHERE `airbnb-jerseycity.listing.listing_data`.last_review >= "2022-12-01"
GROUP BY `airbnb-jerseycity.listing.listing_data`.neighbourhood
ORDER BY SuperHost_avg_price_per_bed DESC;

# We can see that in some neighbourhoods superhosts aren't even charging as much as the regular ones (especially in the Ward E where properties are in demand and superhosts have high revenue potential
# Maybe Airbnb should notify the hosts about it to help them price their properties right for more revenue
# There's also the possibility that the regular hosts aren't attracting as many guests as they could because they are pricing their properties too expensive
# Either way, it has something to do with Airbnb helping their hosts with pricing

# Next, let's look at ratings for superhosts vs regular hosts - what are superhosts doing right?
SELECT host_is_superhost,
AVG(review_scores_rating) AS avg_rating,
AVG (review_scores_accuracy) AS avg_accuracy,
AVG(review_scores_checkin) AS avg_rating_checking,
AVG (review_scores_cleanliness) avg_rating_cleanliness,
AVG (review_scores_communication) AS avg_rating_comm,
AVG(review_scores_location) AS avg_rating_location
FROM `airbnb-jerseycity.listing.listing_data`
INNER JOIN `airbnb-jerseycity.listing.listing_details`
ON `airbnb-jerseycity.listing.listing_data`.id = `airbnb-jerseycity.listing.listing_details`.id
WHERE `airbnb-jerseycity.listing.listing_data`.last_review >= "2022-12-01"
GROUP BY host_is_superhost;
# 20 records with col host_is_superhost blank, does affect our analysis so update it to regular host

UPDATE `airbnb-jerseycity.listing.listing_details`
SET host_is_superhost = false 
WHERE host_is_superhost IS NULL;

# relationship between instant book and revenue potential

SELECT DISTINCT (instant_bookable)
FROM `airbnb-jerseycity.listing.listing_details`;

SELECT
AVG(CASE WHEN `airbnb-jerseycity.listing.listing_details`.instant_bookable = true THEN `airbnb-jerseycity.listing.listing_data`.price* (30 - `airbnb-jerseycity.listing.listing_details`.availability_30)END) AS instant_book_potential,
AVG(CASE WHEN `airbnb-jerseycity.listing.listing_details`.instant_bookable = false THEN `airbnb-jerseycity.listing.listing_data`.price* (30 - `airbnb-jerseycity.listing.listing_details`.availability_30)END) AS regular_potential
FROM `airbnb-jerseycity.listing.listing_details`
INNER JOIN `airbnb-jerseycity.listing.listing_data`
ON `airbnb-jerseycity.listing.listing_data`.id = `airbnb-jerseycity.listing.listing_details`.id
WHERE `airbnb-jerseycity.listing.listing_data`.last_review >= "2022-12-01";

# this does not match Airbnb's claim that enabling instant book increases a host's earnings
# let's look at price and availability_30 separately

SELECT
AVG(CASE WHEN `airbnb-jerseycity.listing.listing_details`.instant_bookable = true THEN `airbnb-jerseycity.listing.listing_data`.price END) AS instantbook_avg_price,
AVG(CASE WHEN `airbnb-jerseycity.listing.listing_details`.instant_bookable = false THEN `airbnb-jerseycity.listing.listing_data`.price END) AS regularbook_avg_price
FROM `airbnb-jerseycity.listing.listing_details`
INNER JOIN `airbnb-jerseycity.listing.listing_data`
ON `airbnb-jerseycity.listing.listing_data`.id = `airbnb-jerseycity.listing.listing_details`.id
WHERE `airbnb-jerseycity.listing.listing_data`.last_review >= "2022-12-01";

# average price is even higher without instant book, according to Airbnb hosts get double the reservations because of the convenience factor
# is it true that with instant book enabled, hosts get more reservations?
# again we will use the availibility for the next 30 days to measure it

SELECT
AVG(CASE WHEN instant_bookable = true THEN availability_30 END) AS instantbook_avail,
AVG(CASE WHEN instant_bookable = false THEN availability_30 END) AS regularbook_avail
FROM `airbnb-jerseycity.listing.listing_details`
INNER JOIN `airbnb-jerseycity.listing.listing_data`
ON `airbnb-jerseycity.listing.listing_data`.id = `airbnb-jerseycity.listing.listing_details`.id
WHERE `airbnb-jerseycity.listing.listing_data`.last_review >= "2022-12-01";

# hosts with instant book enabled seems to be more available, which means they get less reservations.
# again, I see the missing opportunity - hosts are not charging premium for the convenience that comes with instant book
# Airbnb should work on making their hosts better informed in terms of pricing, also incentivize hosts by optimizing search results etc


# Preparing data for Tableau
SELECT b.id,b.host_id,b.neighbourhood,b.room_type,b.number_of_reviews,b.last_review,a.host_since,a.host_is_superhost,a.bedrooms,a.beds,a.price,a.availability_30,a.review_scores_rating,a.review_scores_accuracy,a.review_scores_checkin,a.review_scores_cleanliness,a.review_scores_communication,a.review_scores_location,a.instant_bookable
FROM `airbnb-jerseycity.listing.listing_details` AS a
INNER JOIN `airbnb-jerseycity.listing.listing_data` AS b
ON b.id = a.id;
