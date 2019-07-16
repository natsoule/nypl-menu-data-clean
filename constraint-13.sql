--verify page counts
SELECT * FROM (
	SELECT m.*, COUNT(DISTINCT mp.id) AS page_count_calc
	FROM Menu m
	INNER JOIN MenuPage mp ON m.id=mp.menu_id
	GROUP BY m.id
)
WHERE page_count!=page_count_calc