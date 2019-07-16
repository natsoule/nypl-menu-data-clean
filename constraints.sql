--all of the integrity constraints for the NYPL menus dataset

--************Dish table****************

--check for duplicate Ids with different data
SELECT DISTINCT d1.*, d2.* FROM
Dish d1
INNER JOIN Dish d2 ON d1.id=d2.id
WHERE d1.name!=d2.name OR d1.menus_appeared!=d2.menus_appeared OR d1.times_appeared!=d2.times_appeared 
	OR d1.first_appeared!=d2.first_appeared OR d1.last_appeared!=d2.last_appeared OR d1.lowest_price!=d2.lowest_price
    
    
--same dish name, different count, date, or price
SELECT DISTINCT d1.* FROM
Dish d1
INNER JOIN Dish d2 ON d1.name=d2.name
WHERE d1.id!=d2.id OR d1.menus_appeared!=d2.menus_appeared OR d1.times_appeared!=d2.times_appeared 
	OR d1.first_appeared!=d2.first_appeared OR d1.last_appeared!=d2.last_appeared OR d1.lowest_price!=d2.lowest_price
    

--highest price of dish less than lowest price
SELECT * FROM Dish
WHERE highest_price < lowest_price

--last appeared before first appeared
SELECT * FROM Dish
WHERE first_appeared!='' AND last_appeared < first_appeared

--times appeared less than menus appeared
SELECT * FROM Dish
WHERE times_appeared<menus_appeared

--count the actual unique menus each dish appears in and compare with menus_appeared
SELECT * FROM (
	SELECT d.*, COUNT(DISTINCT mp.menu_id) AS menus_appeared_calc
	FROM Dish d
	INNER JOIN MenuItem mi ON mi.dish_id=d.id
	INNER JOIN MenuPage mp ON mp.id=mi.menu_page_id
	GROUP BY d.id
)
WHERE menus_appeared != menus_appeared_calc

--count the actual unique items each dish appears in and compare with times_appeared
SELECT * FROM (
	SELECT d.*, COUNT(mi.id) AS times_appeared_calc
	FROM Dish d
	INNER JOIN MenuItem mi ON mi.dish_id=d.id
	GROUP BY d.id
)
WHERE times_appeared != times_appeared_calc

--a menu date appears before first_appeared date
SELECT DISTINCT d.*, m.id, m.date FROM Dish d
INNER JOIN MenuItem mi
INNER JOIN MenuPage mp
INNER JOIN Menu m
WHERE 
mi.dish_id=d.id AND
mp.id=mi.menu_page_id AND
m.id=mp.menu_id AND
first_appeared!='' AND
m.date!='' AND
CAST(SUBSTR(m.date, 1, 4) AS INT) < d.first_appeared

--a menu date appears after last_appeared date
SELECT DISTINCT d.*, m.id, m.date FROM Dish d
INNER JOIN MenuItem mi
INNER JOIN MenuPage mp
INNER JOIN Menu m
WHERE 
mi.dish_id=d.id AND
mp.id=mi.menu_page_id AND
m.id=mp.menu_id AND
last_appeared!='' AND
m.date!='' AND
CAST(SUBSTR(m.date, 1, 4) AS INT) > d.last_appeared

--a menu item has a price lower than lowest_price
SELECT DISTINCT d.*, mi.id, mi.price
FROM Dish d
INNER JOIN MenuItem mi
WHERE 
mi.dish_id=d.id AND
((mi.price != '' AND mi.price < d.lowest_price) OR (mi.high_price!='' AND mi.high_price < d.lowest_price))

--a menu item has a price higher than highest_price
SELECT DISTINCT d.*, mi.id, mi.price
FROM Dish d
INNER JOIN MenuItem mi
WHERE 
mi.dish_id=d.id AND
((mi.price != '' AND mi.price > d.highest_price) OR (mi.high_price!='' AND mi.high_price > d.highest_price))

--************Menu table****************
--duplicate menu
SELECT m1.*, m2.* AS duplicate_id FROM Menu m1
INNER JOIN Menu m2
WHERE m1.id!=m2.id AND 
m1.sponsor=m2.sponsor AND
m1.event=m2.event AND
m1.venue_1=m2.venue_1 AND
m1.venue_2=m2.venue_2 AND
m1.venue_3=m2.venue_3 AND
m1.venue_4=m2.venue_4 AND
m1.venue_5=m2.venue_5 AND
m1.place=m2.place AND
m1.physical_description_1=m2.physical_description_1 AND
m1.physical_description_2=m2.physical_description_2 AND
m1.physical_description_3=m2.physical_description_3 AND
m1.physical_description_4=m2.physical_description_4 AND
m1.physical_description_5=m2.physical_description_5 AND
m1.physical_description_6=m2.physical_description_6 AND
m1.occassion_1=m2.occassion_1 AND
m1.occassion_2=m2.occassion_2 AND
m1.notes=m2.notes AND
m1.call_number=m2.call_number AND
m1.date=m2.date AND
m1.location=m2.location AND
m1.currency=m2.currency AND
m1.currency_symbol=m2.currency_symbol AND
m1.status=m2.status AND
m1.page_count=m2.page_count AND
m1.dish_count=m2.dish_count

--verify page counts
SELECT * FROM (
	SELECT m.*, COUNT(DISTINCT mp.id) AS page_count_calc
	FROM Menu m
	INNER JOIN MenuPage mp ON m.id=mp.menu_id
	GROUP BY m.id
)
WHERE page_count!=page_count_calc

--verify dish counts
SELECT * FROM (
	SELECT m.*, COUNT(DISTINCT d.id) AS dish_count_calc
	FROM Menu m
	INNER JOIN MenuPage mp ON m.id=mp.menu_id
	INNER JOIN MenuItem mi ON mp.id=mi.menu_page_id
	INNER JOIN Dish d ON d.id=mi.dish_id
	GROUP BY m.id
)
WHERE dish_count!=dish_count_calc

--************MenuPage table****************
--missing menu in Menu table
SELECT * FROM MenuPage mp
LEFT OUTER JOIN Menu m ON mp.menu_id=m.id
WHERE m.ID IS NULL

--************MenuItem table****************
--missing MenuPage in MenuItem table
SELECT * FROM MenuItem mi
LEFT OUTER JOIN MenuPage mp ON mp.id=mi.menu_page_id
WHERE mp.id IS NULL

--missing dish in Dish table
SELECT * FROM MenuItem mi
LEFT OUTER JOIN Dish d ON d.id=mi.dish_id
WHERE d.id IS NULL