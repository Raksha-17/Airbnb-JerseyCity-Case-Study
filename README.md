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

1. The table below shows the all column names and their data types. The __ride_id__ column is our primary key.  
   ![image](https://github.com/Raksha-17/Cyclistic-Case-Study/blob/main/Images/bq-results-20231001-021815-1696126749408.png%20(1).csv)  
2. The following table shows number of __null values__ in each column.  
   
   ![image](https://github.com/Raksha-17/Cyclistic-Case-Study/blob/main/Images/bq-results-20231004-200249-1696451196561.csv)
   Note that some columns have same number of missing values. This may be due to missing information in the same row i.e. station's name and id for the same station and latitude and longitude for the same ending station.  
   
3. All __ride_id__ values have length of 16 so no need to clean it.
 ![image](https://github.com/Raksha-17/Cyclistic-Case-Study/blob/main/Images/script_job_adacc5d6cf1c9f9d73e47578d52b5372_3.csv)
4. There are 3 unique types of bikes(__rideable_type__) in our data.
   ![image](https://github.com/Raksha-17/Cyclistic-Case-Study/blob/main/Images/script_job_1c55a1ff093215e21e2cbed92ba57174_4.csv)
5. The __started_at__ and __ended_at__ shows start and end time of the trip in YYYY-MM-DD hh:mm:ss UTC format. New column ride_length can be created to find the total trip duration. There are 2856 trips which has duration longer than a day and 63011 trips having less than a minute duration or having end time earlier than start time so need to remove them. Other columns day_of_week and month can also be helpful in analysis of trips at different times in a year.
6. Total of 164932 rows have both __start_station_name__ and __start_station_id__ missing which needs to be removed.  
7. Total of 179615 rows have both __end_station_name__ and __end_station_id__ missing which needs to be removed.
8. Total of 4255 rows have both __end_lat__ and __end_lng__ missing which needs to be removed.
9. __member_casual__ column has 2 uniqued values as member or casual rider.
    ![image](https://github.com/Raksha-17/Cyclistic-Case-Study/blob/main/Images/script_job_b9536d303533484358deba7997f1d3f8_13.csv)
10. Columns that need to be removed are start_station_id and end_station_id as they do not add value to analysis of our current problem. Longitude and latitude location columns may not be used in analysis but can be used to visualise a map.
