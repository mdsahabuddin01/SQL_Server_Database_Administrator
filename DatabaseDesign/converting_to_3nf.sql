-- Why doesn't rental_cars meet 3NF criteria?
-- Because there are two columns that depend on the non-key column, model.

--Create a new table for the non-key columns that were conflicting with 3NF criteria.
--Drop those non-key columns from rental_cars.
-- Create a new table to satisfy 3NF
CREATE TABLE car_model(
  model VARCHAR(128),
  manufacturer VARCHAR(128),
  type_car VARCHAR(128)
);

-- Drop columns in rental_cars to satisfy 3NF
ALTER TABLE rental_cars
DROP COLUMN model, 
DROP COLUMN type_car;
