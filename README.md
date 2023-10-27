# Airbnb-JerseyCity-Case-Study
Airbnb JerseyCity case study! Optimize the revenue by its active listings. 

## Introduction
In this case study, I will estimate the revenue potential of Airbnb in jersey city and check if I can increase its revenue potential. In order to answer the key business questions, I will follow the steps of the data analysis process: __[Ask](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/blob/main/README.md#ask), [Prepare](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/blob/main/README.md#prepare), [Process](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/blob/main/README.md#process), [Analyze](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/blob/main/README.md#analyze-and-share), [Share](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/blob/main/README.md#analyze-and-share), and [Act](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/blob/main/README.md#act)__.

### Quick links:
Data Source: [Inside Airbnb](http://insideairbnb.com/get-the-data) [accessed on 10/05/23]  

SQL Queries:  

[1.Data Exploration](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/blob/main/1.%20Data%20Exploration.sql)  

[2.Data Analysis](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/blob/main/2.%20Data%20Analysis.sql)  
  
Data Visualizations: [Tableau](https://public.tableau.com/app/profile/raksha.kandasamy.chandramohan/viz/JerseyCityAirbnb_16972383746030/Dashboard1#1)  

## Ask
### Business Task
Turn the data I have into actionable items in order for the company to optimize its revenue.
### Analysis
* I needed to define the KPI(s) to use to measure revenue as I didn’t have access to Airbnb’s actual revenue information.
* I decided to estimate the revenue potential by the total earnings of all active listings in the next month(30 days).
* Namely, Revenue Potential = Price x (30 — availability_30).
* I then needed to define what “active listings” mean in this analysis — it would mean that the listing’s last review was made no earlier than November 2022.

* With that in mind, I performed the analysis looking for the main revenue contributors (by different variables), and whether Airbnb has exhausted their revenue potential.

## Prepare
### Data Source
I will use Airbnb Inside data to analyze and identify trends from Dec 2022 to Sept 2023 which can be downloaded from [Inside Airbnb](http://insideairbnb.com/get-the-data).
  
This is public data that can be used to explore detailed list of Listings data, neighbourhood data, review data and calender data. But note that data-privacy issues prohibit from using members personally identifiable information. This means that we won’t be able to connect purchases to credit card numbers.

### Data Organization
There are 6 files and each file includes information for one month, such as the member id, host id, name, neighbourhood, latitude,longitude, room types, price, availability 30,60,90 and number of reviews. The corresponding column names are id, name, host_id, host_name, neighbourhood_group, latitude, longitude, room_type, price, minimum_nights, num_of_reviews, last_review, review_per_month,availability_365, license.

## Process
BigQuery is used to explore the data set.    
Reason:  
A worksheet can only have 1,048,576 rows in Microsoft Excel because of its inability to manage large amounts of data. Because the Airbnb JerseyCity dataset has more than million rows, it is essential to use a platform like BigQuery that supports huge volumes of data.
### Data Exploration
SQL Query: [1.Data Exploration](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/blob/main/1.%20Data%20Exploration.sql) 
Before cleaning the data, I am familiarizing myself with the data to find the inconsistencies.

1. The table below shows the all column names and their data types. The __id__ column is our primary key.

![Screenshot 2023-10-27 9 30 29 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/b97ba0d0-aa6c-4c35-adc0-0afa408e2f69)

2.The following table shows number of __null values__ in each column.  

![Screenshot 2023-10-27 9 31 31 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/4b881151-6569-4417-a892-85723745152f)

Note that some columns have same number of missing values. This may be due to missing information in the same row.
   
3. The following table shows number of __duplicate ids__ in the table.

![Screenshot 2023-10-27 9 32 02 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/338af744-63b2-4321-b99a-d57f059c70e9)
  
4. There are 4 unique room types (__room_type__) in our data.

![Screenshot 2023-10-27 9 32 24 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/d5f50a71-bc19-42be-8b7e-eb6e42700f67)

5. There are 6 unique neighbourhood group types (__neighbourhood_group__) in our data.

![Screenshot 2023-10-27 9 32 43 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/677c5597-fca1-47d4-880a-468bad2207f8)

6. MAX and MIN price of the room types

![Screenshot 2023-10-27 9 33 03 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/7a2656e4-475a-416c-9988-138f39b8b3df)

## Analyze and Share
SQL Query: [Data Analysis](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/blob/main/2.%20Data%20Analysis.sql)  
Data Visualization: [Tableau](https://public.tableau.com/app/profile/raksha.kandasamy.chandramohan/viz/JerseyCityAirbnb_16972383746030/Dashboard1#1)  
The data is stored appropriately and is now prepared for analysis. I queried multiple relevant tables for the analysis and visualized them in Tableau.  

The analysis question is: 
1.) How/where are tourists/Airbnb guests spending their money in JerseyCity?
2.) What makes a successful host in JerseyCity?
3.) Strategy suggestions for Airbnb in JerseyCity? 

* There are 579 unique Airbnb hosts in Jersey City.
  
  ![Screenshot 2023-10-27 10 59 41 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/d741198c-61ad-438d-91de-30bb6e9da7bd)

* There are 1,324 unique listings in Jersey City.

  ![Screenshot 2023-10-27 10 59 55 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/f7788369-aba2-44a8-b2fd-902f04325ec8)

* About (72%) of Airbnb hosts only have one listing, other hosts could have multiple listings (up to as many as 400)

![Screenshot 2023-10-27 11 00 24 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/c69fe239-0b89-440c-bf3f-71e0075d9e89)

* Number of listings and average price by neighbourhood : Some of the more rural/remote neighbourhoods have higher average prices, my guess is that the properties tend to be larger for these areas (room type/beds)

![Screenshot 2023-10-27 11 00 44 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/0c0b717c-4345-42e5-8691-9f7a61ee148d)

* Number of listing and average price by room type :

![Screenshot 2023-10-27 11 01 12 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/b317eca7-10d1-41fd-bbc3-959d4b08c7b0)

* Average price per bed by neighbourhood : This looks more like it, guests pay more $ for places downtown on average.

![Screenshot 2023-10-27 11 01 32 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/dff976b8-bd3a-4359-965d-80a3b1fb74b0)

* Neighbourhoods with the biggest revenue potential : Measure "potential" - with availability 30, I am making the assumption here that more than 30 days (before 2022-12-01) is too far away for people to book Airbnb for a trip.
-- Limitaion - availability being 0 could also mean that the host simply blocked the calendar (I am seleting only the ones who has been reviewed in the past 12 months assuming the rest are inactive)

![Screenshot 2023-10-27 11 01 47 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/25438ebd-c545-41b6-8a26-db2ed3186e90)

* what about potential by neighbourhood and room type? AKA I would like to pivot the table, and turn the rows into room types, with the values being "potential"

![Screenshot 2023-10-27 11 02 08 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/597771d0-c665-4f9c-9b79-00babf345713)

The top two are entire homes in Ward E and Ward F by far
 - Also, it looks like no one really wants shared room, regardless of location
 - Entire homes as a room type is the most in demand .
   
* let's analyse the reviews and ratings
- Use number_of_reviews as a metric for popularity
- From Airbnb - A Superhost is someone who goes above and beyond in their hosting duties and is a shining example of how a Host should be. You can easily identify one from the badge that appears on their listing and profile.
- I'd like to explore the "superhost" status a bit and see if it is associated with earning potential
- As well as the elements associated with being a superhost (ratings)?, do they earn more (price)? Where are they in the city?

* Number of superhosts/non-superhosts in JC

![Screenshot 2023-10-27 11 02 37 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/7152b553-b305-4916-9253-e64b98dfa9b7)

384 superhosts and 940 regular hosts

* SuperHost and RegularHost By neighbourhood

![Screenshot 2023-10-27 11 03 16 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/3ef6d140-4e0c-4210-ba8c-02b11397754b)

Ward E and Ward F are top 2 by number of superhosts.

* Looking into correlation between superhost status and price

![Screenshot 2023-10-27 11 03 36 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/716c8128-dc9a-43d9-8de7-f203f7b00e35)

155 vs 140, superhosts charge more.

* what about neighbourhoods?

![Screenshot 2023-10-27 11 03 55 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/26ac5e10-15c3-4a74-ba92-91e67d845bb7)

In Ward E, regular hosts charge more than superhosts on average, something is not adding up
- Again, superhosts charge more but I suspect that the rankings of neighbourhoods has been affected by room type
- Pulling the same query, but price per bed this time

![Screenshot 2023-10-27 12 31 29 PM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/831d5062-0f0a-4390-aeb2-6f6fa9ee7d73)

We can see that in some neighbourhoods superhosts aren't even charging as much as the regular ones (especially in the Ward E where properties are in demand and superhosts have high revenue potential
- Maybe Airbnb should notify the hosts about it to help them price their properties right for more revenue
- There's also the possibility that the regular hosts aren't attracting as many guests as they could because they are pricing their properties too expensive
- Either way, it has something to do with Airbnb helping their hosts with pricing

* Next, let's look at ratings for superhosts vs regular hosts - what are superhosts doing right?

![Screenshot 2023-10-27 11 04 28 AM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/9043101b-4ae8-433d-94b0-a32e24b281d6)

20 records with col host_is_superhost blank, does affect our analysis so update it to regular host.

* relationship between instant book and revenue potential

![Screenshot 2023-10-27 12 26 44 PM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/0ebd0f96-bc6f-4f68-8f96-f4201ca66540)

 this does not match Airbnb's claim that enabling instant book increases a host's earnings

* let's look at price and availability_30 separately.

![Screenshot 2023-10-27 12 36 39 PM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/d8639c33-6251-40f4-bbd6-a7e6a80033d8)

average price is even higher without instant book, according to Airbnb hosts get double the reservations because of the convenience factor.

- is it true that with instant book enabled, hosts get more reservations?
- again we will use the availibility for the next 30 days to measure it

![Screenshot 2023-10-27 12 37 04 PM](https://github.com/Raksha-17/Airbnb-JerseyCity-Case-Study/assets/146487383/c7da7fee-7bf9-42b0-93ca-ba487376506c)

hosts with instant book enabled seems to be more available, which means they get less reservations.
- again, I see the missing opportunity - hosts are not charging premium for the convenience that comes with instant book
- Airbnb should work on making their hosts better informed in terms of pricing, also incentivize hosts by optimizing search results etc
