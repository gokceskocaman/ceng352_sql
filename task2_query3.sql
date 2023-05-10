select 
	distinct p.product_category_name , 
	count (*) as late_delivery_count
from 
	customers c , 
	order_items oi , 
	orders o , 
	products p 
where c.customer_id  = o.customer_id 
	and oi.order_id = o.order_id 
	and p.product_id = oi.product_id  
	and c.customer_city  = 'rio de janeiro' 
	and o.order_purchase_timestamp  <= '2018-09-01' 
	and o.order_purchase_timestamp  >= '2018-06-01' 
	and o.order_estimated_delivery_date < o.order_delivered_customer_date 
group by 
	p.product_category_name 
order by 
	count(*) desc , 
	p.product_category_name asc

