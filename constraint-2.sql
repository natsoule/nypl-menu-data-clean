--same dish name, different count, date, or price
SELECT DISTINCT d1.* FROM
Dish d1
INNER JOIN Dish d2 ON d1.name=d2.name
WHERE d1.id!=d2.id OR d1.menus_appeared!=d2.menus_appeared OR d1.times_appeared!=d2.times_appeared 
	OR d1.first_appeared!=d2.first_appeared OR d1.last_appeared!=d2.last_appeared OR d1.lowest_price!=d2.lowest_price