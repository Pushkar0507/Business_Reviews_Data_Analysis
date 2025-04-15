# 🛠️ Business_Reviews_Data_Analysis
 

This project demonstrates a complete end-to-end data pipeline using **Yelp's open dataset**. It covers everything from data ingestion and transformation to advanced analytics and sentiment analysis — all using modern cloud and data tools.

## 📦 Dataset

The dataset used in this project can be downloaded from:
👉 https://business.yelp.com/data/resources/open-dataset/


## 🚀 Project Overview

This hands-on project is built on a real-world dataset to showcase skills in:

- **Cloud Storage (AWS S3)**
- **Data Warehousing (Snowflake)**
- **Data Transformation (Python, SQL)**
- **Sentiment Analysis (TextBlob via Python UDF in Snowflake)**


## 🏗️ Tech Stack

| Tool        | Purpose                                   |
|-------------|-------------------------------------------|
| **AWS S3**  | Cloud storage for raw JSON files          |
| **Snowflake** | Data warehouse for processing & analytics |
| **Python**  | Data preprocessing and transformation     |
| **SQL**     | Data modeling, transformation & querying  |
| **TextBlob**| Sentiment analysis via Python UDF         |

---

## 🔄 Data Pipeline Workflow

1. **Data Preparation**  
   - Split large JSON files into smaller chunks for easy ingestion.

2. **Cloud Storage (AWS S3)**  
   - Uploaded processed JSON files directly to an S3 bucket.

3. **Data Ingestion (Snowflake)**  
   - Used `COPY INTO` to ingest data from S3 to Snowflake tables (no named stage used).

4. **Data Transformation**  
   - Flattened nested JSON using SQL and structured the data into relational tables.

5. **Sentiment Analysis**  
   - Created a Python UDF in Snowflake using TextBlob to perform sentiment analysis on user reviews.

6. **Data Analysis & Insights**  
   - Generated insights like:
     - Top business categories
     - Most active users
     - Sentiment trends over time
    


