--last appeared before first appeared
SELECT * FROM Dish
WHERE first_appeared!='' AND last_appeared < first_appeared