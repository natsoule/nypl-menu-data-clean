--count the actual unique menus each dish appears in and compare with menus_appeared
SELECT * FROM (
	SELECT d.*, COUNT(DISTINCT mp.menu_id) AS menus_appeared_calc
	FROM Dish d
	INNER JOIN MenuItem mi ON mi.dish_id=d.id
	INNER JOIN MenuPage mp ON mp.id=mi.menu_page_id
	GROUP BY d.id
)
WHERE menus_appeared != menus_appeared_calc
