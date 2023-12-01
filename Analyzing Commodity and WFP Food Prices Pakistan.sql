
select * 
from commodity;
select *
from wfp_food_prices_pakistan;

#1 Select dates and commodities for cities Quetta, Karachi, and Peshawar where price was less than or equal 50 PKR
select date, cmname, mktname
from wfp_food_prices_pakistan
where mktname in ('Quetta', 'Karachi', 'Peshawar')
and price <= 50;

#2 Query to check number of observations against each market/city in PK

select mktname,
COUNT(*) as num_observations,
COUNT(DISTINCT mktname) as num_cities
FROM wfp_food_prices_pakistan
where country = 'Pakistan'
GROUP BY mktname

#3 Show number of distinct cities

select count(distinct mktname) as num_cities
FROM wfp_food_prices_pakistan

#4 List down/show the names of cities in the table

select mktname
from wfp_food_prices_pakistan

#5 List down/show the names of cities in the table

select cmname
from wfp_food_prices_pakistan

#6 List Average Prices for Wheat flour - Retail in EACH city separately over the entire period.

select mktname,
round(avg(price)) as average_price
from wfp_food_prices_pakistan
where cmname = 'Wheat flour - Retail'
Group by mktname;

#7 Calculate summary stats (avg price, max price) for each city separately for all cities except Karachi and sort alphabetically the
city names, commodity names where commodity is Wheat (does not matter which one) with separate rows for each commodity

select mktname, cmname,
round(avg(price)) as average_price, max(price) as max_price
from wfp_food_prices_pakistan
where mktname = 'Karachi' and cmname = 'Wheat flour - Retail'
group by mktname, cmname
order by mktname Asc;

#8 Calculate Avg_prices for each city for Wheat Retail and show only
those avg_prices which are less than 30

select mktname,
round(avg(price)) as average_price
from wfp_food_prices_pakistan
where cmname = 'Wheat flour - Retail'
group by mktname
having avg(price) <30

#9 Prepare a table where you categorize prices based on a logic (price) &lt; 30 is LOW, price &gt; 250 is HIGH, in between are FAIR)

select price,
case
    when price < 30 then 'LOW'
    when price > 250 then 'HIGH'
    else 'FAIR'
  End as category
from wfp_food_prices_pakistan

#10 Create a query showing date, cmname, category, city, price,
city_category where Logic for city category is: Karachi and Lahore
are &#39;Big City&#39;, Multan and Peshawar are &#39;Medium-sized city&#39;, Quetta
is &#39;Small City&#39;

select date, cmname, category, mktname, price,
case
  when mktname in ('Karachi', 'Lahore') then 'Big City'
  when mktname in ('Multan', 'Peshawar') then 'Medium-sized City'
  when mktname = 'Quetta' then 'Small City'
  else 'Unknown'
End as city_category
from wfp_food_prices_pakistan

#11 Create a query to show date, cmname, city, price. Create new column price_fairness through CASE showing price is fair if less than 100, unfair if more than or equal to 100, if &gt; 300 then &#39;Speculative&#39;

select date, cmname, category, mktname, price,
case
  when price < 100 then 'Fair'
  when price >= 100 and price <= 300 then 'Unfair'
  when price > 300 then 'Speculative'  
    else 'Unknown'
  End as price_fairness
from wfp_food_prices_pakistan

#12 Join the food prices and commodities table with a left join.

select *
from wfp_food_prices_pakistan
left join commodity on wfp_food_prices_pakistan. cmname = commodity.cmname;

#13 Join the food prices and commodities table with an inner join

select *
from wfp_food_prices_pakistan
inner join commodity on wfp_food_prices_pakistan. cmname = commodity. cmname;