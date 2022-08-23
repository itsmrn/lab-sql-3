-- LAB SQL 3
-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
-- How many movies were released with "PG-13" rating?
-- Get 10 the longest movies from 2006.
-- How many days has been the company operating (check DATEDIFF() function)?
-- Show rental info with additional columns month and weekday. Get 20.
-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
-- How many rentals were in the last month of activity? 


use sakila;
select * from actor;

-- How many distinct (different) actors' last names are there?
select * from actor;
select distinct count(last_name) from actor;

-- How many movies were released with "PG-13" rating?
select * from film;
select count(rating) from film where rating = "PG-13";

-- Get 10 the longest movies from 2006.
select * from film;
select title, length, release_year from film where release_year = 2006 order by length desc limit 10;

-- How many days has been the company operating (check DATEDIFF() function)? -- ????
select * from rental; -- rental date starts 
select DATEDIFF(day, rental_date,last_update) from rental;
select max(last_update) - min(rental_date) from rental;

-- Show rental info with additional columns month and weekday. Get 20.
select * from rental;
select *,date_format(convert(rental_date,date),"%M") as month, date_format(convert(rental_date,date),"%w") as weekday from rental limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select * from rental;
select *,date_format(convert(rental_date,date),"%M") as month, date_format(convert(rental_date,date),"%w") as weekday,
case
when date_format(convert(rental_date,date),"%w") <= 4 then "workday" -- weekday function returns values for days of the week b/ween 0-6, meaning 0 = Monday and so on.
when date_format(convert(rental_date,date),"%w") > 4 then "weekend"
end as day_type
from rental;

-- How many rentals were in the last month of activity? -- ???? 
select * from rental;
select count(rental_id) from rental where rental_date is between ;

-- select count(rental_id) from rental where (max(date_format(convert(rental_date,date),"%M"))= date_format(convert(rental_date,date),"%M"));
