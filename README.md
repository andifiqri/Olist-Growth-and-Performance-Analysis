# Acquisition-Driven Growth: A Marketplace Yet to Build a Retention Engine

## Project Overview

This project analyzes customer growth and retention patterns in a Brazilian e-commerce marketplace using the **Olist Public Dataset**. The central finding is straightforward: revenue growth is being sustained almost entirely by new customer acquisition, while retention remains structurally absent across all observed cohorts.

The analysis is designed to answer one core question: **is this marketplace growing sustainably, or is it aqcuisition-driven?**

---

## Key Insights

- New customers account for 97.04% of total revenue across the observation period, while retained and resurrected customers together contribute less than 3%. The platform does not yet have a sufficiently large existing customer base to serve as a revenue buffer when acquisition slows down.
- Every cohort experiences a sharp retention drop immediately after the first month, with monthly retention consistently staying below 1% across all cohorts. This pattern most likely reflects the natural buying cycle of durable goods rather than a direct platform failure.
- CRR and RRR move in tandem around the 3% range with no meaningful divergence, and CRR is persistently higher than RRR. This indicates that returning customers tend to transact at lower values than the platform average, which means the platform cannot yet claim to have an expanding revenue base from its existing customers.
- There are no signs of behavioral expansion on either the AOV or frequency dimension. New customer AOV is flat in the R$150–R$170 range, while retained and resurrected AOV averages roughly R$14 lower. Growth in existing customer order volume reflects the natural accumulation of a larger base over time, not an increase in purchase frequency per individual.
- More than half of resurrected customers (54.06%) have already entered the at-risk or churned zone by the end of the observation period. Their return to the platform was most likely driven by natural buying cycles rather than structured retention efforts, leaving the business at risk of losing the same customers a second time without intervention.

---

## Dataset
**Brazilian E-Commerce Public Dataset by Olist**
- Source: [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- Coverage: 2016-2018
- Key tables used: `customers`, `orders`, `order_items`, `order_payments`

---

## Customer Segmentation

Customers are segmented into three groups based on interpurchase behavior:

| Segment | Definition |
|---|---|
| **New Customer** | First-time buyers with no prior transaction history |
| **Retained** | Returning customers within the normal purchase cycle (≤ 122 days) |
| **Resurrected** | Customers who return after an extended period of inactivity (> 122 days) |

---

## Tools & Methods

| Stage | Tool |
|---|---|
| Data Extraction | SQL |
| Exploratory Data Analysis | Python (Pandas, Matplotlib, Seaborn) |
| Analysis & Aggregation | Microsoft Excel |
| Reporting | PDF |

---

## Repository Structure

```
repository/
├── README.md
├── notebooks/
│   └── Olist_Growth_Performance_EDA.ipynb               ← exploratory data analysis
├── sql/
│   └── olist_growth_performance_queries.sql             ← data extraction queries
├── excel/
│   └── olist_growth_performance_analysis.xlxs           ← analysis & aggregation
└── reports/
    └── olist_growth_performance_analysis_report.pdf     ← full analysis report
```

---

## How to Navigate This Repository

1. Start with this README for project context and key findings.
2. Open `notebooks/Olist_Growth_Performance_EDA.ipynb` for a detailed walkthrough of the data exploration process, including missing value handling, distribution analysis, and outlier assessment.
3. Review `sql/olist_growth_performance_queries.sql` to understand how the data was extracted and structured before analysis.
4. Open `excel/olist_growth_performance_analysis.xlsx` to explore the analysis and aggregations that form the basis of the findings. The workbook is organized into separate sheets by business question, covering revenue contribution gap between new and existing customers, cohort decay after the first purchase, revenue retention vs. customer retention, behavioral expansion among existing customers, and structural churn leakage based on purchase inactivity.
5. Read `reports/olist_growth_performance_analysis_report.pdf` for the full analysis and business implications.
