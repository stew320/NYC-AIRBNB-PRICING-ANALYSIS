# NYC-AIRBNB-PRICING-ANALYSIS

## Project Overview

This project analyzes the NYC AirBnB market to identify factors associated with listing prices, evaluate competitive positioning across neighborhoods and roomy types, and uncover market segments and potential opportunities for hosts.

SQL is used to clean, explore, and analyze the dataset, while Tableau is used to transform the results into interactive visualizations and communicate business insights.

The goal of this project is to move beyond basic listing counts and averages and investigate what factors are associated with AirBnB pricing and competitive positioning within the NYC market.


### Business Questions

1) How much of a pricing premium do entire homes/apartments command over private rooms within the same neighborhood?
2) Within high volume neighborhoods, which listings are priced substantially above or below their local market averages?
3) Is there a relationship between minimum-night requirements and listing prices, and does this relationship differ across neighborhoods or room types?
4) Are certain neighborhoods more concentrated with multi-listing hosts, and how do their pricing patterns compare with a single-listing hosts?
5) How can NYC AirBnB listings be segmented into budget, mid-market, premium, and luxury categories, and where are these different market segments concentrated?

#### Tools Used
SQL- Data cleaning, filtering, aggregation, segmentation, and analysis
Google BigQuery- SQL querying and data processing
Tableau- Data visualization and interactive dashboard development

##### Dataset
NYC AirBnB Open Data
The dataset contains information about AirBnB listings throughout NYC, including:
1) Borough and neighborhood
2) Room type
3) Listing price
4) Minimum-night requirements
5) Number of reviews
6) Host listing counts
7) Availability
8) Additional listing information

###### Analysis
SQL will be used to investigate the business questions above and identify meaningful patterns within the NYC AirBnB market.
Analysis will progress from:
Data Cleaning--Exploratory Analysis--Market Segmentation--Pricing Analysis--Competitive Analysis--Business Insights

###### Key Findings


###### Business Recommendations

###### Tableau Dashboard



SQL AND TABLEAU ANALYSIS OF NYC LISTINGS

## SQL Analysis

All SQL queries used for data exploration, data quality checks, and business analysis are stored in a separate SQL file.

[View Full SQL Analysis](SQL/nyc_airbnb_analysis.sql)
  
## Data Exploration & Quality Checks

Before conducting the business analysis, I used Google BigQuery to examine the dataset's structure, completeness, and reliability.

### Key Findings

- Total lisitings: 48,895
- Duplicate listing IDs: 0
- Missing host names: 21
- Missing reviews per month: 10,052
- Listings with a price of $0: 11

### Data Quality Considerations

Missing review activity was evaluated carefully because listings without recorded reviews should not automatically be interpreted as having no demand.

Listings with a price of 0 were identified as invalid for pricing comparisons and excluded from pricing analysis.

These checks helped establish a more reliable foundation for the subsequent neighborhood and room-type comparisons.

## Business Question 1: Entire Home vs. Private Room Pricing Premium

### Objective
Determine how much more entire home/apartments cost compared with private rooms within the same NYC neighborhoods, and investigate whether listing volume is associated with the size of that premium.

### Methodology 
Using Google BigQuery, I calculated average listing prices for entire homes/apartments and private rooms within each neighborhood.

- Excluded listings with prices of $0.
- Required at least 20 listings of each room type per neighborhood.
- Calculated the dollar difference between average entire-home and private-room prices.
- Examined the relationship between listing volume and price premiums usings correlation analysis.

### Key Findings
- Neighborhoods with the largest price premiums generally had lower listings volumes.
- Higher-volume neighborhoods still demonstrated meaningful price premiums, typically ranging from $80 to $140.
- Listing volume did not show a clear relationship with the size of the price premium.

### Business Interpretation
Entire homes/apartments generally commanded higher prices than private rooms, but the size of the premium varied across neighborhoods.

Tbe finding suggest that hosts should consider neighborhood-specific pricing patterns rather than assuming higher listing volume atuomatically corresponds to larger price premiums.

[View SQL Analysis](SQL/nyc_airbnb_analysis.sql#L140-L164)








