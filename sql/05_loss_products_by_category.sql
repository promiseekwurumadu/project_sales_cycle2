-- 05_loss_products_by_category.sql
-- Purpose: Count loss-making products and total loss per category

select
  category,
  count(*) as loss_products,
  sum(profit) as total_loss
from (
    select
      p.category,
      p.product_name,
      sum(f.profit) as profit
    from cycle2_analytics.fact_sales f
    join cycle2_analytics.dim_product p
      on f.product_id = p.product_id
    group by p.category, p.product_name
    having sum(f.profit) < 0
) t
group by category
order by total_loss asc;
