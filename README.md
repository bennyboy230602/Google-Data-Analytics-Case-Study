# Google Data Analytics Case Study 1: Cyclistic

## Contents
1. [Introduction](https://github.com/bennyboy230602/Google-Data-Analytics-Case-Study/blob/main/README.md#introduction)
2. [Company Background](https://github.com/bennyboy230602/Google-Data-Analytics-Case-Study/blob/main/README.md#company-background)
3. [Ask](https://github.com/bennyboy230602/Google-Data-Analytics-Case-Study/blob/main/README.md#ask)
4. [Prepare](https://github.com/bennyboy230602/Google-Data-Analytics-Case-Study/blob/main/README.md#prepare)
5. [Process](https://github.com/bennyboy230602/Google-Data-Analytics-Case-Study/blob/main/README.md#process)
6. [Analyse](https://github.com/bennyboy230602/Google-Data-Analytics-Case-Study/blob/main/README.md#analyse)
7. [Share](https://github.com/bennyboy230602/Google-Data-Analytics-Case-Study/blob/main/README.md#share)
8. [Act](https://github.com/bennyboy230602/Google-Data-Analytics-Case-Study/blob/main/README.md#act)
9. [Appendix](https://github.com/bennyboy230602/Google-Data-Analytics-Case-Study/blob/main/README.md#appendix)

## Introduction
To finish the Google Data Analytics course, I will be conducting an analysis of user data for the Chicago-based bike-sharing company Cyclistic. I will be following the course's advice on structuring a data-driven investigation - Ask, Prepare, Process, Analyse, Share and Act.

## Company Background  
Information about the company is sourced below from the case study pdf:
>### Characters and teams
>* Cyclistic: A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart
by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities
and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use
the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each
day.  
>* Lily Moreno: The director of marketing and your manager. Moreno is responsible for the development of campaigns and
initiatives to promote the bike-share program. These may include email, social media, and other channels.  
>* Cyclistic marketing analytics team: A team of data analysts who are responsible for collecting, analyzing, and reporting
data that helps guide Cyclistic marketing strategy. You joined this team six months ago and have been busy learning about
Cyclistic’s mission and business goals — as well as how you, as a junior data analyst, can help Cyclistic achieve them.  
>* Cyclistic executive team: The notoriously detail-oriented executive team will decide whether to approve the
recommended marketing program.  
>### About the company  
>In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are
geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to
any other station in the system anytime.  
>Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One
approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and
annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who
purchase annual memberships are Cyclistic members.  
>Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing
flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to
future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good
chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have
chosen Cyclistic for their mobility needs.  
>Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do
that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual
riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in
analyzing the Cyclistic historical bike trip data to identify trends.

## Ask
In this scenario, Moreno has provided the business task:  **How do annual members and casual riders use Cyclistic bikes differently?**  

## Prepare
###Data Source
Cyclistic has provided historical data via this [link](https://divvy-tripdata.s3.amazonaws.com/index.html) which has been made available by Motivate International Inc. under this
[license](https://divvybikes.com/data-license-agreement). I will use the most recent 12 months of data available from August 2022 to July 2023 for analysis to ensure the data is current.  
While the data is public, data privacy dictates that the riders' personally identifiable information will not be available. This means I will not be able to connect pass purchases with credit card numbers to determine whether casual members live in the Cyclistic service area or if they have purchased multiple single passes before.

###Organisation
To easily process the large amount of data, the CSV files will be uploaded to a BigQuery dataset to be queried using SQL. The naming scheme will be changed to be clearer - for example, July 2023 will be stored as "divvy_tripdata_2023_07" rather than the original "202307-divvy-tripdata."

## Process

###Combining the Data
After checking whether the automatically generated schema for each table was consistent, I found that some of the tables interpreted the attributes "started_at" and "ended_at" as STRING while others were TIMESTAMP. In order to combine the tables, I first converted the incorrect datatypes to TIMESTAMP for consistency then used a UNION query to combine the tables into a new table in the database called "divvy_tripdata_combined" (see [appendix](https://github.com/bennyboy230602/Google-Data-Analytics-Case-Study/blob/main/README.md#appendix) for code). The UNION function was used rather than INNER JOIN so that observations would be added to existing attributes rather than adding new ones. From the new table's metadata, it can be seen there are 5,939,550 rows.  

### Cleaning the Data



## Appendix
[Combining the Data SQL Query](https://github.com/bennyboy230602/Google-Data-Analytics-Case-Study/blob/main/combining_data.sql)





