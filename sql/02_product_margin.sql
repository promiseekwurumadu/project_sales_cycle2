-- 02_product_margin.sql
-- Purpose: Revenue, profit, and margin by product

select
  p.product_name,
  sum(f.sales)  as revenue,
  sum(f.profit) as profit,
  round(sum(f.profit) / nullif(sum(f.sales), 0) * 100, 2) as margin_pct
from cycle2_analytics.fact_sales f
join cycle2_analytics.dim_product p
  on f.product_id = p.product_id
group by p.product_name
order by profit desc;
