--check for duplicate Ids with different data
SELECT DISTINCT d1.*, d2.* FROM
Dish d1
INNER JOIN Dish d2 ON d1.id=d2.id
WHERE d1.name!=d2.name OR d1.menus_appeared!=d2.menus_appeared OR d1.times_appeared!=d2.times_appeared 
	OR d1.first_appeared!=d2.first_appeared OR d1.last_appeared!=d2.last_appeared OR d1.lowest_price!=d2.lowest_price