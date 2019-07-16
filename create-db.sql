CREATE TABLE IF NOT EXISTS Dish (
    id PRIMARY KEY, 
    name TEXT, 
    menus_appeared INT, 
    times_appeared INT, 
    first_appeared INT, 
    last_appeared INT, 
    lowest_price DECIMAL(10,2), 
    highest_price DECIMAL(10,2)) WITHOUT ROWID;
    
CREATE INDEX IX_Dish_id ON Dish(id); 
CREATE INDEX IX_Dish_name ON Dish(name); 
    
CREATE TABLE IF NOT EXISTS Menu (
    id PRIMARY KEY, 
    name TEXT, 
    sponsor TEXT, 
    event TEXT,
    venue_1 TEXT, 
    venue_2 TEXT, 
    venue_3 TEXT, 
    venue_4 TEXT, 
    venue_5 TEXT, 
    place TEXT, 
    physical_description_1 TEXT, 
    physical_description_2 TEXT, 
    physical_description_3 TEXT, 
    physical_description_4 TEXT, 
    physical_description_5 TEXT, 
    physical_description_6 TEXT, 
    occassion_1 TEXT, 
    occassion_2 TEXT, 
    notes TEXT, 
    call_number TEXT, 
    date BIGINT, 
    location TEXT, 
    currency TEXT, 
    currency_symbol TEXT, 
    status TEXT, 
    page_count TEXT, 
    dish_count TEXT) WITHOUT ROWID;   
    
CREATE INDEX IX_Menu_id ON Menu(id); 
    

CREATE TABLE IF NOT EXISTS MenuPage (
    id BIGINT,
    menu_id BIGINT,
    page_number INT,
    image_id BIGINT,
    full_height INT, 
    full_width INT,
    uuid TEXT,
    PRIMARY KEY (menu_id, id)) WITHOUT ROWID;
    
CREATE INDEX IX_MenuPage_id_menu_id ON MenuPage(id, menu_id); 
CREATE INDEX IX_MenuPage_menu_id_id ON MenuPage(menu_id, id); 
    
CREATE TABLE IF NOT EXISTS MenuItem (
    id BIGINT,
    menu_page_id BIGINT,
    price NUMERIC,
    high_price NUMERIC,
    dish_id BIGINT,
    created_at BIGINT,
    updated_at BIGINT,
    xpos NUMERIC,
    ypos NUMERIC,
    PRIMARY KEY (menu_page_id, dish_id, id)) WITHOUT ROWID;

CREATE INDEX IX_MenuItem_dish_id_menu_page_id ON MenuItem (dish_id, menu_page_id);
CREATE INDEX IX_MenuItem_menu_page_id_dish_id ON MenuItem (menu_page_id, dish_id);