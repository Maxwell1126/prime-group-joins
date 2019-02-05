--1.Get all customers and their addresses.
SELECT "customers"."first_name","customers"."last_name","addresses".* FROM "customers"
JOIN "addresses" ON "customers"."id" = "addresses"."customer_id";

--2.Get all orders and their line items (orders, quantity and product).
SELECT "orders"."id", "line_items"."quantity", "products"."description" FROM "orders"
JOIN "line_items" ON  "orders"."id" = "line_items"."order_id"
JOIN "products" ON "products"."id" = "line_items"."product_id"
ORDER BY "orders"."id";

--3.Which warehouses have cheetos?
SELECT "warehouse"."id","warehouse"."warehouse","products"."description", "warehouse_product"."on_hand"
FROM "warehouse" JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."id" = 5 AND "warehouse_product"."on_hand" > 0;

--4.Which warehouses have diet pepsi?
SELECT "warehouse"."id","warehouse"."warehouse","products"."description", "warehouse_product"."on_hand"
FROM "warehouse" JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."id" = 6 AND "warehouse_product"."on_hand" > 0;

--5.Get the number of orders for each customer. 
--NOTE: It is OK if those without orders are not included in results.
SELECT "customers".*, COUNT("orders"."address_id") AS "total_orders" FROM "addresses"
JOIN "customers" ON "customers"."id" = "addresses"."customer_id"
JOIN "orders" ON "addresses"."id"="orders"."address_id"
GROUP BY "customers"."id";

--6.How many customers do we have?
SELECT COUNT("customers"."id") AS "total_customers" FROM "customers";

--7.How many products do we carry?
SELECT COUNT("products"."id") AS "total_products" FROM "products";

--8.What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product"."on_hand") AS "total_diet_pepsi" FROM "warehouse_product"
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."id" = 6;

