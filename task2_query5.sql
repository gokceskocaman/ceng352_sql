select customer_id , table_a.year , table_b.month , table_a.max_order_for_month 
from (
	SELECT 
    year,
    month,
   max(max_order_for_month)      as max_order_for_month
from (
	SELECT 
    customer_id,
    EXTRACT(YEAR FROM order_purchase_timestamp) AS year,
    EXTRACT(MONTH FROM order_purchase_timestamp) AS month,
   sum(cast (oi.price  as float ))     as max_order_for_month
	from sellers s , order_items oi , orders o , products p 
	where s.seller_id = oi.seller_id and oi.order_id = o.order_id and p.product_id = oi.product_id
	group by o.customer_id, year , month 		

)v
group by  year , month 
order by year, month asc, max_order_for_month desc
) as table_a,
(
	select o.customer_id ,  
		EXTRACT(YEAR FROM order_purchase_timestamp) AS year,
		EXTRACT(MONTH FROM order_purchase_timestamp) AS month,
		 sum(cast (oi.price  as float ))     as max_order_for_month
	from orders o,
          customers c,
          order_items oi
    where o.order_id = oi.order_id and c.customer_id = o.customer_id 
    group by year, month, o.customer_id 
    


) as table_b

where table_a.year = table_b.year
and table_a.month = table_b.month
and table_a.max_order_for_month = table_b.max_order_for_month




