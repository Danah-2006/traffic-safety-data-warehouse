# traffic-safety-data-warehouse
A Data Integration and Warehousing project analyzing transportation safety using Star Schema and SQL.
# Transportation Behavior & Safety Analysis (Data Integration & Warehousing)

## 📌 Project Overview
This project analyzes transportation safety and passenger travel behavior by integrating heterogeneous data sources to uncover accident patterns, high-risk regions, and seasonal peaks.

## 🛠 Tech Stack & Architecture
- **ETL & Data Processing:** Python (Pandas) for schema matching, data standardization, and missing value handling.
- **Data Warehouse Design:** Dimensional modeling via a **Star Schema** (Fact and Dimension tables).
- **Analytics & Querying:** Standard SQL / OLAP queries for business intelligence aggregations.

## 🗄 Star Schema Architecture
- **Fact Table:** `FACT_Accidents` (Tracks metrics: total injuries, fatalities, and vehicles involved).
- **Dimension Tables:** `DIM_Location`, `DIM_Date`, `DIM_Accident`.

## 📊 Key Findings & Insights
- **High-Risk Zones:** Hail and Madinah reported the highest injury counts, emphasizing the need for targeted emergency response deployment.
- **Accident Severity:** "Death Accidents" accounted for the vast majority of fatalities (45 cases).
- **Seasonality:** Peak accident occurrences clustered around July, highlighting the demand for seasonal traffic management campaigns.

## 📂 Repository Contents
- `queries.sql`: Contains the complete DDL for table creation (Star Schema) and analytical OLAP queries.
- `A Data Integration and Warehousing...pdf`: Comprehensive presentation detailing the methodology, data pipeline, and visual dashboards.
