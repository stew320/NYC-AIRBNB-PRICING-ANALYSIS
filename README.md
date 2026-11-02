# NYC-AIRBNB-PRICING-ANALYSIS

## Project Overview

This project analyzes NYC Airbnb listings to identify neighborhood pricing patterns, compare room-type premiums, and examine review activity as an indicator of market demand.

Using Google BigQuery for data cleaning and SQL analysis, and Tableau for visualizations, the project investigates differences between average and median listing prices, pricing premium for entire home versus private rooms, and variations in review frequency across neighborhoods. These findings provide insights into neighborhood pricing patterns and market activity to support more informed pricing decisions. 


### Business Questions

1) Neighborhood Pricing: Which NYC neighborhoods have the highest average Airbnb listing prices, and how do median prices compare?

2) Room-Type Price Premium: How much of pricing premium do entire home/apartments command over private rooms within the same neighborhood?

3) Neighborhood Activity and Deman Indicators: Which neighborhoods show the strongest signs of Airbnb demand based on listing activity and review frequency?

#### Tools Used
- **SQL**: Data cleaning, filtering, aggregation, and statistical analysis.

- **Google BigQuery**: SQL query execution and dataset management.

- **Tableau**: Data visualization and interactive dashboard development.

##### Dataset
- **Source:** [NYC Airbnb Open Data (Kaggle)](https://www.kaggle.com/datasets/dgomonov/new-york-city-airbnb-open-data)

The dataset contains 48,895 Airbnb listings across New York City's five boroughs. It includes information on neighborhood locations, room types, listing prices, minimum-night requirements, review activity, host listing counts, and availability.

These variables provide the foundation for analyzing neighborhood pricing patterns, room-type premiums, and review activity across the NYC Airbnb market.

## Analysis

### SQL Analysis

All SQL queries used for data exploration, data quality checks, and business analysis are stored in a separate SQL file.

[View Full SQL Analysis](SQL/nyc_airbnb_analysis.sql)
  
### Data Exploration & Quality Checks

Before conducting the business analysis, I used Google BigQuery to examine the dataset's structure, completeness, and reliability.

#### Key Findings

- Total lisitings: 48,895  [View SQL Query](SQL/nyc_airbnb_analysis.sql#L17-L20)
- Duplicate listing IDs: No duplicate listing IDs were identified.  [View SQL Query](SQL/nyc_airbnb_analysis.sql#L24-L32) 
- Missing host names: 21 listings contained missing host_name values. These records were retained because host names were not required for the completed analysis.     [View SQL Query](SQL/nyc_airbnb_analysis.sql#L36-L40)
- Missing reviews per month: 10,052 listings contained missing reviews_per_month values. These were excluded from review-frequency calculations because missing values do not necessarily indicate zero review activity.  [View SQL Query](SQL/nyc_airbnb_analysis.sql#L45-L49)
- Listings with a price of $0: 11 listings had prices of $0 and were excluded from pricing calculations to avoid distorting average and median prices.                 [View SQL Query](SQL/nyc_airbnb_analysis.sql#L54-L58)

#### Data Quality Considerations

- Missing reviews_per_month values were identified and excluded from calculations requiring recorded review frequency. These missing values were not automatically interpreted as zero demand.

- Eleven listings with prices of $0 were identified and excluded from pricing analyses to avoid distorting average and median price calculations.

- These quality checks established a more reliable foundation for subsequent neighborhood pricing, room-type premium, and review-activity comparisons.

### Business Question 1: Which NYC Neighborhoods Have the Highest Average Listing Prices, and How Do Median Prices Compare?

## Objective
Identify neighborhoods with the highest average Airbnb listing prices and compare average prices with median prices to better understand neighborhood pricing patterns and the influence of high-priced lsitings.

## Methodoly

Listings with prices of $0 were excluded from the pricing analysis. Using SQL in Google BigQuery, average listing prices, median listing prices, and total listing counts were calculated for each neighborhood.

Neighborhoods were ranked by average listing price to identify the highest-priced areas. Differences between average and median prices were then examined to assess how closely average prices reflected typical listing prices.

A separate analysis focused on neighborhoods with more than 1,000 listings to evaluate pricing patterns in higher-volume markets and provide additional context for interpreting average-median price differences.


## Key Findings

**Average vs. Median Price Comparison**

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

**This comparison evaluates average-to-median price differences in neighborhoods with larger listing inventories.**

|  Neighborhood  |  Average Price  | Avg-Median Difference  |  Total Listings |
| ---| ---: | ---: | ---: |
|  Midtown  |  $283  |  $73  |  1,545  |
|  Chelsea  |  $250  |  $51  |  1,113  |
|  Upper West Side  |  $211 |  $61  |  1,971  |
|  Hell's Kitchen  |  $205    |  $37  |  1,958  |
|  Upper East Side  |  $189  |  $40  |  1,798  |
|  East Village  |  $186  |  $36  |  1,853  |

Among the high-volume neighborhoods, East Village and Hell's Kitchen recorded the smallest average-to-median price differences at $36 and $37, respectively, with each neighborhood containing over 1,800 listings.

These smaller differences indicate that average listing prices are closer to median prices in East Village and Hell's Kitchen, making the averages more representative of typical listing prices compared with neighborhoods exhibiting substantially larger gaps. However, smaller average-median differences do not necessarily indicate that individual listing prcies are tightly clustered.

**Correlation Analysis -- Listing Volume vs. Average-Median Price Difference** 

To investigate the relationship between neighborhood listing volume and pricing differences, I calculated the Pearson correlation between total listings and the average-median price gap among the top 50 neighborhoods ranked by average listing price.

The resulting correlation was -0.192, indicating a weak negative linear relationship. This suggests that neighborhoods with more listings tended to have slightly smaller average-median price differences within this group, although listing volume alone does not strongly explain these differences.

## Business Interpretation

Neighborhoods with substantial differences between average and median listing prices may contain unusually expensive properties that pull the average upward. For hosts evaluating competitive prices, relying on the average alone could therefore create a misleading impression of typical neighborhood pricing.

In neighborhoods such as East Village and Hell's Kitchen, where average prices are relatively close to media prices, the average may provide a more useful benchmark for typical listing prices. However, this does not necessarily mean that individual listing prices are tightly clustered.

The weak negative correlation (r=-0.192) indicates that listing volume alone does not strongly explain differences between average and median prices. Hosts should therefore consider average prices, median prices, and neighborhood listing counts together when evaluating local pricing patterns.

## Supporting SQL Analysis
1. Average Listing Price vs. Median Listing Price Analysis:

   
[View SQL Query](SQL/nyc_airbnb_analysis.sql#L74-L91) - Calculates average and median listing prices by neighborhood, including total listing counts.

2. High Listing Volume and Average/Median Price Analysis:

   
[View SQL Query](SQL/nyc_airbnb_analysis.sql#L108-L130) - Compares average and median listing prices in higher-volume neighborhoods.

3. Listing Volume and Average-Median Price Gap Correlation:

[View SQL Query](SQL/nyc_airbnb_analysis.sql#L000-L000) - Calculates the Pearson correlation between listing volume and average-median price differences among the top 50 neighborhoods ranked by average price.

## Business Question 2: Which NYC Neighborhoods Have the Largest Price Premium For an Entire Home Compared With a Private Room?

### Objective
Identify neighborhoods with the largest room-type price gaps and check whether those findings hold when using medians instead of averages.

### Methodology 
- Calculated the average price premium for each neighborhood by subtracting the average private-room price from the average entire-home/apartment price.
- Calculated the equivalent premium using median prices to evaluate whether average-based premiums reflected typical differences between room types.
- Compared average and median premium amounts and neighborhood rankings, particularly for Battery Park City, Tribeca, and SoHo, which also appeared among the highest-priced neighborhoods in Business Question 1.
- Included listing counts for each room type to provide context for the comparisons.

### Key Findings
Price Premiums based on average prices by room type

|  Neighborhood  | Entire Home Avg  |   Private Room Avg  |  Price Premium  |  Entire Home Listings  |  Private Room Listings  |
| ---| ---: | ---: | ---:| ---:| ---:|
|  Battery Park City  |  $489  |  $106  |  $383  |  48  |  21  |
|  Tribeca  |  $562  |  $191  |  $371  |  143  |  34  |
|  SoHo  |  $366  |  $125  |  $241  |  241  |  115  |
|  Little Italy  |  $291  |  $96  |  $195  |  76  |  41  |
|  Nolita  |  $293  |  $113  |  $181  |  165  |  85  |



**Observation and Further Investigation** 

Battery Park City, Tribeca, and SoHo appeared among the neighborhoods with the highest entire-home versus private-room pricing premiums. These same neighborhoods were also identified in Business Question 1 as having elevated listing prices relative to their medians.

This overlap raised an additional analytical question: Could unusually expensive listings be inflating the calculated pricing premiums?

To investigate, I compared average-based pricing premiums with median-based pricing premiums to determine whether the initial results accurately reflected typical price differences between entire homes and private rooms.

To assess whether the highest average-based price premiums also reflected typical room-type pricing differences, I compared average and median premiums for the five neighborhoods identified in the initial analysis.

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

The differences between average-based and median-based premiums suggest that unusually expensive listings may be influencing the average premiums. Examining individual listing prices would be necessary to determine the extent of that influence.


#### Business Interpretation
The analysis indicates that entire homes/apartments command higher listing prices than private rooms across the five neighborhoods examined. However, the size of these premiums varies considerably depending on whether average or median prices are used.

Battery Park City had the highest average price premium at $383, compared with a median premium of $125. In contrast, Tribeca had the highest median premium among these five neighborhoods at $210, despite ranking second by average premium. These differences suggest that average-based premiums may be influenced by unusually expensive listings and may overstate typical room-type pricing differences.

For hosts evaluating competitive pricing, median premiums may provide a more useful benchmark for typical differences between entire homes and private rooms. Average premiums remain informative, but should be interpreted alongside median premiums and the number of listings in each room-type category.

#### Supporting SQL Analysis
1. Average Price Premium Analysis - 

[View SQL Query](SQL/nyc_airbnb_analysis.sql#L140-L165) - Calculates the difference between average entire-home/apartment and private-room listing prices by neighborhood, including listing counts for each room type.

2. Average vs. Median Price Premium Analysis

[View SQL Query](SQL/nyc_airbnb_analysis.sql#L174-L223)- Compares average-based and median-based price premiums to evaluate how the choice of pricing measure affects premium amount and neighborhood rankings.

#### Business Question 3: Neighborhood Activity and Demand Indicators
Which neighborhoods show the strongest signs of Airbnb demand based on listing activity and review frequency?

#### Objective
Identify NYC neighborhoods with the highest average review activity per listing and examine how those findings compare with neighborhoods that have larger number of listings.

#### Methodolgy
- Calculated the average and median reviews per month for each neighborhood using listings with available review data.
- Ranked neighborhoods by average review per month to identify areas with the highest review activity per listing.
- Compared these results with neighborhoods ranked by the number of listings containing review data to evaluate differences between review activity and market size.
- Calculated the Pearson correlation between total neighborhood listings and average reviews per month to investigate whether listing volume is associated with review activity.


#### Key Findings

|  Neighborhood  | Total Listings  |   Listings With Review Data  |  Average Reviews Per Month|  Median Reviews Per Month  |  
| ---| ---: | ---: | ---:| ---:|  
|  East Elmhurst  |  185  |  171  |  4.82  |  4.26  |
|  Springfield Gardens  |  85  |  80  |  4.46  |  2.9  |
|  Queens Village  |  60  |  50  |  3.22  |  2.71  |
|  South Ozone Park  |  40  |  38  |  3.18  |  2.0  |
|  Jamaica  |  231  |  192  |  3.15  |  2.06  |

The five neighborhoods with the highest average reviews per month were all located in Queens. However, these neighborhoods had relatively small listing counts, ranging from 40 to 231 total listings.

To provide additional context, I conducted a second comparison by ranking neighborhoods according to the number of listings with available review data. This allowed me to examine review activity in neighborhoods with larger samples and determine whether higher listing volume was associated with higher average review frequency.

|  Neighborhood  | Total Listings  |  Listings with Review Data  |  Average Reviews per Month  |  Median Reviews Per Month |
| ---| ---: | ---: | ---:| ---:| 
|  Williamsburg  |  3920  |  3163  |  1.1  |  0.49  |
|  Bedford-Stuyvesant  |  3714  |  3141  |  1.55  |  1.0  |
|  Harlem  |  2658  |  2206  |  1.34  |  0.77  |
|  Bushwick  |  2465  |  1944  |  1.35  |  0.68  |
|  Hell's Kitchen  |  1958  |  1532  |  1.84  |  1.0  |


The Pearson correlation between total neighborhood listings and average reviews per month was -0.206, indicating a weak negative linear relationship.

This suggests that neighborhoods with more listings tended to have slightly lower average review frequency per listing. However, the relationship is weak, meaning listing volume alone does not strongly explain differences in review activity across neighborhoods.

Because reviews per month measures review frequency rather than actual bookings, these findings should be interpreted as indicators of review activity rather than direct measures of occupancy or customer demand. Listings without available review data were excluded from the average and median review calculations.



#### Business Interpertations
The analysis suggests that neighborhoods with higher listing volumes do not necessarily experience higher average review activity per listing. While smaller neighborhoods in Queens, such as East Elmhurst and Springfield Gardens, recorded some of the highest average reviews per month, larger markets such as Williamsburg and Bedford-Stuyvesant showed lower average review frequencies.

The weak negative correlation (r=-0.206) further suggests that neighborhood listing volume alone is not a strong indicator or average review activity.

For hosts evaluating potential markets, these findings highlight the importance of considering both neighborhood listing volume and review frequency. A neighborhood with fewer listings but higher average review activity may warrant further investigation as a potential opportunity. However, review activity alone cannot establish actual booking demand, occupancy rates, or profitability.


#### Limitations
Reviews are an indirect activity measure, missing review rates were excluded, and these results do not establish bookings, occupancy, revenue, or profitability.

#### Supporting SQL Analysis

1. Neighborhood Average and Median Review Activity


   [View SQL Query](SQL/nyc_airbnb_analysis.sql#L234-L245) - Calculates average and median reviews per month by neighborhood, including total listings and listings with available review data.
   

2. Review Activity in High-Volume Neighborhoods

   
   [View SQL Query](SQL/nyc_airbnb_analysis.sql#L252-L265) - Ranks neighborhoods by the number of listings with review data to compare review frequency across larger neighborhood samples.

3. Listing Volume vs. Review Activity Correlation

SQLLLLLL - Calculates the Pearson correlation between total neighborhood listings and average reviews per month to evaluate the strength and direction of their linear relationship.






