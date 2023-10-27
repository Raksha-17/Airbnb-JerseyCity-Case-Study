# Airbnb-JerseyCity-Case-Study
Airbnb jerseycity case study! optimize the revenue by its active listings. 

## Introduction
In this case study, I will estimate the revenue potential of Airbnb in jersey city and check if it can increase its revenue potential. In order to answer the key business questions, I will follow the steps of the data analysis process: __[Ask](https://github.com/Raksha-17/Cyclistic-Case-Study/blob/main/README.md#ask), [Prepare](https://github.com/Raksha-17/Cyclistic-Case-Study/blob/main/README.md#prepare), [Process](https://github.com/Raksha-17/Cyclistic-Case-Study/blob/main/README.md#process), [Analyze](https://github.com/Raksha-17/Cyclistic-Case-Study/blob/main/README.md#analyze-and-share), [Share](https://github.com/Raksha-17/Cyclistic-Case-Study/blob/main/README.md#analyze-and-share), and [Act](https://github.com/Raksha-17/Cyclistic-Case-Study/blob/main/README.md#act)__.

### Quick links:
Data Source: [Inside Airbnb](http://insideairbnb.com/get-the-data) [accessed on 10/05/23]  

SQL Queries:  

[1.Data Cleaning](https://github.com/Raksha-17/Cyclistic-Case-Study/blob/main/3.Data%20Cleaning.sql)  

[2.Data Analysis](https://github.com/Raksha-17/Cyclistic-Case-Study/blob/main/4.Data%20Analysis.sql)  
  
Data Visualizations: [Tableau](https://public.tableau.com/app/profile/raksha.kandasamy.chandramohan/viz/JerseyCityAirbnb_16972383746030/Dashboard1#1)  

## Ask
### Business Task
Devise marketing strategies to convert casual riders to members.
### Analysis Questions
Three questions will guide the future marketing program:  
1. How do annual members and casual riders use Cyclistic bikes differently?  
2. Why would casual riders buy Cyclistic annual memberships?  
3. How can Cyclistic use digital media to influence casual riders to become members?  
Moreno has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?
## Prepare
### Data Source
I will use Cyclistic’s historical trip data to analyze and identify trends from Jan 2020 to Dec 2020 which can be downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement).  
  
This is public data that can be used to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit from using riders’ personally identifiable information. This means that we won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.
### Data Organization
There are 10 files with naming convention of YYYYMM-divvy-tripdata and each file includes information for one month, such as the ride id, bike type, start time, end time, start station, end station, start location, end location, and whether the rider is a member or not. The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.

