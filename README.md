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
