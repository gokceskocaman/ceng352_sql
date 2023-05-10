select 
	distinct c.customer_city  
from 
	customers c, 
	orders o, 
	order_payments op 
where 
	c.customer_id = o.customer_id 
	and o.order_id = op.order_id 
	and (not exists  (select * from order_payments op2 
where
	op2.payment_type <> 'voucher' 
	and op.order_id = op2.order_id))