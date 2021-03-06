create database food_manufacturing_company;
drop table manu_comp;

create table manu_comp
(Item_ID int,	
Item_Weight	double,
Item_Fat_Content varchar(100),
Item_Type varchar(100),	
Item_MRP double,
Outlet_Identifier varchar(100),	
Yrs_since_inception	int,
Outlet_Size	varchar(100),
Outlet_Location_Type varchar(100),
Outlet_Type	varchar(100),
sales double,
Number_of_units_sold int
);

/*1.	What is the number of units sold of low fat and regular fat items across various outlet locations?*/
select Outlet_Location_Type, Outlet_Type, Item_Fat_Content, sum(Number_of_units_sold) as total_units
from manu_comp
group by Outlet_Location_Type, Outlet_Type, Item_Fat_Content
order by Outlet_Location_Type, total_units desc;



/*2.	Which Item_Types are most sold among Various Outlets?*/
select Outlet_Type, Outlet_Size, Item_Type, max(Number_of_units_sold) as max_items_sold
from manu_comp
group by Outlet_Type, Outlet_Size
order by Outlet_Type;



/*3.	Percentage of all Item Types sold across all outlet types.*/
/*Grocery Store*/
select temp1.Outlet_Type, temp1.Item_Type, total_units_grouped, total_units, (total_units_grouped*100)/total_units as Percent_of_units_sold
from (select Outlet_Type, Item_Type, sum(Number_of_units_sold) as total_units_grouped
from manu_comp
where Outlet_Type = "Grocery Store"
group by Outlet_Type, Item_Type) as temp1
inner join
(select Outlet_Type, sum(Number_of_units_sold) as total_units
from manu_comp
where Outlet_Type = "Grocery Store"
group by Outlet_Type) as temp2 on temp1.outlet_type = temp2.outlet_type
order by temp1.Outlet_Type, Percent_of_units_sold desc;


/*SuperMarket type1*/
select temp1.Outlet_Type, temp1.Item_Type, total_units_grouped, total_units, (total_units_grouped*100)/total_units as Percent_of_units_sold
from (select Outlet_Type, Item_Type, sum(Number_of_units_sold) as total_units_grouped
from manu_comp
where Outlet_Type = "SuperMarket type1"
group by Outlet_Type, Item_Type) as temp1
inner join
(select Outlet_Type, sum(Number_of_units_sold) as total_units
from manu_comp
where Outlet_Type = "SuperMarket type1"
group by Outlet_Type) as temp2 on temp1.outlet_type = temp2.outlet_type
order by temp1.Outlet_Type, Percent_of_units_sold desc;



/*Supermarket type2*/
select temp1.Outlet_Type, temp1.Item_Type, total_units_grouped, total_units, (total_units_grouped*100)/total_units as Percent_of_units_sold
from (select Outlet_Type, Item_Type, sum(Number_of_units_sold) as total_units_grouped
from manu_comp
where Outlet_Type = "SuperMarket type2"
group by Outlet_Type, Item_Type) as temp1
inner join
(select Outlet_Type, sum(Number_of_units_sold) as total_units
from manu_comp
where Outlet_Type = "SuperMarket type2"
group by Outlet_Type) as temp2 on temp1.outlet_type = temp2.outlet_type
order by temp1.Outlet_Type, Percent_of_units_sold desc;



/*Supermarket Type3*/
select temp1.Outlet_Type, temp1.Item_Type, total_units_grouped, total_units, (total_units_grouped*100)/total_units as Percent_of_units_sold
from (select Outlet_Type, Item_Type, sum(Number_of_units_sold) as total_units_grouped
from manu_comp
where Outlet_Type = "SuperMarket type3"
group by Outlet_Type, Item_Type) as temp1
inner join
(select Outlet_Type, sum(Number_of_units_sold) as total_units
from manu_comp
where Outlet_Type = "SuperMarket type3"
group by Outlet_Type) as temp2 on temp1.outlet_type = temp2.outlet_type
order by temp1.Outlet_Type, Percent_of_units_sold desc;


/*4.	Tier wise Sales distribution among various outlets.*/
select Outlet_Location_Type, Outlet_Type, Outlet_Size, round(sum(sales), 3) as total_Sales 
from manu_comp
group by Outlet_Location_Type, Outlet_Type, Outlet_Size
order by Outlet_Location_Type, total_sales desc;



/*5.	Type and number of outlets according to age location wise.*/
select Outlet_Location_Type, age_of_outlets, count(distinct Outlet_Identifier) as number_of_outlets
from (select Outlet_Location_Type, Yrs_since_inception, Outlet_Identifier,
case when Yrs_since_inception between 1 and 10 then "New" 
when Yrs_since_inception between 11 and 20 then "Older" 
when Yrs_since_inception between 21 and 31 then "Oldest" 
end as age_of_outlets
from manu_comp) as temptable
group by Outlet_Location_Type, age_of_outlets
order by Outlet_Location_Type, age_of_outlets;


/*6.	Which Outlet identifier among each location tiers give highest sales.*/
select Outlet_Location_Type, Outlet_Identifier, Outlet_Type, Outlet_Size, max(sales) as max_sales
from manu_comp
group by Outlet_Location_Type
order by Outlet_Location_Type;


/*7.	Are outlets established in the last 15 years giving sales more than the outlets which were established in more than 15 years?*/
/*Avg Sales of outlets which were established in the last 15 years*/
select avg(sales) as average_sales
from manu_comp
where Yrs_since_inception < 15;

/*Avg Sales of outlets which were established before the last 15 years*/
select avg(sales) as average_sales
from manu_comp
where Yrs_since_inception > 15;


/*8. Average MRP of all products across all outlets in all locations to understand the pricing model*/
/*Tier 1*/
select Outlet_Location_Type, Outlet_Type, Item_Type, round(avg(Item_MRP), 3) as avg_price
from manu_comp
where Outlet_Location_Type = "Tier 1"
group by Outlet_Type, Item_Type
order by Outlet_Location_Type, Outlet_Type;



/*Tier 2*/
select Outlet_Location_Type, Outlet_Type, Item_Type, round(avg(Item_MRP), 3) as avg_price
from manu_comp
where Outlet_Location_Type = "Tier 2"
group by Outlet_Type, Item_Type
order by Outlet_Location_Type, Outlet_Type;


/*Tier 3*/
select Outlet_Location_Type, Outlet_Type, Item_Type, round(avg(Item_MRP), 3) as avg_price
from manu_comp
where Outlet_Location_Type = "Tier 3"
group by Outlet_Type, Item_Type
order by Outlet_Location_Type, Outlet_Type;


/*9.	Location tier wise number of each outlet type in 3 different outlet sizes.*/
select Outlet_Location_Type, Outlet_Type, Outlet_Size, count(distinct Outlet_Identifier) as number_of_outlets
from manu_comp
group by Outlet_Location_Type, Outlet_Type, Outlet_Size
order by Outlet_Location_Type, Outlet_Type;

