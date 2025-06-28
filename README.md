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
The business task is as follows: "Design marketing strategies to convert casual riders to members by understanding how annual and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics." This can then be split into three questions to guide the analysis:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
2. **Why would casual riders buy Cyclistic annual memberships?**
3. **How can Cyclistic use digital media to influence casual riders to become members?**

## Prepare  
### Data Source  
Cyclistic has provided historical data via this [link](https://divvy-tripdata.s3.amazonaws.com/index.html), which has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement). I will analyse the most recent 12 months of data from September 2022 to August 2023 to ensure the data is relevant.  
While the data is public, data privacy dictates that the riders' personally identifiable information will not be available. This means I will not be able to connect past purchases with credit card numbers to determine whether casual members live in the Cyclistic service area or if they have purchased multiple single passes before. To easily process the large amount of data, the CSV files will be uploaded to a BigQuery dataset to be queried using SQL. 
  
## Process  
### Combining the Data  
After checking whether the automatically generated schema for each table was consistent, I found that some of the tables interpreted the attributes "started_at" and "ended_at" as STRING while others were TIMESTAMP. To combine the tables, I first converted the incorrect datatypes to TIMESTAMP for consistency, then used a UNION query to combine the tables into a new table in the database called "divvy_tripdata_combined" (see [appendix](https://github.com/bennyboy230602/Google-Data-Analytics-Case-Study/blob/main/README.md#appendix) for code). The UNION function was used rather than INNER JOIN so that observations would be added to existing attributes rather than adding new ones. From the new table's metadata, it can be seen that there are 
5,723,606 rows and 13 columns consisting of the following fields:

* **ride_id** - Unique ID associated with a ride [STRING]
* **rideable_type** - Type of bike (classic, electrical, or docked) [STRING]
* **started_at** - Date and time that the ride began [TIMESTAMP]
* **ended_at** - Date and time that the ride ended [TIMESTAMP]
* **start_station_name** - Name of the station the ride originated from [STRING]
* **start_station_id** - Unique ID of the station of origin [STRING]
* **end_station_name** - Name of the station the ride ended at [STRING]
* **end_station_id** - Unique ID of the final station [STRING]
* **start_lng** - Longitude of the starting station [FLOAT]
* **start_lat** - Latitude of the starting station [FLOAT]
* **end_lng** - Longitude of the ending station [FLOAT]
* **end_lat** - Latitude of the ending station [FLOAT]
* **member_casual** - Type of membership held by the ride (member or casual) [STRING]

### Exploring and Cleaning the Data  
Exploratory data analysis was performed to inform what cleaning steps were necessary. A summary of both steps is listed below, and the full SQL queries can be found in the [appendix](https://github.com/bennyboy230602/Google-Data-Analytics-Case-Study/blob/main/README.md#appendix).
* Unnecessary columns (station IDs) were dropped. This data is not relevant to the analysis to be performed.
* Check for duplicate ride IDs. There were zero duplicates
* Check that there are only three distinct values for rideable_type. This was true.
* Check that there are only two distinct values for member_casual. This was true.
* Remove rows containing null values:
  - **start_station_name**, **start_station_id** - 868,772 null values removed
  - **end_station_name**, **end_station_id** - 925,008 null values removed
  - **end_lat**, **end_lng** - 6102 null values removed
* Adding columns relevant to the data analysis. These included:
  - **ride_length** - Duration (in minutes) of the ride based on start_time and end_time [FLOAT]
  - **time-of-day** - Hour at which the ride began [FLOAT]
  - **day_of_week** - The weekday that the ride occurred [STRING]
  - **month_of_year** - The month of the year that the ride occurred [STRING]
* Once these columns were added, I removed rows where ride_length was less than one minute, including erroneous negative ride lengths and times too short to be a legitimate ride. This last case could be where a person re-docked a bike to ensure it was secure, or where there were false starts. This equated to 269,929 rows.

Once these procedures had been performed, the final size of the dataset was 4,175,831 rows, meaning 1,547,775 rows were deleted.

## Analyse
With the data processed and cleaned, the data is now ready for analysis. The SQL query associated with the data analysis can once again be found in the [appendix](https://github.com/bennyboy230602/Google-Data-Analytics-Case-Study/blob/main/README.md#appendix).

In answering how casual and annual member behaviour differs, I first looked at the types of bikes they used (see Figure 1). 
* Casual users constitute 37.43% of all users whilst Cyclistic members make up the other 62.57%.
* Classic bikes are the most popular type of bike used, with Cyclistic members using them more relative to their overall demographic size.
* Electric bikes are much less popular amongst Cyclistic members but are used similarly by casual users/
* Docked bikes are the least popular by far and are only used by casual users

![image](https://github.com/user-attachments/assets/06923cbe-45aa-4b41-9ce8-884a8e342127)
> **Figure 1**: Pie charts illustrating types of bikes used for each membership type (left). The percentages represent the percentage of total rides across all categories that the slice constitutes. Pie chart showing the overall ratio between casual and annual members (right).

##
Next, I looked at how the number of rides differed between the two groups per month, per day of the week, and per hour of the day (see Figure 2).
* Both types of members follow the same trend of usage over the year, with more rides taken during warmer, summer months.
* There is an unexplained uptick in rides in April.
* Members ride noticeably more mid-week before dropping off sharply, while casual riders ride more on the weekend.
* Distinct peaks in member rides corresponding to commuting times for a standard 9-5 working day.
* Casual riders mostly prefer afternoon rides, peaking around 5pm.

a. ![image](https://github.com/user-attachments/assets/240a4a97-d1c8-435b-ba08-5f51292b66cf)
b. ![image](https://github.com/user-attachments/assets/f332fb53-69a5-4ef5-adf9-7a8ec9ed4dce)
c. ![image](https://github.com/user-attachments/assets/52ddf72b-5024-41a0-9c4f-002164c30d49)
> **Figure 2**: Line graphs showing number of rides taken at per (a) month, (b) day of the week, and (c) hour of the day.

Another important difference between the two groups is how long their journeys are.
* Casual riders ride longer than members consistently, with a small increase on weekends.
* Members average a stable journey length of around 13 minutes, while casual users vary between 19-26 minutes
* 


a. ![image](https://github.com/user-attachments/assets/9ad24798-bbf3-4868-af03-23680a88c4a3)
b. ![image](https://github.com/user-attachments/assets/17d07b69-7777-484c-9ad1-9cf371f164a2)
c. ![image](https://github.com/user-attachments/assets/45d175a2-d59e-4144-88da-f905375b13ff)
> **Figure 3**:




## Appendix
### SQL Queries
1. [Combining the Data SQL Query](https://github.com/bennyboy230602/Google-Data-Analytics-Case-Study/blob/main/combining_data.sql)
2. [Exploring the Data SQL Query](https://github.com/bennyboy230602/Google-Data-Analytics-Case-Study/blob/main/exploring_data.sql)
3. [Cleaning the Data SQL Query](https://github.com/bennyboy230602/Google-Data-Analytics-Case-Study/blob/main/cleaning_data.sql)
4. [Analysing the Data SQL Query](https://github.com/bennyboy230602/Google-Data-Analytics-Case-Study/blob/main/analysing_data.sql)

### Data Source
>[Divvy Data Bucket](https://divvy-tripdata.s3.amazonaws.com/index.html)

### Tableau Dashboards
>[Tableau Public Workbook](https://public.tableau.com/app/profile/ben.holmes8701/viz/CyclisticVisualisation_17510351145090/NumberofRides)





