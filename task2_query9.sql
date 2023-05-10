select 
	s.seller_id,
	EXTRACT(MONTH FROM shipping_limit_date) AS month,
	sum( cast(oi.freight_value as float )) as total_freight_value
from 
	order_items oi,
	sellers s
where 
	EXTRACT(year FROM shipping_limit_date) = '2018' and oi.seller_id = s.seller_id 
GROUP BY
    grouping sets(
        (
            s.seller_id,
           	month
        ),
        (
        	s.seller_id
        ),
        (
			month
        ),
        ()
    )
order by 
	seller_id,
	month
