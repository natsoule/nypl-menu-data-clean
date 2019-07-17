--a menu date appears after last_appeared date
SELECT id, name, menus_appeared, times_appeared, first_appeared, last_appeared, 
	lowest_price, highest_price, MAX(year_calc) AS last_appeared_calc FROM (
	SELECT DISTINCT d.*, m.id AS menu_id, CAST(SUBSTR(m.date, 1, 4) AS INT) AS year_calc 
	FROM Dish d
	INNER JOIN MenuItem mi
	INNER JOIN MenuPage mp
	INNER JOIN Menu m
	WHERE 
	mi.dish_id=d.id AND
	mp.id=mi.menu_page_id AND
	m.id=mp.menu_id AND
	last_appeared!='' AND
	m.date!=''
) 
GROUP BY id
HAVING last_appeared < last_appeared_calc