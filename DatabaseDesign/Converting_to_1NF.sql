/*
working through different tables belonging to a car rental company. to explore different schemas
and gradually increase the normalization of these schemas through the different normal forms.
At this stage, not worried about relocating the data, but rearranging the tables.

A table called customers, which holds information about customers and the cars they have rented.
*/

-- cars_rented holds one or more car_ids and invoice_id holds multiple values. Creating a new table to hold individual car_ids and invoice_ids of the customer_ids who've rented those cars.
-- Droping two columns from customers table to satisfy 1NF

-- Create a new table to hold the cars rented by customers
CREATE TABLE cust_rentals (
  customer_id INT NOT NULL,
  car_id VARCHAR(128) NULL,
  invoice_id VARCHAR(128) NULL
);

-- Drop two columns from customers table to satisfy 1NF
ALTER TABLE customers
DROP COLUMN cars_rented,
DROP COLUMN invoice_id;
