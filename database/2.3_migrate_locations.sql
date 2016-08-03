INSERT INTO PiarX4_stock_locations (location_name) (SELECT location FROM PiarX4_items WHERE NOT EXISTS (select location from PiarX4_stock_locations where location_name = location));
INSERT INTO PiarX4_item_quantities (item_id, location_id, quantity) (SELECT item_id, location_id, quantity FROM PiarX4_items, PiarX4_stock_locations where PiarX4_items.location = PiarX4_stock_locations.location_name);
