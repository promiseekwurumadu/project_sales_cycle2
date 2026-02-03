-- 07_category_profit_loss_customers.sql
-- Purpose: Category profitability for loss-making customers only

with loss_customers as (
  select f.customer_id
  from cycle2_analytics.fact_sales f
  group by f.customer_id
  having sum(f.profit) < 0
)
select
  p.category,
  sum(f.sales)  as revenue,
  sum(f.profit) as profit,
  round(sum(f.profit) / nullif(sum(f.sales), 0) * 100, 2) as margin_pct
from cycle2_analytics.fact_sales f
join loss_customers lc
  on f.customer_id = lc.customer_id
join cycle2_analytics.dim_product p
  on f.product_id = p.product_id
group by p.category
order by profit asc;
