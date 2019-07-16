--a menu date appears after last_appeared date
SELECT DISTINCT d.*, m.id, m.date FROM Dish d
INNER JOIN MenuItem mi
INNER JOIN MenuPage mp
INNER JOIN Menu m
WHERE 
mi.dish_id=d.id AND
mp.id=mi.menu_page_id AND
m.id=mp.menu_id AND
last_appeared!='' AND
m.date!='' AND
CAST(SUBSTR(m.date, 1, 4) AS INT) > d.last_appeared