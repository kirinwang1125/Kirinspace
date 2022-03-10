

-- DQL Tasks

-- 1) How many orders were received for products with a category_id = 2
select count(id) from orders where category_id = 2

-- 2) How many orders were received with a category_id of either 2, 4, or 5
select count(id) from orders where category_id in (2,4,5)

-- 3) How many order are there with a price over £35.00 
select count(id) from orders where price > 35

-- 4) How many orders are there where the customer has a date of birth before 1st January 1980 and want to receive the newsletter
select count(id) from orders where (date_of_birth < 1980-01-01 and newsletter = 1)

-- 5)  How many customers named Davenport placed orders?
select count(id) from orders where customer_surname = 'Davenport'

-- 6) Which customer with a firstname starting with 'Br', had the most orders
select * from orders where customer_firstname like 'Br%'

-- 7) List all orders with products from category 3 by order of price, highest first.
select * from orders where category_id = 3 order by price desc

-- 8) Select the following fields from all orders (trans_date, price, promo_code) renaming the colum (field) headings ('Transaction Date', 'Price' & 'Promotion Code')
select trans_date as 'Transaction Date',
price as 'Price',
promo_code as 'Promotion Code'
from orders 

-- 9) Select the following fields (customer_surname, customer_firstname, county) from all orders, with customer names in a single field named 'Customer Name' and in the format <Surname>, <Firstname>, with surname capitalised.  The county field is to be renamed 'County'.
select concat(concat(upper(customer_surname),','), customer_firstname) as 'Customer Name',
county as 'County'
from orders

-- 10)	Select the average price, minimum price & maximum price for each category.
select c.category_name, 
avg(o.price) as 'AVG price', 
min(o.price) as 'MIN price',
max(o.price) as 'MAX price'
from `orders` o left join `categories` c
on (o.category_id = c.id)
group by c.category_name


-- 11) 	Select the category_name (labelled 'Category', number of sales (labelled 'Total Orders') & total sales (labelled 'Total Sales') for each category.
select c.category_name as 'Category',
count(product_id) as 'Total Orders',
sum(o.price) as 'Total Sales'
from `orders` o left join `categories` c
on (o.category_id = c.id)
group by category_name 


-- 12) 	List all orders with the following fields (with the labls given) orders.trans_date('Transaction Date'), categories.category_name('Category'), orders.customer_surname('Surname'), orders.customer_firstname('Firstname'), orders.price('Order Price'), categories.category_name('Category'), promotions.discount('Discounted by') 
select o.trans_date as 'Transaction Date',
c.category_name as 'Category',
o.customer_surname as 'Surname',
o.customer_firstname as 'Firstname',
o.price as 'Order Price',
p.discount as 'Discounted by'
from (`orders` o left join `categories` c on o.category_id = c.id)
 left join `promotions` p on o.promo_code = p.code




