select 
	s.seller_id , 
	sum(CAST(oi.price AS float)) as total_earned
from 
	sellers s,
	order_items oi ,
	orders o 
where 
	s.seller_id = oi.seller_id 
	and oi.order_id  = o.order_id 
	and o.order_purchase_timestamp <= '2018-04-01'   
	and o.order_purchase_timestamp  >= '2018-01-01' 
	and s.seller_id in (
		select s2.seller_id 
		from sellers s2,
			order_items oi2,
			orders o2 
		where s2.seller_id = oi2.seller_id 
			and oi2.order_id = o2.order_id
			and o2.order_purchase_timestamp >= '2018-01-01'
			and o2.order_purchase_timestamp < '2018-02-01'
		group by 
			s2.seller_id 
		having 
			count(*) >= 50
			)
	and s.seller_id in (
		select s2.seller_id 
		from sellers s2,
			order_items oi2,
			orders o2 
		where s2.seller_id = oi2.seller_id 
			and oi2.order_id = o2.order_id
			and o2.order_purchase_timestamp >= '2018-02-01'
			and o2.order_purchase_timestamp < '2018-03-01'
		group by 
			s2.seller_id 
		having 
			count(*) >= 50
			)
	and s.seller_id in (
		select s2.seller_id 
		from sellers s2,
			order_items oi2,
			orders o2 
		where s2.seller_id = oi2.seller_id 
			and oi2.order_id = o2.order_id
			and o2.order_purchase_timestamp >= '2018-03-01'
			and o2.order_purchase_timestamp < '2018-04-01'
		group by 
			s2.seller_id 
		having 
			count(*) >= 50
			)
	
group by 
	s.seller_id 
order by
	total_earned desc 

