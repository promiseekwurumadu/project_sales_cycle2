-- 01_top_profit_products.sql
-- Purpose: Identify the most profitable products

select
  p.product_name,
  sum(f.profit) as profit
from cycle2_analytics.fact_sales f
join cycle2_analytics.dim_product p
  on f.product_id = p.product_id
group by p.product_name
order by profit desc
limit 10;
