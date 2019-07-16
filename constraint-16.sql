--missing MenuPage in MenuItem table
SELECT * FROM MenuItem mi
LEFT OUTER JOIN MenuPage mp ON mp.id=mi.menu_page_id
WHERE mp.id IS NULL