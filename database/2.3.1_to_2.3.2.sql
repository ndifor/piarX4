INSERT INTO `PiarX4_app_config` (`key`, `value`) VALUES 
('barcode_content', 'id'),
('barcode_first_row', 'category'),
('barcode_second_row', 'item_code'),
('barcode_third_row', 'cost_price'),
('barcode_num_in_row', '2'),
('company_logo', ''),
('barcode_page_width', '100'),      
('barcode_page_cellspacing', '20'),
('receipt_show_taxes', '0'),
('use_invoice_template', '1'),
('invoice_default_comments', 'This is a default comment'),
('invoice_email_message', 'Dear $CU, In attachment the receipt for sale $CO'),
('print_silently', '1'),
('print_header', '0'),
('print_footer', '0'),
('print_top_margin', '0'),
('print_left_margin', '0'),
('print_bottom_margin', '0'),
('print_right_margin', '0'),
('default_sales_discount', '0'),
('lines_per_page', '25'),
('show_total_discount', '25');

INSERT INTO `PiarX4_permissions` (permission_id, module_id, location_id) 
(SELECT CONCAT('sales_', location_name), 'sales', location_id FROM PiarX4_stock_locations);

INSERT INTO `PiarX4_permissions` (permission_id, module_id, location_id)
(SELECT CONCAT('receivings_', location_name), 'receivings', location_id FROM PiarX4_stock_locations);

-- add item_pic column to items table
ALTER TABLE `PiarX4_items` 
   ADD COLUMN `item_pic` int(10) DEFAULT NULL;

ALTER TABLE `PiarX4_people` 
   ADD COLUMN `gender` int(1) DEFAULT NULL;
   
-- drop redundant payment_type column in sales, add index to sale_time to speed up sorting
ALTER TABLE `PiarX4_sales`
    DROP COLUMN `payment_type`,
    ADD INDEX `sale_time` (`sale_time`);
   
ALTER TABLE `PiarX4_customers`
    ADD COLUMN `company_name` varchar(255) DEFAULT NULL;

ALTER TABLE `PiarX4_giftcards`
    MODIFY `person_id` int(10) DEFAULT NULL;

INSERT INTO `PiarX4_grants` (`permission_id`, `person_id`) VALUES
('sales_stock', 1),
('receivings_stock', 1);

ALTER TABLE `PiarX4_receivings_items`
    ADD COLUMN `receiving_quantity` int(11) NOT NULL DEFAULT '1';
