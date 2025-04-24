# Effect of Socio-Economic and Lifestyle Factors on Depression

This repository contains the analysis and report for the project investigating the influence of socio-economic factors (Race, Education) and lifestyle choices (Sleep, Smoking, Exercise) on the likelihood of depression. The analysis utilizes Bayesian hierarchical logistic regression on data from the 2022 National Health Interview Survey (NHIS) sourced via IPUMS.

## Overview

The primary goal was to assess how different levels of education, race, and lifestyle factors correlate with depression outcomes, and to quantify the strength of these relationships.

-   **Data:** National Health Interview Survey (NHIS) 2022, subsetted to 7,128 adult respondents in the United States.
-   **Methodology:** Bayesian hierarchical logistic regression using R and Stan (NUTS MCMC). Race and Education were modeled hierarchically.
-   **Response Variable:** `DEPFREQ` (Binary: 1 = Depressed, 0 = Not Depressed)
-   **Key Predictors:**
    -   `HISPRACE`: Race/Ethnicity
    -   `EDUC`: Highest Education Level
    -   `HRSLEEP`: Average hours of sleep
    -   `SMOKESTATUS2`: Smoking frequency
    -   `MOD10FTP`: Frequency of moderate physical activity (>10 mins)

## Key Findings

1.  **Lifestyle Factors:** Show a strong influence on depression odds.
    *   Daily smoking significantly increases the log-odds of depression (approx. +0.78).
    *   Weekly moderate physical activity significantly decreases the log-odds (approx. -0.73).
    *   Increased sleep duration is negatively correlated with depression odds.
2.  **Socio-Economic Factors:**
    *   **Race:** Native Americans (+0.23 log-odds) and White individuals (+0.21 log-odds) showed a higher likelihood of depression compared to the baseline in this dataset/model.
    *   **Education:** Higher education levels (Bachelor's: -0.22, Master's: -0.15 log-odds) are generally associated with lower depression odds compared to lower levels (e.g., College Dropout: +0.29 log-odds). Doctoral degrees showed a slight positive coefficient (+0.01) relative to the baseline.

## Repository Structure


-   `Effect_of_Socio-Economic_and_Lifestyle_Factors_on_Depression.pdf`: The full research paper detailing the introduction, data, methods, results, and discussion.
-   `Final_Analysis_Quarto`: the unknit R (Quarto) Markdown file containing code used for generating plots and analysis.
-   `/data`: contains the processed data as a .rds file.
-   `/models`: Contains the stan file for the bayesian models used (Note: The .rds files for the fitted models used in the project haven't been added due to issues with Github LFS, they will be uploaded in the near future).

## Limitations

-   The model's predictive accuracy (AUC ≈ 0.671) is modest, suggesting other factors not included are important.
-   The dataset is imbalanced regarding race, with White respondents comprising 66% and minorities (especially Native Americans at ~1%) being underrepresented.
-   Findings are specific to the US population surveyed in 2022.

## Future Work

-   Incorporate additional predictors (e.g., income, disability status).
-   Utilize larger or more balanced datasets, potentially incorporating oversampling or weighting.
-   Compare findings with global datasets.

## Author

Rudraharsh Tewary

## References

See the full list of references in the included PDF report.
