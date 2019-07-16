import csv, sqlite3, os, os.path

if __name__ == "__main__":
    conn = sqlite3.connect("db.sqlite", isolation_level=None)
    curs = conn.cursor()
    ddl = open("create-db.sql", 'r').read()
    curs.executescript(ddl)
    
    curs.execute('BEGIN')
    
    print('Loading dish_clean.csv')
    reader = csv.reader(open('dish_clean.csv', 'r'))
    next(reader)
    for row in reader:
        to_db = [row[0], row[3], row[4], row[5], row[7], row[9], row[10], row[11]]
        curs.execute("INSERT INTO Dish (id, name, menus_appeared, times_appeared, first_appeared, last_appeared, lowest_price, highest_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?);", to_db)
    
    print('Loading menu_clean.csv')    
    reader = csv.reader(open('menu_clean.csv', 'r'))
    next(reader)
    for row in reader:
        to_db = [row[0], row[1], row[6], row[11], row[15], row[16], row[17], row[18], row[19], row[25], row[28], row[29], row[30], row[31], row[32], row[33], row[39], row[40], row[41], row[42], row[43], row[48], row[50], row[51], row[52], row[53], row[54]]
        curs.execute("INSERT INTO Menu (id, name, sponsor, event, venue_1, venue_2, venue_3, venue_4, venue_5, place, physical_description_1, physical_description_2, physical_description_3, physical_description_4, physical_description_5, physical_description_6, occassion_1, occassion_2, notes, call_number, date, location, currency, currency_symbol, status, page_count, dish_count) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);", to_db)
    
    print('Loading menupage_clean.csv')             
    reader = csv.reader(open('menupage_clean.csv', 'r'))
    next(reader)
    for row in reader:
        to_db = [row[0], row[1], row[2], row[3], row[4], row[5], row[6]]
        curs.execute("INSERT INTO MenuPage (id, menu_id, page_number, image_id, full_height, full_width, uuid) VALUES (?, ?, ?, ?, ?, ?, ?);", to_db) 
    
      
    print('Loading menuitem_clean.csv')         
    reader = csv.reader(open('menuitem_clean.csv', 'r'))
    next(reader)
    for row in reader:
        to_db = [row[0], row[1], row[2], row[3], row[4], row[6], row[8], row[9], row[10]]
        curs.execute("INSERT INTO MenuItem (id, menu_page_id, price, high_price, dish_id, created_at, updated_at, xpos, ypos) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", to_db)
    
    curs.execute('COMMIT')
    
    conn.commit()