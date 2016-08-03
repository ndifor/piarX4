ALTER TABLE `PiarX4_suppliers`
   ADD COLUMN `agency_name` VARCHAR(255) NOT NULL;

INSERT INTO `PiarX4_app_config` (`key`, `value`) VALUES
   ('dateformat', 'm/d/Y'),
   ('timeformat', 'H:i:s'),
   ('barcode_generate_if_empty', '0');

ALTER TABLE `PiarX4_sales_suspended`
    DROP KEY `invoice_number`;

-- Clear out emptied comments (0 inserted in comment if empty #192)
UPDATE `PiarX4_sales` SET comment = NULL WHERE comment = '0';
UPDATE `PiarX4_receivings` SET comment = NULL WHERE comment = '0';
UPDATE `PiarX4_sales_suspended` SET comment = NULL WHERE comment = '0';