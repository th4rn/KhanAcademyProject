CREATE DATABASE khanacademy;
create table shop (id integer primary key, item text, brand text, colour text, price integer, quantity integer);

select * from shop;
insert into shop (id, item, brand, colour, price, quantity) values (1, "shorts", "Patagonia", "orange", 50, 5);
insert into shop (id, item, brand, colour, price, quantity) values (2, "shorts", "Patagonia", "red", 50, 5);
insert into shop (id, item, brand, colour, price, quantity) values (3, "socks", "Adidas", "white", 10, 500);
insert into shop (id, item, brand, colour, price, quantity) values (4, "shirt", "Uniqlo", "blue", 39, 455);
insert into shop (id, item, brand, colour, price, quantity) values (5, "trousers", "Uniqlo", "navy", 40, 15);
insert into shop (id, item, brand, colour, price, quantity) values (6, "jumper", "Adidas", "grey", 20, 55);
insert into shop (id, item, brand, colour, price, quantity) values (7, "jeans", "Zara", "blue", 40, 5);
insert into shop (id, item, brand, colour, price, quantity) values (8, "tshirt", "New Balance", "white", 20, 105);
insert into shop (id, item, brand, colour, price, quantity) values (9, "tshirt", "New Balance", "yellow", 20, 95);
insert into shop (id, item, brand, colour, price, quantity) values (10, "jacket", "Dickies", "green", 70, 15);
insert into shop (id, item, brand, colour, price, quantity) values (11, "jumper", "Zara", "yellow", 20, 225);
insert into shop (id, item, brand, colour, price, quantity) values (12, "wallet", "Mulberry", "green", 150, 5);
insert into shop (id, item, brand, colour, price, quantity) values (13, "tshirt", "Adidas", "pink", 40, 15);
insert into shop (id, item, brand, colour, price, quantity) values (14, "tshirt", "Ralph Lauren", "White", 50, 1);
insert into shop (id, item, brand, colour, price, quantity) values (15, "jacket", "Napapijri", "navy", 150, 5);
insert into shop (id, item, brand, colour, price, quantity) values (16, "shorts", "Patagonia", "green", 45, 100);

-- Select all items from shop

select * from shop;

-- Select item, brand and price and ordering by brand

select item, brand, price 
from shop 
order by brand;

-- Select average price of items and grouping by brand

select brand, item, avg(price)
from shop
group by brand, item;

-- Select the total value of shop by multiplication of price and quantity for each item

select sum(price * quantity)
as "Total value of shop"
from shop;

-- Select the maximum and minimum price of items in shop for each brand

select brand, max(price), min(price)
from shop 
group by brand;

-- Select the average price of items by colour and number of items of each distinct colour in shop and ordered by descending number of items (by colour)

select avg(price), colour, count(colour)
from shop 
group by colour
order by count(colour) desc;

-- Select the total value of each item from the shop

select (price * quantity)
as "Total value of specifific item", 
brand, item, colour
from shop 
order by (price * quantity) desc;

-- Select the total value of all items from each brand within the shop

select distinct (brand), sum(price*quantity) 
as "total value of brand in shop" 
from shop 
group by brand 
order by sum(price*quantity) desc;

-- Select the average price of all items from Uniqlo in the shop

select brand, avg(price) 
as "Average price of Uniqlo items" 
from shop 
where brand = "Uniqlo";

-- Select the average price of items from each brand and number of items from brand within the shop 

select brand, avg(price), count(item) 
from shop
group by brand 
order by count(item) desc;

-- Select the total number of items within the shop

select sum(quantity)
as "Total number of items in shop" 
from shop;

-- Select all items from shop only where price is greater than £15

select item, brand, price 
from shop 
where price > 15
order by price desc;

-- Select all items from shop where price is greater than £15 and more than 50 of those items are held in shop

select item, brand, price, quantity
from shop
where price > 15
and quantity > 50 
order by quantity desc;

-- Select items from shop only where price is greater than 50 or the item is green

select * from shop 
where price > 50 
or  colour = "green" 
order by quantity desc;

-- Select total quantity of items from shop which are priced at above £50 or are of colour green

select sum(quantity) from
	(select * from shop 
	where price > 50 
	or  colour = "green" 
	order by quantity desc) as subtable;




















