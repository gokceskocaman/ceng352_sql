SELECT 
	s.seller_id, 
	AVG(o.order_delivered_carrier_date  - o.order_purchase_timestamp) AS avg_duration
FROM 
	sellers s, 
	products p, 
	order_items oi, 
	orders o
WHERE 
	p.product_category_name = 'beleza_saude' 
	AND s.seller_city = 'curitiba' 
	and (p.product_id = oi.product_id 
	and oi.seller_id = s.seller_id 
	and o.order_id = oi.order_id)
GROUP BY 
	s.seller_id
HAVING 
	AVG( o.order_delivered_carrier_date - o.order_purchase_timestamp) <= '2 days'
ORDER BY 
	avg_duration DESC;