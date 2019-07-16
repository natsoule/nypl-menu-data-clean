--missing dish in Dish table
SELECT * FROM MenuItem mi
LEFT OUTER JOIN Dish d ON d.id=mi.dish_id
WHERE d.id IS NULL