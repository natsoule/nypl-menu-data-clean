--missing menu in Menu table
SELECT * FROM MenuPage mp
LEFT OUTER JOIN Menu m ON mp.menu_id=m.id
WHERE m.ID IS NULL