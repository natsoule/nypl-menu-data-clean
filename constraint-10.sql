--a menu item has a price lower than lowest_price
SELECT DISTINCT d.*, mi.id, mi.price
FROM Dish d
INNER JOIN MenuItem mi
WHERE 
mi.dish_id=d.id AND
((mi.price != '' AND mi.price < d.lowest_price) OR (mi.high_price!='' AND mi.high_price < d.lowest_price))