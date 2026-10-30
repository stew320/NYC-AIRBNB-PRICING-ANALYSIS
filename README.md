# NYC-AIRBNB-PRICING-ANALYSIS

## Project Overview

This project analyzes NYC Airbnb listings to identify neighborhood pricing patterns, compare room=type premiums, and evaluate factors associated with listing prices.

Using Google BigQuery for data cleaning and SQL analysis, and Tableau for visualizations, the project examines how average and median prices differ across neighborhoods, how property types influence pricing, and what these findings suggest for competitive pricing decisions. 


### Business Questions

1) Neighborhood Pricing: Which NYC neighborhoods have the highest average Airbnb listing prices, and how do median prices compare?

2) Room-Type Price Premium: How much of pricing premium do entire home/apartments command over private rooms within the same neighborhood?

3) Neighborhood Activity and Deman Indicators: Which neighborhoods show the strongest signs of Airbnb demand based on listing activity and review frequency?

#### Tools Used
- **SQL**: Data cleaning, filtering, aggregation, and statistical analysis.

- **Google BigQuery**: SQL query execution and dataset management.

- **Tableau**: Data visualization and interactive dashboard development.

##### Dataset
- **Source**: NYC Airbnb Open Data (Kaggle)

The dataset contains 48,895 Airbnb listings across New York City's five boroughs. It includes information on neighborhood locations, room types, listing prices, minimum-night requirements, review activity, host listing counts, and availability.

These variables provide the foundation for analyzing neighborhood pricing patterns, room-type premiums, and review activity across the NYC Airbnb market.

### Analysis


### SQL Analysis

All SQL queries used for data exploration, data quality checks, and business analysis are stored in a separate SQL file.

[View Full SQL Analysis](SQL/nyc_airbnb_analysis.sql)
  
### Data Exploration & Quality Checks

Before conducting the business analysis, I used Google BigQuery to examine the dataset's structure, completeness, and reliability.

#### Key Findings

- Total lisitings: 48,895
- Duplicate listing IDs: 0
- Missing host names: 21
- Missing reviews per month: 10,052
- Listings with a price of $0: 11

#### Data Quality Considerations

- Missing reviews_per_month values were identified and excluded from calculations requiring recorded review frequency. These missing values were not automatically interpreted as zero demand.

- Eleven listings with prices of $0 were identified and excluded from pricing analyses to avoid distorting average and median price calculations.

- These quality checks established a more reliable foundation for subsequent neighborhood pricing, room-type premium, and review-activity comparisons.

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

These smaller differences suggest that the median listing prices may provide a more representative estimate of typical listing prices in these neighborhoods compared with neighborhoods exhibiting larger gaps.

## Business Interpretation

Average vs Median price: Neighborhoods with high average prices may contain unusually expensive properties that influence the overall average. Comparing median prices help provide a more representative benchmark for typical listing costs, allowing host and investors to make more informed pricing decisions. 

High-Volume Neighborhood Analysis: East Village and Hell's Kitchen demonstrated relatively small differences between average and median listing prices despite having over 1,800 listings each. This suggests that average prices in these neighborhoods may be more representative of typical listing costs, making them potentially useful benchmarks for hosts evaluating competitive pricing.

## Supporting SQL Analysis
1. Average Listing Price vs. Median Listing Price Analysis:

   
[View SQL Query](SQL/nyc_airbnb_analysis.sql#L74-L91)

2. High Listing Volume and Average/Median Price Analysis:

   
[View SQL Query](SQL/nyc_airbnb_analysis.sql#L108-L130)

## Business Question 2: Which NYC Neighborhoods Have the Largest Price Premium For an Entire Home Compared With a Private Room?

### Objective
Identify neighborhoods with the largest room-type price gaps and check whether those findings hold when using medians instead of averages.

### Methodology 
- Calculate the average entire-home price minus the average private-room price for each neighborhood. 
- Repeat using median prices, then compare neighborhood rankings and premium amomunts.
- Include listing counts for both room types to provide context.

### Key Findings
Price Premiums based on average prices by room type

|  Neighborhood  | Entire Home Avg  |   Private Room Avg  |  Price Premium  |  Entire Home Listings  |  Private Room Listings  |
| ---| ---: | ---: | ---:| ---:| ---:|
|  Battery Park City  |  $489  |  $106  |  $383  |  48  |  21  |
|  Tribeca  |  $562  |  $191  |  $371  |  143  |  34  |
|  SoHo  |  $366  |  $125  |  $241  |  241  |  115  |
|  Little Italy  |  $291  |  $96  |  $195  |  76  |  41  |
|  Nolita  |  $293  |  $113  |  $181  |  165  |  85  |



Observation and Further Investigation 

Battery Park City, Tribeca, and SoHo appeared among the neighborhoods with the highest entire-home versus private-room pricing premiums. These same neighborhoods were also identified in Business Question 1 as having elevated listing prices relative to their medians.

This overlap raised an additional analytical question: Could unusually expensive listings be inflating the calculated pricing premiums?

To investigate, I compared average-based pricing premiums with median-based pricing premiums to determine whether the initial results accurately reflected typical price differences between entire homes and private rooms.

Top result was Brighton Beach, but it seemed off, explaination after table.

|  Neighborhood  | Average Premium  |   Median Premium  |  Average minus Median Premium  |
| ---| ---: | ---: | ---:|
|  Battery Park City  |  $383  |  $125  |  $258  | 
|  Tribeca  |  $371  |  $210  |  $161  |  
|  SoHo  |  $241  |  $144  |  $97  | 
|  Little Italy  |  $195  |  $94  |  $101  |
|  Nolita  |  $181  |  $125  |  $56  |

All five neighborhoods still have positive median premiums, supporting that entire homes/apartments cost more than private rooms.

Median premiums are smaller in every neighborhood. Battery Park City's premium decreases from $383 using averages to $125 usings medians. 

Among these five neighborhoods, Tribeca has the largest median premium at $210, as oppose to Battery Park City leading with the average premium.

Larger average premiums suggest sensitivity to unusually high prices. 

Examining individual listing prices would be needed to confirm.

### Business Interpretation
Entire homes/apartments generally commanded higher prices than private rooms, but the size of the premium varied across neighborhoods.

Tbe findings suggest that hosts should consider neighborhood-specific pricing patterns rather than assuming higher listing volume atuomatically corresponds to larger price premiums.

### Supporting SQL Analysis
1. Price Premium Average Analysis

[View SQL Query](SQL/nyc_airbnb_analysis.sql#L140-L165) - Calculates the average price difference between entire homes/apartments and private rooms, including listing counts.

2. Price Premium with Median Analysis

[View SQL Query](SQL/nyc_airbnb_analysis.sql#L174-L226)- Compares average premiums between home/apartment and private rooms, with median premiums.

#### Business Question 3: Neighborhood Activity and Demand Indicators
Which neighborhoods show the strongest signs of Airbnb demand based on listing activity and review frequency?

#### Objective
Identify neighborhoods with higher review activity, using reviews per month as a proxy for demand and listing counts to provide market context.

#### Methodolgy
- Compare reviews per month across neighborhoods and include listing counts alongside the results.
- Review both average and median review activity to assess whether the findings reflect typical listings or are influenced by a smaller number of highly reviewed listings.


#### Key Findings

|  Neighborhood  | Total Listings  |   Listings With Review Data  |  Average Reviews Per Month|  Median Reviews Per Month  |  
| ---| ---: | ---: | ---:| ---:|  
|  East Elmhurst  |  185  |  171  |  4.82  |  4.26  |
|  Springfield Gardens  |  85  |  80  |  4.46  |  2.9  |
|  Queens Village  |  60  |  50  |  3.22  |  2.71  |
|  South Ozone Park  |  40  |  38  |  3.18  |  2.0  |
|  Jamaica  |  231  |  192  |  3.15  |  2.06  |

The top 5 neighborhoods by average reviews per month all happened to be in Queens. The total listings was on the lower side, so I decided to order the list by listings with review data, to get a better understanding contextually.

|  Neighborhood  | Total Listings  |  Listings with Review Data  |  Average Reviews per Month  |  Median Reviews Per Month |
| ---| ---: | ---: | ---:| ---:| 
|  Williamsburg  |  3920  |  3163  |  1.1  |  0.49  |
|  Bedford-Stuyvesant  |  3714  |  3141  |  1.55  |  1.0  |
|  Harlem  |  2658  |  2206  |  1.34  |  0.77  |
|  Bushwick  |  2465  |  1944  |  1.35  |  0.68  |
|  Hell's Kitchen  |  1958  |  1532  |  1.84  |  1.0  |


The largest markets by reviewed listing count do not have the highest review rates per listing.  The smaller listing count neighborhoods had higher reviews per month averages, while the higher listing count neighborhoods had much smaller reviews per month averages. To further investigate, I decided to run a correlation query between the total listing count by neighborhood and reviews per month.

Correlation = -0.206



#### Business Interpertations
Hosts should consider both market size and review frequency; a larger market does not automatically mean more frequent guest activity for an individual listing.


#### Limitations
Reviews are an indirect activity measure, missing review rates were excluded, and these results do not establish bookings, occupancy, revenue, or profitability.

#### Supporting SQL Analysis

1. Listings and Average Reviews per Month Analysis:


   [View SQL Query](SQL/nyc_airbnb_analysis.sql#L203-L214) 

2. Listing Count and Average Reviews per Month Correlation:

   
   [View SQL Query](SQL/nyc_airbnb_analysis.sql#L221-L234)







