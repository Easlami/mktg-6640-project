# mktg-6640-project README

# 📊 Text Analytics for Seong Buk Dong

A data-driven exploration of customer sentiment and operational improvement strategies for Seong Buk Dong, a Korean restaurant in Los Angeles.

---

## 📝 Executive Summary

Seong Buk Dong has received mixed reviews on Yelp, ranging from praise for authentic flavors to critiques around service, ambiance, and value. With hundreds of reviews spanning varied levels of detail, the challenge is to extract actionable insights.

In this project, we apply text analysis to reviews of Seong Buk Dong and its top-performing competitors. Our objective is to identify patterns in customer feedback—especially factors that contribute to higher ratings—such as better service, improved atmosphere, and enhanced dish presentation.

---

## ❗ Business Problem

The restaurant team cannot easily detect trends in feedback due to review variability and volume. By contrasting Seong Buk Dong’s reviews with those from highly rated Korean restaurants, we will highlight gaps in performance and offer recommendations for improvement.

---

## 🎯 Relevance

Using advanced text analytics on customer reviews, this project aims to:

- Measure sentiment toward Seong Buk Dong
- Identify themes driving low-star ratings
- Benchmark Seong Buk Dong against higher-rated competitors

These insights will guide strategic decisions and bolster the dining experience in LA’s competitive food scene.

---

## 📦 Dataset Description

The dataset originates from Kaggle and includes reviews and metadata from 240 top-rated Los Angeles restaurants.

- **Total Reviews:** 2,381  
- **Review Period:** 2011–2023  

**Fields Included:**

- `Rank`: Yelp rank of the restaurant  
- `CommentDate`: Date the review was posted  
- `Date`: Scrape date of the review  
- `RestaurantName`: Name of the restaurant  
- `Comment`: Text of the customer review  
- `Address`: Location of the restaurant  
- `StarRating`: Average Yelp star rating  
- `NumberOfReviews`: Total review count  
- `Style`: Type of cuisine  
- `Price`: Price range (e.g., $$)

---

## 📊 Analysis Scripts 

- **Exploratory Data Analysis (EDA):** Initial insights on review quantity, rating distribution, and restaurant attributes.
- **Sentiment Analysis:** Gauge emotional tone in reviews.
- **Topic Modeling:** Uncover underlying themes using Latent Dirichlet Allocation (LDA).
- **XGBoost:** Predict star ratings and ranking from textual and metadata features.
- **Sentiment by Topic Analysis:** Combine thematic and emotional signals for nuanced understanding.
- **Elastic Net Regression:** Quantify the contribution of textual features to ranking outcomes.
- **LLM Snapshot:** Use large language models to summarize review content and generate more sentiment analysis.

---

## 🚀 Outcome

By converting unstructured review data into structured, actionable insight, this project supports Seong Buk Dong in aligning with customer expectations and enhancing its reputation.
