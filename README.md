##Project Overview

The goal of this project was to evaluate the impact of New York City’s congestion zone toll implementation on traffic patterns and safety outcomes. My primary hypothesis was that although the toll would reduce the number of vehicles entering the congestion zone, the accident rate within the zone would increase.
To conduct this analysis, I utilized three datasets sourced from the MTA. The first dataset contained recorded collision data across New York City dating back to 2014. The second dataset contained congestion toll entry data, which was generated beginning on January 5, 2025, the day the congestion pricing policy was implemented. The third dataset consisted of MTA-provided charts comparing average daily vehicle entries per month in 2025 to historical monthly averages.
Data Processing and Methodology
Collision data was filtered and categorized into pre-toll and post-toll periods using January 5, 2025 as the policy implementation threshold. Geographic filtering was applied to distinguish collisions occurring inside the congestion zone from those occurring outside the zone, using street-level location data and coordinate boundaries.
Vehicle entry data was processed to compute daily congestion zone entries following the toll implementation date. Historical entry averages provided by the MTA were used for comparative analysis because congestion tolling did not exist in prior years, making historical entry calculations from raw data infeasible.
It is important to note that the dataset currently extends only through October 2025. This limitation exists because the data was uploaded to the ADA system in mid-November 2025, and therefore complete and verified statistics for November and December were not yet available at the time of analysis. As a result, the analysis reflects the most complete dataset available at the time of processing.
Collision counts were separated into 2024 and 2025 subsets to evaluate changes before and after policy implementation. Monthly average collision rates were computed and normalized by vehicle entry volume to measure accident frequency relative to traffic exposure. Because raw per-vehicle accident probabilities were extremely small, the rates were scaled by 100,000 vehicles to improve interpretability.

##Results

Graphical analysis was conducted to compare three primary variables: congestion zone entries, collision counts, and normalized accident rates across 2024 and 2025.
The results indicate that while congestion pricing successfully reduced the number of vehicles entering the congestion zone, collision rates increased following policy implementation. This outcome suggests that reductions in traffic density may contribute to higher accident risk, potentially due to increased vehicle speeds in less congested conditions.

##Conclusion

The findings of this analysis suggest that congestion pricing achieved its intended effect of reducing traffic volume but may have produced unintended consequences regarding roadway safety metrics. Although the total number of vehicles entering the congestion zone decreased, collision frequency remained relatively stable, resulting in higher normalized accident rates.
Overall, the data supports the original hypothesis that congestion pricing implementation was associated with an increase in accident rates within the study period.
