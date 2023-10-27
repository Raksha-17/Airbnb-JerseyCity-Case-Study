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


