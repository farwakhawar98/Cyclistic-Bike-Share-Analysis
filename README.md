# Cyclistic-Bike-Share-Analysis
A user behavioral analysis for a bike sharing company to support targeted marketing strategies using Microsoft Excel, R  and Tableau

# Project Overview
This project analyzes ride behavior for a bike-sharing company to understand the differences between member and casual riders.

The goal is to uncover patterns in usage and provide insights that can help convert casual riders into members.

# Business Objective

- Identify behavioral differences between member and casual users
- Analyze ride patterns across time (months, weekdays)
- Provide data-driven recommendations to facilitate conversion of casual users to members

# About the Data
Dataset:  Divvy Trip Data (Jan - Oct 2025)
- Public data set
- The data has been made available by Motivate International Inc.


# Data Pipeline & Workflow
This project follows a complete end-to-end data analysis workflow:
 1. Raw Data Collection
- Original dataset consisted of separate monthly files
- Each row represented an individual ride record

 2. Data Cleaning & Processing (R)
 
 Using R programming language, the following steps were performed:

- Removed duplicates and null values
- Standardized column formats (dates, user types, weekdays)
- Derived key fields (ride_length, weekday, month)
- Performed initial exploratory and descriptive analysis

3. Data Aggregation (R → Excel)
  
    Aggregated ride-level data into:
  - Month
  - User type
  - Weekday
  - Bike Type
    Calculated:
  - Average ride duration
  - Total number of rides
  
  Exported cleaned and aggregated datasets into monthly Excel files

4. Data Combination (Power Query)

  Using Excel Power Query:

  - Combined all monthly aggregated files into a combined dataset
  - Ensured consistent schema across files
  - Handled transformation errors and data mismatches

5. Data Visualization (Tableau)

  Using Tableau Desktop:

  - Built interactive dashboards
  - Created calculated fields (e.g., weighted averages)
  - Added filters for dynamic exploration
  - Identified trends and behavioral patterns

# Key Performance Indicators (KPIs)
To quantify user behavior and identify business opportunities, the following KPIs were defined:

- Total Rides
Total Rides = SUM(number_of_rides)

Measures overall platform usage across all users.

- Weighted Average Ride Duration
Weighted Avg Duration = SUM(Total Ride Duration) / SUM(number_of_rides)

Ensures accurate aggregation after preprocessing in R.

- Total Ride Duration (Engagement)
Total Ride Duration = average_duration × number_of_rides

Represents total time spent riding, indicating user engagement

# Analysis & Visualizations

The dashboard was built using Tableau and includes:

- Monthly Trends
    - Ride volume over time
    - Comparison between member and casual users
- Weekday Usage Patterns
    -  Weekday vs weekend behavior
    - User segmentation analysis
- Ride Duration Analysis
    - Weighted average duration by user type
    - Engagement comparison
- User Type Distribution
    - Total rides by member vs casual
Below is a snapshot of the dashboard. It can also be accessed on Tableau public. Link:  


 
<img width="1515" height="1003" alt="image" src="https://github.com/user-attachments/assets/c2e98bd2-7cca-4d14-82e7-9fc62f29beb1" />



# KPI Insights Summary
 - Members contribute the majority of total rides that indicates consistent usage
 - Members are more active on weekdays, suggesting the members use bike rides for commuting
 - Casual users are more active on weekends displaying leisure-driven behavior
 - Casual riders exhibit longer ride durations showing higher engagement per ride
 - Strong conversion potential exists among "frequent weekend casual users"

# Business Interpretation
- Casual riders with high weekend activity represent the best conversion segment
- Members show stable, predictable usage → strong retention base
- Engagement differences suggest marketing should focus on experience vs utility

# Recommendations
 - Target casual users with weekend-focused membership campaigns
 - Introduce trial memberships or ride bundles
 - Most active period of casual users is April - August, launching events like video competitions, experience vlogging for members only in this season
   can encourage casual users to become members
 - Increased engagement with member users by creating a community of riders, giving casual users a sense of belonging
 - Track conversion KPIs over time to measure effectiveness
 - Use behavioral segmentation for personalized marketing strategies

