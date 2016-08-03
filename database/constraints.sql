--
-- Constraints for dumped tables
--

--
-- Constraints for table `PiarX4_customers`
--
ALTER TABLE `PiarX4_customers`
  ADD CONSTRAINT `PiarX4_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `PiarX4_people` (`person_id`);

--
-- Constraints for table `PiarX4_employees`
--
ALTER TABLE `PiarX4_employees`
  ADD CONSTRAINT `PiarX4_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `PiarX4_people` (`person_id`);

--
-- Constraints for table `PiarX4_inventory`
--
ALTER TABLE `PiarX4_inventory`
  ADD CONSTRAINT `PiarX4_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `PiarX4_items` (`item_id`),
  ADD CONSTRAINT `PiarX4_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `PiarX4_employees` (`person_id`),
  ADD CONSTRAINT `PiarX4_inventory_ibfk_3` FOREIGN KEY (`trans_location`) REFERENCES `PiarX4_stock_locations` (`location_id`);

--
-- Constraints for table `PiarX4_items`
--
ALTER TABLE `PiarX4_items`
  ADD CONSTRAINT `PiarX4_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `PiarX4_suppliers` (`person_id`);

--
-- Constraints for table `PiarX4_items_taxes`
--
ALTER TABLE `PiarX4_items_taxes`
  ADD CONSTRAINT `PiarX4_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `PiarX4_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `PiarX4_item_kit_items`
--
ALTER TABLE `PiarX4_item_kit_items`
  ADD CONSTRAINT `PiarX4_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `PiarX4_item_kits` (`item_kit_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PiarX4_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `PiarX4_items` (`item_id`)  ON DELETE CASCADE;

--
-- Constraints for table `PiarX4_permissions`
--
ALTER TABLE `PiarX4_permissions`
  ADD CONSTRAINT `PiarX4_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `PiarX4_modules` (`module_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PiarX4_permissions_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `PiarX4_stock_locations` (`location_id`) ON DELETE CASCADE;

--
-- Constraints for table `PiarX4_grants`
--
ALTER TABLE `PiarX4_grants`
  ADD CONSTRAINT `PiarX4_grants_ibfk_1` foreign key (`permission_id`) references `PiarX4_permissions` (`permission_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PiarX4_grants_ibfk_2` foreign key (`person_id`) references `PiarX4_employees` (`person_id`) ON DELETE CASCADE;

--
-- Constraints for table `PiarX4_receivings`
--
ALTER TABLE `PiarX4_receivings`
  ADD CONSTRAINT `PiarX4_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `PiarX4_employees` (`person_id`),
  ADD CONSTRAINT `PiarX4_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `PiarX4_suppliers` (`person_id`);

--
-- Constraints for table `PiarX4_receivings_items`
--
ALTER TABLE `PiarX4_receivings_items`
  ADD CONSTRAINT `PiarX4_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `PiarX4_items` (`item_id`),
  ADD CONSTRAINT `PiarX4_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `PiarX4_receivings` (`receiving_id`);

--
-- Constraints for table `PiarX4_sales`
--
ALTER TABLE `PiarX4_sales`
  ADD CONSTRAINT `PiarX4_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `PiarX4_employees` (`person_id`),
  ADD CONSTRAINT `PiarX4_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `PiarX4_customers` (`person_id`);

--
-- Constraints for table `PiarX4_sales_items`
--
ALTER TABLE `PiarX4_sales_items`
  ADD CONSTRAINT `PiarX4_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `PiarX4_items` (`item_id`),
  ADD CONSTRAINT `PiarX4_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `PiarX4_sales` (`sale_id`),
  ADD CONSTRAINT `PiarX4_sales_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `PiarX4_stock_locations` (`location_id`);

--
-- Constraints for table `PiarX4_sales_items_taxes`
--
ALTER TABLE `PiarX4_sales_items_taxes`
  ADD CONSTRAINT `PiarX4_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `PiarX4_sales_items` (`sale_id`),
  ADD CONSTRAINT `PiarX4_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `PiarX4_items` (`item_id`);

--
-- Constraints for table `PiarX4_sales_payments`
--
ALTER TABLE `PiarX4_sales_payments`
  ADD CONSTRAINT `PiarX4_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `PiarX4_sales` (`sale_id`);

--
-- Constraints for table `PiarX4_sales_suspended`
--
ALTER TABLE `PiarX4_sales_suspended`
  ADD CONSTRAINT `PiarX4_sales_suspended_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `PiarX4_employees` (`person_id`),
  ADD CONSTRAINT `PiarX4_sales_suspended_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `PiarX4_customers` (`person_id`);

--
-- Constraints for table `PiarX4_sales_suspended_items`
--
ALTER TABLE `PiarX4_sales_suspended_items`
  ADD CONSTRAINT `PiarX4_sales_suspended_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `PiarX4_items` (`item_id`),
  ADD CONSTRAINT `PiarX4_sales_suspended_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `PiarX4_sales_suspended` (`sale_id`),
  ADD CONSTRAINT `PiarX4_sales_suspended_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `PiarX4_stock_locations` (`location_id`);

--
-- Constraints for table `PiarX4_sales_suspended_items_taxes`
--
ALTER TABLE `PiarX4_sales_suspended_items_taxes`
  ADD CONSTRAINT `PiarX4_sales_suspended_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `PiarX4_sales_suspended_items` (`sale_id`),
  ADD CONSTRAINT `PiarX4_sales_suspended_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `PiarX4_items` (`item_id`);

--
-- Constraints for table `PiarX4_sales_suspended_payments`
--
ALTER TABLE `PiarX4_sales_suspended_payments`
  ADD CONSTRAINT `PiarX4_sales_suspended_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `PiarX4_sales_suspended` (`sale_id`);

--
-- Constraints for table `PiarX4_item_quantities`
--
ALTER TABLE `PiarX4_item_quantities`
  ADD CONSTRAINT `PiarX4_item_quantities_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `PiarX4_items` (`item_id`),
  ADD CONSTRAINT `PiarX4_item_quantities_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `PiarX4_stock_locations` (`location_id`);

--
-- Constraints for table `PiarX4_suppliers`
--
ALTER TABLE `PiarX4_suppliers`
  ADD CONSTRAINT `PiarX4_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `PiarX4_people` (`person_id`);
  
--
-- Constraints for table `PiarX4_giftcards`
--
ALTER TABLE `PiarX4_giftcards`
  ADD CONSTRAINT `PiarX4_giftcards_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `PiarX4_people` (`person_id`);

