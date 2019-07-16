--count the actual unique items each dish appears in and compare with times_appeared
SELECT * FROM (
	SELECT d.*, COUNT(mi.id) AS times_appeared_calc
	FROM Dish d
	INNER JOIN MenuItem mi ON mi.dish_id=d.id
	GROUP BY d.id
)
WHERE times_appeared != times_appeared_calc