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

To evaluate pricing patterns among NYC's highest-average-price neighborhoods, I compared average listing prices, the differences between average and median prices, and total listing counts.  This comparison helps identify where average prices may not accurately represent typical listing prices.

|  Neighborhood  | Average Price  |   Avg-Median Difference  |  Total Listings  |
| ---| ---: | ---: | ---:|
|  Tribeca  |  $491  |    $200|  177  |
|  Battery Park City  |  $368  |   $173  |  70  |
|  Flatiron District  |  $342  |   $117  |  80  |
|  NoHo  |  $296  |  $46  |  78  |
|  SoHo  |  $287  |  $92  |  358  |  

Tribeca recorded the largest average-to-median price difference at $200, followed by Battery Park City at $173 and Flatiron District at $117.

NoHo and Soho showed smaller differences of $46 and $92, respectively, demonstrating that not all neighborhoods with high average prices exhibit equally large gaps between their average and median prices.

Listing counts also varied, ranging from 70 in Battery Park City to 358 in SoHo.

High Listing-Volume Neighborhood Analysis

To extend the initial pricing analysis, I examined neighborhoods with more than 1,000 listings among the top 50 neighborhoods ranked by average price.

This comparison evaluates average-to-median price differences in neighborhoods with larger listing inventories.

|  Neighborhood  |  Average Price  | Avg-Median Difference  |  Total Listings |
| ---| ---: | ---: | ---: |
|  Midtown  |  $283  |  $73  |  1,545  |
|  Chelsea  |  $250  |  $51  |  1,113  |
|  Upper West Side  |  $211 |  $61  |  1,971  |
|  Hell's Kitchen  |  $205    |  $37  |  1,958  |
|  Upper East Side  |  $189  |  $40  |  1,798  |
|  East Village  |  $186  |  $36  |  1,853  |

Among the high-volume neighborhoods, East Village and Hell's Kitchen recorded the smallest average-to-median price differences at $36 and $37, respectively, with each neighborhood containing over 1,800 listings.

These smaller differences suggest that the average listing prices may provide a more representative estimate of typical listing prices in these neighborhoods compared with neighborhoods exhibiting larger gaps.

## Business Interpretation

Average vs Median price: Neighborhoods with high average prices may contain unusually expensive properties that influence the overall average. Comparing median prices help provide a more representative benchmark for typical listing costs, allowing host and investors to make more informed pricing decisions. 

High-Volume Neighborhood Analysis: East Village and Hell's Kitchen demonstrated relatively small differences between average and median listing prices despite having over 1,800 listings each. This suggests that average prices in these neighborhoods may be more representative of typical listing costs, making them potentially useful benchmarks for hosts evaluating competitive pricing.

## Supporting SQL Analysis
[Average vs. Median Comparison](SQL/nyc_airbnb_analysis.sql#L74-L91)

[High Listing Volume and Average Query](SQL/nyc_airbnb_analysis.sql#L108-L130)

## Business Question 2: Which NYC Neighborhoods Have the Largest Price Premium For an Entire Home Compared With a Private Room?

### Objective
Identify neighborhoods with the largest room-type price gaps and check whether those findings hold when using medians instead of averages.

### Methodology 
Using Google BigQuery, I calculated average listing prices for entire homes/apartments and private rooms within each neighborhood.
- 
- Excluded listings with prices of $0.
- Required at least 20 listings of each room type per neighborhood.
- Calculated the pricing premium by subtracting the average private-room price from the average entire-home/apartment price.
- Examined the relationship between listing volume and price premiums usings correlation analysis.

### Key Findings

1. introduce initial comparison of entire home vs private room premiums
2. show the table with neighborhoods that have highest premiums
3. add short paragraph connecting those findings to question 1.  avg price may be influenced by a few extremley high listings.
4. introduce secondary analysis comparing average based and median based premiums

Observation and Further Investigation 
Battery Park City, Tribeca, and SoHo appeared among the neighborhoods with the highest entire-home versus private-room pricing premiums. These same neighborhoods were also identified in Business Question 1 as having elevated listing prices relative to their medians.

This overlap raised an additional analytical question: Could unusually expensive listings be inflating the calculated pricing premiums?

To investigate, I compared average-based pricing premiums with median-based pricing premiums to determine whether the initial results accurately reflected typical price differences between entire homes and private rooms.


### Business Interpretation
Entire homes/apartments generally commanded higher prices than private rooms, but the size of the premium varied across neighborhoods.

Tbe finding suggest that hosts should consider neighborhood-specific pricing patterns rather than assuming higher listing volume atuomatically corresponds to larger price premiums.

### Supporting SQL Analysis
1. Price Premium Analysis

[View SQL Analysis](SQL/nyc_airbnb_analysis.sql#L140-L164) - Calculates the average price difference between entire homes/apartments and private rooms, including listing counts.

2. Listing Volume & Price Premium Correlation

[View Correlation Query](SQL/nyc_airbnb_analysis.sql#L172-L192)- Measures the relationship between listing volumes and price premium across neighborhoods.










