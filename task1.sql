create table if not exists product_category(
	product_category_name char(32),
	product_category_name_english char(32)
);


create table if not exists customers(
	customer_id char(32) PRIMARY KEY,
	customer_unique_id char(32) ,
	customer_zip_code_prefix char(32),
	customer_city char(32),
	customer_state char(32)
);

create table if not exists orders(
	order_id char(32) primary key,
	customer_id char(32),
	order_status char(32),
	order_purchase_timestamp  timestamp,
	order_approved_at timestamp,
	order_delivered_carrier_date timestamp,
	order_delivered_customer_date timestamp,
	order_estimated_delivery_date timestamp,
	foreign key("customer_id") references customers("customer_id")
	);

create table  if not exists geolocation(
	geolocation_zip_code_prefix char(32),
	geolocation_lat char(32),
	geolocation_lng char(32),
	geolocation_city char(32),
	geolocation_state char(32)
);

create table if not exists  order_payments(
	order_id char(32),
	payment_sequential char(32),
	payment_type char(32),
	payment_installments char(32),
	payment_value char(32),
	foreign key("order_id") references orders("order_id")
);	

create table  if not exists  products(
	product_id char(64) PRIMARY KEY,
	product_category_name char(64),
	product_name_length char(64),
	product_description_length char(64),
	product_photos_qty char(64),
	product_weight_g char(64),
	product_length_cm char(64),
	product_height_cm char(64),
	product_width_cm char(64)
) ;

create table  if not exists  orders(
	order_id char(32) primary key,
	customer_id char(32) ,
	order_status char(32) ,
	order_purchase_timestamp timestamp,
	order_approved_at timestamp,
	order_delivered_carrier_date timestamp,
	order_delivered_customer_date timestamp,
	order_estimated_delivery_date timestamp,
	foreign key("customer_id") references customers("customer_id")
);

create table  if not exists sellers(
	seller_id char(32) primary key,
	seller_zip_code_prefix char(32),
	seller_city char(32),
	seller_state char(32)
);

create table  if not exists  order_items(
	order_id char(32),
	order_item_id char(32) primary key,
	product_id char(32),
	seller_id char(32),
	shipping_limit_date timestamp ,
	price char(32),
	freight_value char(32),
	foreign key("order_id") references orders("order_id"),
	foreign key("product_id") references products("product_id"),
	foreign key("seller_id") references sellers("seller_id")
);









create table  if not exists  order_reviews(
	review_id char(32) PRIMARY key,
	order_id char(32),
	review_score char(32),
	review_comment_title char(32),
	review_comment_message char(32),
	review_creation_date timestamp,
	review_answer_timestamp timestamp,
	foreign key("order_id") references orders("order_id")
);



