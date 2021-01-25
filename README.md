# Food_Manufacturing_Company_MySQL
Sales Analysis of a Food Manufacturing Company using MySQL Workbench

The objective here is to analyze the dataset of a Food Manufacturing Company with MySQL Workbench and provide suggestions to management to maximize Sales and Customer Engagement at all of its outlets as well as formulate a marketing strategy to inculcate healthy food habits to the customer base.

The final presentation is also uploaded, which provides a visual narrative of the analysis. 

About the dataset:
The given dataset contains information about various items produced by a Food Manufacturing Company and the outlets where they are sold. There are 7072 records and 11 fields. One column labelled 'No_of_units_sold' is feature engineered from dividing 'Sales' by 'Item_MRP'.

The features are explained as follows:
1. Item_ID :-  The individual item Ids of the products.

2. Item_Weight:-  The weight of the item per unit in grams.

3. Item_fat_content:-	The fat content of the individual products.

4. Item_type:- The type of product.

5. Item_MRP:- 	The maximum retail price of the product.

6. Outlet_Identifier:- The unique outlet identifier ID of the outlets.

7. Yrs_since_Inception:- The number of years which have passed since the particular outlet was established.

8. Outlet_size:- The size of the outlet.

9. Outlet_location_type:-	The type of location the outlet is situated in.

10. Outlet_type:- The type of outlet.

11. Sales:- 	The total sales of the item in the particular outlet.

12. Number_of_units_sold:- The number of units sold of a particular item at an outlet.




Insights driven from the dataset:
1. Seafood is the least bought item across all the outlet types, except in supermarket type 3, where it is not sold at all. Surprisingly health and hygiene products are mostly not bought from Supermarket Type 3, whereas from other supermarkets, that's not the case. This is happening because of its size and location, where people are not aware about these products.

2. In tier 1 and 2 locations,  medium sized supermarkets are performing very well. In tier 1 cities, customers are inclining towards supermarkets only rather than grocery stores, because of the demography. In tier 3 locations, sales in big sized supermarkets are the most, maybe because of the pricing model.

3. There are no new outlets in tier 1 locations, which should be focused upon, since people from those locations prefer supermarkets mostly. This can lead to a boost in sales.

4. The outlets which give maximum sales from all the 3 locations are all medium sized supermarkets.

5. The average sales in newer outlets are more than older ones. This can be because of the ambience, facilities, location and pricing model of the newer ones which are more appealing to customers.

6. The price of commodities in supermarkets is more or less same with that of grocery stores in all the 3 locations, which is a part of the pricing strategy of the company, which is to keep the prices competitive.

7. Big sized supermarkets which give the most sales in tier 3 cities are nonexistent in tier 1 cities. This can be a part of the company's marketing strategy which focuses more on the tier 3 cities rather than tier 1 cities.

