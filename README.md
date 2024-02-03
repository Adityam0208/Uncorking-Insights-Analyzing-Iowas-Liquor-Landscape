# Iowa Liquor Sales Analysis

# Overview
- This project delves into the fascinating world of Iowa's alcoholic beverage landscape, analyzing "spirits purchase information" from Class "E" liquor licensees across the state. Spanning from January 2012 to present, the dataset offers granular insights into product popularity, regional trends, and store performance.

# Data Model Design:
![dim_model](https://github.com/Adityam0208/Uncorking-Insights-Analyzing-Iowas-Liquor-Landscape/blob/main/Dimensional%20model/Dimensional%20model.png)

# Data details:
Invoice/Item Number: Uniquely identifies each liquor purchase within an order.
Date: Reveals the day of purchase, offering insights into seasonal trends and special occasions.
Store Number & Store Name: Uncover which stores are top sellers and how regional preferences vary.
Address, City, Zip Code, & County: Analyze geographic trends in liquor purchases.
Store Location: Explore potential correlations between location and sales performance.

# Slowly Changing Dimensions (SCDs):
- Appropriate SCD types (Type 1, Type 2, or Hybrid) are implemented to handle changes in dimension attributes over time, ensuring data integrity and historical analysis.

# Surrogate Keys:
- Surrogate keys are utilized in all dimensions to decouple them from natural keys, simplifying maintenance and preventing referential integrity issues.

# Foreign Keys:
- Relationships between dimensions and facts are established using foreign keys, enabling efficient data retrieval and analysis.

# Source-to-Target Mappings:
- Clear mappings are defined between source tables and target dimensional tables, ensuring data accuracy and consistency.

# Data Exploration & Preparation:

1. Alteryx for Data Profiling: We leveraged Alteryx's robust capabilities to explore and understand the data, generating:
   - Descriptive statistics summarizing key characteristics.
   - Visualizations uncovering patterns and relationships between variables.
   - Identification of anomalies for further investigation.
2. Dual Staging Approach:
  - Alteryx: Efficiently loaded data into one staging database using Alteryx's intuitive tools.
  - Talend: Demonstrated versatility by utilizing Talend for loading data into a separate staging database.
3. Dimensional Model Creation:
   - ER/Studio: A dimensional data model was meticulously crafted in ER/Studio, laying the foundation for efficient analysis.
   - SQL DDL Script: The dimensional model structure was translated into a comprehensive SQL DDL script, ready for implementation.

# Data Cleansing & Loading:

- Data Cleaning Strategy: A detailed plan outlined specific data cleaning tasks, addressing:
- Inconsistent formatting.
- Missing values.
- Outliers.

# Dimensional Model Population: Data was meticulously loaded from staging tables into the dimensional model, ensuring accuracy and integrity.


# Data Visualization Powerhouse:

- Interactive Dashboards:
   - Power BI: We crafted insightful dashboards within Power BI, enabling users to delve into the data through interactive visualizations.
   -  Tableau: Compelling alternative visualizations were created in Tableau, offering different design aesthetics and functionalities.


# This GitHub repository invites you to explore the following:

  - Code samples: Alteryx and Talend workflows used for data preparation.
  - Dimensional model script: Ready for database implementation.
  - Visualization snapshots: Excerpts from the interactive dashboards created in Power BI and Tableau.

# Future Exploration:

- Analyze sales trends by product category, brand, or region.
- Identify customer segments with high purchase frequency or value.
- Explore correlations between product offerings and store demographics.
