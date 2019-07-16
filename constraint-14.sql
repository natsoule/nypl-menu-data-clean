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