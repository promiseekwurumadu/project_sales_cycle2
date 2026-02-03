-- 06_loss_customers.sql
-- Purpose: Identify customers that lose money overall

select
  f.customer_id,
  sum(f.sales)  as revenue,
  sum(f.profit) as profit,
  round(sum(f.profit) / nullif(sum(f.sales), 0) * 100, 2) as margin_pct
from cycle2_analytics.fact_sales f
group by f.customer_id
having sum(f.profit) < 0
order by profit asc;
