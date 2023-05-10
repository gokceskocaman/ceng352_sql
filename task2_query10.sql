select 
	p.product_id,
	count (oi.product_id) as total_sales ,
	rank() over (partition by p.product_category_name  order by count (oi.product_id) desc),
	p.product_category_name 
from 
	order_items oi,
	products p 
where 
	oi.product_id = p.product_id
	and p.product_category_name <> ''
group by
	p.product_id,
	p.product_category_name 
having 
	count(*) >= 10
order by 
	p.product_category_name 
