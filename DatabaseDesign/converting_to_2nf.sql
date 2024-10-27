-- Why doesn't customer_rentals meet 2NF criteria?
-- there are non-key attributes describing the car that only depend on one primary key, car_id.
/*
Creating a new table for the non-key columns that were conflicting with 2NF criteria.
Droping those non-key columns from customer_rentals.
*/

-- Create a new table to satisfy 2NF
CREATE TABLE cars (
  car_id VARCHAR(256) NULL,
  model VARCHAR(128),
  manufacturer VARCHAR(128),
  type_car VARCHAR(128),
  condition VARCHAR(128),
  color VARCHAR(128)
);

-- Insert data into the new table
INSERT INTO cars
SELECT DISTINCT
  car_id,
  model,
  manufacturer,
  type_car,
  condition,
  color
FROM customer_rentals;

select * from cars;

-- Drop columns in customer_rentals to satisfy 2NF
ALTER TABLE customer_rentals
Drop column model,
Drop column manufacturer,
Drop column type_car,
Drop column condition,
Drop column color;
