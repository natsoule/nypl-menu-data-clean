--a menu date appears before first_appeared date
SELECT id, name, menus_appeared, times_appeared, first_appeared, last_appeared, 
	lowest_price, highest_price, MIN(year_calc) AS first_appeared_calc FROM (
	SELECT DISTINCT d.*, m.id AS menu_id, CAST(SUBSTR(m.date, 1, 4) AS INT) AS year_calc 
	FROM Dish d
	INNER JOIN MenuItem mi
	INNER JOIN MenuPage mp
	INNER JOIN Menu m
	WHERE 
	mi.dish_id=d.id AND
	mp.id=mi.menu_page_id AND
	m.id=mp.menu_id AND
	first_appeared!='' AND
	m.date!=''
) 
GROUP BY id
HAVING first_appeared > first_appeared_calc