# project_sales_cycle2
## Profitability & Loss Driver Analysis
### Project Objective

Most sales dashboards focus on revenue and volume, but high sales do not always mean high profit.
The objective of this cycle was to move beyond sales performance and answer:

## Where does the business actually make money — and what is driving hidden losses?

Using a dimensional sales model (fact_sales, dim_product, dim_customer), the project analysed profitability at:

-product level
-category level
-customer level
-discount behaviour level

Data Model Used

-fact_sales — transactional sales, revenue, profit, discount
-dim_product — product name and category
-dim_customer — customer details and segment

This star schema enables scalable business analysis similar to enterprise data warehouses.

## Analysis Workflow & Rationale
1. Identify profit-driving products
Top products were ranked by total profit to understand what truly contributes to business value.
Why: High sales alone can be misleading without profit context.

2. Evaluate product-level margins

Revenue, profit, and margin were calculated per product.
Why: To detect high-volume but low-margin products that reduce profitability.

3. Strategic category performance

Profitability was aggregated by category:

-Category	Revenue	Profit	Margin
-Technology	£836k	£145k	17.40%
-Office Supplies	£719k	£122k	17.04%
-Furniture	£742k	£18k	2.49%

## Insight:
Furniture generates strong revenue but extremely weak margins.

4. Detect loss-making products
294 products were found to have negative total profit, heavily concentrated in the Furniture category.
Why: To identify SKUs that actively destroy business value.

5. Analyse customer profitability
Customer-level profit aggregation revealed:

- 155 loss-making customers
- Total loss: £71,224
Why: Losses are often driven by pricing or discount behaviour, not just products.

6. Loss customer behaviour by category
When analysing only loss customers:
All categories became unprofitable, including Technology and Office Supplies.

## Insight:
The business is generally healthy, but a subset of customers collapses margins across all product categories.

7. Root cause analysis — discount impact

Profitability was segmented by discount bands to assess margin erosion.

## Finding:
Higher discount levels consistently pushed margins into negative territory, explaining customer-driven losses.

## Key Business Insights

-Technology is the main profit engine of the business
-Office Supplies is healthy overall
-Furniture suffers from structurally weak margins
-Losses are concentrated in:

specific low-performing products
a small group of high-discount customers
Heavy discounting is the primary driver of margin collapse

## Business Recommendations

-Review and rationalise loss-making Furniture SKUs
-Introduce discount thresholds to protect margins
-Reprice low-margin products with high volume
-Monitor customer profitability as a core KPI
-Focus growth on high-margin categories and customers

## Tools & Techniques

-SQL (profit, margin, cohort-style aggregations)
-Dimensional data modelling (star schema)
- SQL (PostgreSQL)
- Python (Jupyter for validation & exports)
-Profitability and root-cause analysis
-Reproducible outputs (CSV + notebooks)

## Project Structure
```
project_sales_cycle2/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│   ├── 01_eda.ipynb
│   └── 02_profitability.ipynb
│
├── sql/
│   ├── 01_top_profit_products.sql
│   ├── 02_product_margin.sql
│   ├── 03_category_margin.sql
│   ├── 04_loss_products.sql
│   ├── 05_loss_products_by_category.sql
│   ├── 06_loss_customers.sql
│   ├── 07_category_profit_loss_customers.sql
│   └── 08_discount_band_margin.sql
│
├── README.md
├── requirements.txt
└── .gitignore
```

---



## Outcome

This cycle transforms raw sales data into actionable profitability intelligence, demonstrating how analytics supports pricing strategy, product optimisation, and customer management in real business environments.
