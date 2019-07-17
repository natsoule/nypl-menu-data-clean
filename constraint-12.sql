--duplicate menu
SELECT DISTINCT m1.* FROM Menu m1
INNER JOIN Menu m2
WHERE m1.id!=m2.id AND 
m1.sponsor=m2.sponsor AND
m1.event=m2.event AND
m1.venue_1=m2.venue_1 AND
m1.venue_2=m2.venue_2 AND
m1.venue_3=m2.venue_3 AND
m1.venue_4=m2.venue_4 AND
m1.venue_5=m2.venue_5 AND
m1.place=m2.place AND
m1.physical_description_1=m2.physical_description_1 AND
m1.physical_description_2=m2.physical_description_2 AND
m1.physical_description_3=m2.physical_description_3 AND
m1.physical_description_4=m2.physical_description_4 AND
m1.physical_description_5=m2.physical_description_5 AND
m1.physical_description_6=m2.physical_description_6 AND
m1.occassion_1=m2.occassion_1 AND
m1.occassion_2=m2.occassion_2 AND
m1.notes=m2.notes AND
m1.call_number=m2.call_number AND
m1.date=m2.date AND
m1.location=m2.location AND
m1.currency=m2.currency AND
m1.currency_symbol=m2.currency_symbol AND
m1.status=m2.status AND
m1.page_count=m2.page_count AND
m1.dish_count=m2.dish_count