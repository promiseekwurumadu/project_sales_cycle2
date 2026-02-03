-- 09_customer_profitability_with_segment.sql
-- Purpose: Profitability by customer, enriched with name + segment (no double counting)

with cust_profit as (
  select
    f.customer_id,
    sum(f.sales)  as revenue,
    sum(f.profit) as profit
  from cycle2_analytics.fact_sales f
  group by f.customer_id
)
select
  cp.customer_id,
  c.customer_name,
  c.segment,
  cp.revenue,
  cp.profit,
  round(cp.profit / nullif(cp.revenue, 0) * 100, 2) as margin_pct
from cust_profit cp
join cycle2_analytics.dim_customer c
  on cp.customer_id = c.customer_id
order by cp.profit desc;
