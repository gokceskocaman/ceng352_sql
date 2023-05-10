select 
	p.product_id ,
	count (*) as review_count,
	avg(cast(or2.review_score as float)) as review_avg
from 
	order_reviews or2 ,
	order_items oi ,
	products p 
where 
	or2.order_id = oi .order_id 
	and oi.product_id  = p.product_id 
	and p.product_category_name = 'eletronicos'
group by
	p.product_id 
having
    count (*) >= 5
order by
	review_avg desc, review_count desc
limit 10;