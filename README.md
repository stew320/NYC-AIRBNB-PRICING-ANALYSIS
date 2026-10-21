# NYC-AIRBNB-PRICING-ANALYSIS

## Project Overview

This project analyzes the NYC AirBnB market to identify factors associated with listing prices, evaluate competitive positioning across neighborhoods and roomy types, and uncover market segments and potential opportunities for hosts.

SQL is used to clean, explore, and analyze the dataset, while Tableau is used to transform the results into interactive visualizations and communicate business insights.

The goal of this project is to move beyond basic listing counts and averages and investigate what factors are associated with AirBnB pricing and competitive positioning within the NYC market.


### Business Questions

1) Which NYC neighborhoods have the highest average Airbnb listing prices, and how do median prices compare?
2) How much of a pricing premium do entire homes/apartments command over private rooms within the same neighborhood?
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

## Business Question 1: Which NYC Neighborhoods Have the Highest Average Listing Prices, and How Do Median Prices Compare?

## Objective
Identify neighborhoods with the highest average Airbnb listing prices and compare average prices with median prices to better understand neighborhood pricing patterns and the influence of high-priced lsitings.

## Methodoly
Using Google BigQuery, I analyzed neighborhood-level Airbnb pricing by:
- Excluding listings with prices of $0.
- Calculating average listing prices by neighborhood.
- Calculating median listing prices to provide a comparison with the average.
- Including total listing counts to provide context for neighborhood sample sizes.
- Applying minimum listing threshold of 20 listings per neighborhood.

Additional Analysis: High-Volume Neighborhoods:
To evaluate whether average prices were representative of neighborhoods with substantial listing activity, I conducted a secondary analysis:
- Identified the top 50 neighborhoods ranked by average listing price.
- Selected neighborhoods within that group containing more than 1,000 listings.
- Compared average and median listing prices within those neighborhoods.
- Examined the differences between these measures to assess how well average price represented typical listing prices.

## Key Findings

Average vs. Median Price Comparison
-The analysis revealed notable differences between average and median listing prices in several high-priced NYC neighborhoods.

|  Neighborhood  | Average Price  |  Median Price  |  Difference  |
| ---| ---: | ---: | ---:|
|  Tribeca  |  $491  |    $200|
|  Battery Park City  |  $368  |   $173  |
|  Flatiron District  |  $342  |   $117  |


Large differences between average and median listing prices may indicate that high-priced outliers are pulling neighborhood averages upward.

Smaller differences suggest that average prices may be more representative of typical listing prices.

High-Volume Neighborhood Analysis

-- Midtown -         average $282.72 - avg-median difference $72.72 - total listings 1,545
-- Chelsea -         average $249.74 - avg-median difference $50.74 - total listings 1,113
-- Upper West Side - average $210.92 - avg-median difference $60.92 - total listings 1,971
-- Hell's Kitchen -  average $204.79 - avg-median difference $36.79 - total listings 1,958
-- Upper East Side - average $188.95 - avg-median difference $39.95 - total listings 1,798
-- East Village -    average $186.08 - avg-median difference $36.08 - total listings 1,853

|  Neighborhood  |  Average Price  | Avg-Median Difference  |  Total Listings |



To extend the initial pricing analysis, I examined neighborhoods with more than 1,000 listings among the top 50 neighborhoods ranked by average price.

This comparison provided additional context for interpreting average and median prices in neighborhoods with larger listing inventories.

## Business Interpretation

-Average vs Median price: Neighborhoods with high average prices may contain unusually expensive properties that influence overall average.  Comparing median prices helps provide a more representative benchmark for typical listing costs.

-High-Volume Neighborhood Analysis: Examining neighborhoods with larger listing inventories add context by showing how these pricing patterns appear in more established, higher-volume markets.

## Supporting SQL Analysis
[Average vs. Median Comparison](SQL/nyc_airbnb_analysis.sql#L74-L91)

[High Listing Volume and Average Query](SQL/nyc_airbnb_analysis.sql#L108-L130)

## Business Question 2: Entire Home vs. Private Room Pricing Premium

### Objective
Determine how much more entire home/apartments cost compared with private rooms within the same NYC neighborhoods, and investigate whether listing volume is associated with the size of that premium.

### Methodology 
Using Google BigQuery, I calculated average listing prices for entire homes/apartments and private rooms within each neighborhood.
- 
- Excluded listings with prices of $0.
- Required at least 20 listings of each room type per neighborhood.
- Calculated the dollar difference between average entire-home and private-room prices.
- Examined the relationship between listing volume and price premiums usings correlation analysis.

### Key Findings
- Neighborhoods with the largest price premiums generally had lower listings volumes.
- Higher-volume neighborhoods still demonstrated meaningful price premiums, typically ranging from $80 to $140.
- Listing volume did not show a clear relationship with the size of the price premium.
- The correlation between listing volume and price premium was approximately 0.04, indicating virtually no linear relationship between the two variables.

### Business Interpretation
Entire homes/apartments generally commanded higher prices than private rooms, but the size of the premium varied across neighborhoods.

Tbe finding suggest that hosts should consider neighborhood-specific pricing patterns rather than assuming higher listing volume atuomatically corresponds to larger price premiums.

### Supporting SQL Analysis
1. Price Premium Analysis

[View SQL Analysis](SQL/nyc_airbnb_analysis.sql#L140-L164) - Calculates the average price difference between entire homes/apartments and private rooms, including listing counts.

2. Listing Volume & Price Premium Correlation

[View Correlation Query](SQL/nyc_airbnb_analysis.sql#L172-L192)- Measures the relationship between listing volumes and price premium across neighborhoods.










