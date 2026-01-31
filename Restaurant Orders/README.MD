# Exploratory SQL Analysis Project (Restaurant Database)

## Overview

This project documents an exploratory SQL analysis conducted on a fictional restaurant database. The objective was to practise core SQL skills (filtering, aggregation, joins, CTEs) while developing disciplined analytical thinking: moving from raw data to observations without over‑interpreting results.

This work is intentionally exploratory rather than predictive. The focus is on *process*, *clarity of questions*, and *measured insights* rather than business recommendations.

---

## Dataset Description

The database contains two primary tables:

* **menu_items**: information about dishes offered, including category and price
* **order_details**: transactional order data, including order IDs, item IDs, and order dates

The data covers a limited time window and sample size and is treated as a practice dataset.

---

## Analysis Objectives

The analysis aimed to answer the following high‑level questions:

1. What items and categories exist on the menu?
2. How are prices distributed across categories?
3. What is the date range and volume of orders?
4. How many items do customers typically order?
5. Which menu items and categories appear most frequently in orders?
6. What characterises the highest‑spend orders?

Each SQL query is explicitly framed around a question to ensure intent is clear and traceable.

---

## Key Observations (Exploratory)

* The menu contains a balanced spread of items across several categories.
* Price ranges vary by category, with some clear high‑ and low‑cost items.
* Order volumes span a defined three‑month period.
* A small number of orders contain a disproportionately high number of items.
* Higher‑spend orders show concentration in certain categories.

> **Note:** These observations describe patterns *within this dataset only*. They are not treated as statistically representative or prescriptive.

---

## Key Lessons

* **Count structures, not just values:** Using `COUNT(*)` reinforces thinking in terms of rows and structure, rather than assuming completeness of a specific column.
* **Aggregation trades context for clarity:** Aggregations are powerful for summarisation but inherently remove detail; this trade-off must be understood and handled deliberately.
* **Analyst mindset over answers:** The primary purpose of this project was to practise analytical reasoning — framing questions, choosing appropriate operations, and recognising the limits of conclusions.

---

## Tools & Techniques Used

* SQL (SELECT, WHERE, ORDER BY)
* Aggregations (COUNT, AVG, SUM)
* GROUP BY and HAVING clauses
* JOIN operations
* Common Table Expressions (CTEs)
* Inline comments to link queries directly to analytical questions

---

## Limitations

* Small, fictional dataset
* No customer demographics or time‑of‑day detail
* No validation or hypothesis testing performed

These constraints are accepted intentionally for learning purposes.

---

## Next Steps

Future projects will build on this foundation by gradually introducing more complex analysis:

1. **Time-based analysis:** Explore revenue and order trends by month, day of week, or seasonality.
2. **Granular segmentation:** Analyze order or item performance at multiple levels, e.g., items per category per order.
3. **Pattern and hypothesis testing:** Compare groups or categories to detect patterns and test assumptions, moving beyond simple aggregation.
4. **Critical interpretation:** Apply stricter criteria when drawing conclusions, linking results explicitly to dataset constraints and limitations.

These next steps serve as **incremental learning challenges**, reinforcing SQL skills while building a disciplined analyst mindset.

---
