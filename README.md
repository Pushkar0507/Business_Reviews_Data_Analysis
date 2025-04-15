# 🛠️ Business_Reviews_Data_Analysis
 
## 🚀 Project Overview
This hands-on project demonstrates the design and implementation of a modern cloud-based data pipeline using a real-world dataset. The goal was to ingest, transform, and analyze large-scale JSON data end-to-end—from raw ingestion to sentiment-based insights—leveraging the power of AWS, Snowflake, Python, and SQL.

It showcases practical experience in:
- **Cloud Storage & Data Engineering using AWS S3**
- **Data Warehousing & Analytics with Snowflake**
- **Data Transformation using Python and SQL**
- **Real-Time Sentiment Analysis using TextBlob via Python UDFs inside Snowflake**

## 📦 Dataset

The dataset used in this project can be downloaded from:
👉 https://business.yelp.com/data/resources/open-dataset/



## 🏗️ Tech Stack

| Tool        | Purpose                                   |
|-------------|-------------------------------------------|
| **AWS S3**  | Cloud storage for raw and chunked JSON files         |
| **Snowflake** | Data warehousing and analytical processing |
| **Python**  | Data wrangling, file splitting, and transformation     |
| **SQL**     | Data modeling, flattening JSON, and querying  |
| **TextBlob**| Sentiment analysis embedded via Python UDF in Snowflake|

---

## 🔄 Data Pipeline Workflow

📁 **Data Preparation**  
   - Chunked large JSON files into smaller parts using Python for easier handling and ingestion.

☁️ **Cloud Storage (AWS S3)**  
   - Uploaded cleaned and structured files to AWS S3, serving as the landing zone for ingestion.

🧊 **Data Ingestion (Snowflake)**  
   - Ingested data from S3 to Snowflake using COPY INTO command (without a named stage), ensuring fast and efficient loading.
     
🔄 **Data Transformation**  
   - Flattened nested JSON structures using Snowflake SQL.
   - Modeled the data into well-structured relational tables optimized for querying.

💬 **Sentiment Analysis**  
   - Built a Python UDF within Snowflake that leverages TextBlob to perform real-time sentiment analysis on user reviews and comments.

📊 **Data Analysis & Insights**  
   - Extracted actionable insights such as:
      - Top Business Categories by volume and sentiment
      - Most Active Users based on review count
      - Sentiment Trends Over Time, identifying peaks in positive or negative reviews
    


