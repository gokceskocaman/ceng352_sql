select 
	p.product_category_name,
	count (*) as past_order_count
FROM
    products p,
    order_items oi,
    orders o,
    customers c
where
	p.product_id = oi.product_id
	and c.customer_city = 'sao paulo'
    and oi.order_id = o.order_id
    and o.customer_id = c.customer_id
    and p.product_category_name not in (
    	select 
    		p2.product_category_name
    	from 
    		products p2,
    		order_items oi2,
    		orders o2,
    		customers c2,
    		sellers s
    	where 
    		p2.product_id = oi2.product_id
    		and o2.customer_id = c2.customer_id
    		and oi2.order_id = o2.order_id
    		and s.seller_id = oi2.seller_id
     		and s.seller_city  = 'sao paulo'  	
    	)
  group by 
  	p.product_category_name 
  having 	
  	count (*) >= 10
  order by 	
  	p.product_category_name 