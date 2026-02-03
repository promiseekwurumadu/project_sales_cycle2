-- 08_discount_band_margin.sql
-- Purpose: Diagnose whether discounting drives margin collapse

select
  case
    when f.discount is null then 'unknown'
    when f.discount = 0 then '0%'
    when f.discount <= 0.10 then '0–10%'
    when f.discount <= 0.20 then '10–20%'
    when f.discount <= 0.30 then '20–30%'
    when f.discount <= 0.40 then '30–40%'
    else '40%+'
  end as discount_band,
  count(*) as order_lines,
  sum(f.sales)  as revenue,
  sum(f.profit) as profit,
  round(sum(f.profit) / nullif(sum(f.sales), 0) * 100, 2) as margin_pct
from cycle2_analytics.fact_sales f
group by 1
order by 1;
