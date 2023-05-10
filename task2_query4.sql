select  
	s2.seller_id,  
	avg(cast (or3.review_score as int )) as avg_rating , 
	count (or3.review_id)  as  review_count 
from 
	sellers s2, 
	order_items oi2, 
	order_reviews or3 , 
	products p 
where 
	s2.seller_id = oi2.seller_id  
	and oi2.order_id = or3.order_id 
	and s2.seller_city = 'sao paulo' 
	and p.product_id = oi2.product_id 
	and p.product_category_name = 'automotivo'
group by 
	s2.seller_id
having 
	count(or3.review_id) >= 10
order by 
	avg(cast (or3.review_score as int )) desc
limit 5;





