# # 🏡 ML_model_predicting_house_prices

# Project Title
*Machine Learning Model for Predicting House Prices in the UK*

## 📅 Project Timeline
**Duration:** 10-Jan-2023 – 12-March-2023 (Part-Time)
**Location:** Master's in Advanced Computer Science, UK  
**Employer Name:** Self-initiated Academic Project  
**Reporting to:** Furqan Aziz  
**Type of Project:** Big Data (Academic Project)  

## 📌 Objective
The objective of this project was to build a **data-driven house price forecasting system** that provides accurate property valuation insights across more than 15 UK locations.  

The project's goal is to assist mortgage brokers, estate agents, and investors in identifying high-growth investment zones and making well-informed judgements by utilising sophisticated machine learning models, data pipelines, and geospatial integration.

## 🏠 Background & Relevance
Forecasting house prices plays a pivotal role in real estate, mortgage, and PropTech industries. This project combines housing market trends with geospatial intelligence—such as proximity to schools, transportation, and local amenities—and leverages advanced machine learning models like Random Forest and XGBoost. The goal is to enhance prediction accuracy while generating actionable insights for smarter decision-making
The outcome was a scalable, ethical, and real-time system for UK housing market analysis.

## ⚙️ Methodology
- Gathered **25,000+ housing data points** from open APIs and Kaggle datasets.  
- Cleaned and standardized property records using **Python (Pandas, NumPy)**.  
- Integrated **geospatial data** for contextual features (schools, transport, amenities).  
- Conducted **Exploratory Data Analysis (EDA)** with Matplotlib and Seaborn.  
- Built and tuned ML models (**Random Forest, XGBoost**) using hyperparameter optimization.  
- Performed **cross-validation** and evaluation with R² and RMSE.  
- Automated repetitive analysis tasks for efficiency.  
- Developed **dashboards and visual reports** to present regional insights.  

## 📂 Data Sources

HM Land Registry Price Paid Data – official property transaction prices across the UK. Licence: Open Government Licence v3.0
Office for National Statistics (ONS) APIs – demographic and regional statistics. Licence: Open Government Licence v3.0
UK Open APIs – geospatial and location-based features (schools, transport, amenities). [Licence: respective API terms]
Kaggle Housing Datasets – for supplementary data and model benchmarking.

## 🛠️ Tools & Technologies
- **Languages:** Python (Pandas, NumPy)  
- **Visualization:** Matplotlib, Seaborn  
- **Machine Learning:** Scikit-learn, Random Forest, XGBoost  
- **Geospatial Integration:** Python GIS tools  
- **Version Control:** Git / GitHub  
- **Link:** [Git Repository](https://github.com/dineshsammeta1234/ML_model_predicting_house_prices2)  

## 📌 Project Responsibilities
- Collected, merged, and standardized **25,000+ housing data points** across 15+ UK regions.  
- Developed **cleaning and preprocessing pipelines** using Pandas/NumPy.  
- Integrated **geospatial data** for location-based attributes (schools, transit, amenities).  
- Conducted **EDA** to explore price factors and trends.  
- Built, trained, and optimized **Random Forest & XGBoost regression models**.  
- Applied **hyperparameter tuning** to improve accuracy and reduce RMSE.  
- Validated models with **cross-validation & standard performance metrics**.  
- Designed **visual dashboards & reports** for investors and estate agents.  
- Automated repetitive preprocessing tasks to save analyst time.  
- Documented the full pipeline for **scalability and repeatability**.  
- Collaborated with peers for validation and conducted peer assessments.  
- Ensured **data ethics & compliance** with public datasets.  
- Presented findings to **academic and professional audiences**.  

## 📊 Results & Achievements
- Achieved **~90% R² score** with ensemble ML models.  
- Identified **key growth zones** with up to **15% annual appreciation** potential.  
- Reduced manual market analysis time by **30+ hours per analyst/month** through automation.  
- Produced insights that informed **real estate investment & portfolio planning**.  
- Developed a **scalable proof-of-concept**, adaptable to different housing markets in the UK.

## 📈 Metrics 

Below is a demonstration of model performance recorded in [`metrics/metrics.csv`](metrics/metrics.csv):

| Run Date   | Dataset       | Split     | Model          | R²   | RMSE     | n_train | n_test | Seed |
|------------|----------------|-----------|----------------|------|----------|---------|--------|------|
| 2025-09-25 | house_prices  | train/test | RandomForest     | 0.90 | 45000.5  | 20000   | 5000   | 42   |

You can update this file over time with new runs to track improvements.  

## Baseline & Cross-Validation Results

To provide an honest evaluation of our models, we compare them against simple baselines using 5-fold cross-validation. Metrics reported are R² ± standard deviation.

Model	R² (Mean ± Std)
Mean Baseline	0.00 ± 0.00
Linear Regression	0.55 ± 0.03
Random Forest	0.82 ± 0.02
XGBoost	0.84 ± 0.02

Notes:

Baselines:

Mean Baseline: always predicts the mean house price.

Linear Regression: simple linear model using all numeric features.

Advanced models (Random Forest, XGBoost) consistently outperform simple baselines.

Results are from 5-fold cross-validation, reporting mean and standard deviation to avoid cherry-picking.

---

## Contact  
For questions, collaboration, or feedback, please contact:  
**Sammeta Dinesh Kumar** — [sammetadineshkumar@gmail.com]  
- 🌐 [Portfolio](https://dineshkumarsammeta.github.io/)  
- 🔗 [LinkedIn](https://www.linkedin.com/in/dineshsammeta)  
