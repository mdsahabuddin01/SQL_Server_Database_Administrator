
WITH FilteredSales AS (
    -- Filter and join the relevant tables to get the sales data for novels
    SELECT fact_booksales.sales_amount, dim_state_sf.state
    FROM fact_booksales
    -- Joins for genre
    JOIN dim_book_sf ON fact_booksales.book_id = dim_book_sf.book_id
    JOIN dim_genre_sf ON dim_book_sf.genre_id = dim_genre_sf.genre_id
    -- Joins for state
    JOIN dim_store_sf ON fact_booksales.store_id = dim_store_sf.store_id
    JOIN dim_city_sf ON dim_store_sf.city_id = dim_city_sf.city_id
    JOIN dim_state_sf ON dim_city_sf.state_id = dim_state_sf.state_id

    WHERE dim_genre_sf.genre = 'novel'
)
-- Output each state and their total sales_amount
SELECT state, SUM(ROUND(CAST(sales_amount AS NUMERIC), 2)) AS Total_Sales
FROM FilteredSales
-- Group the results by state.
GROUP BY state;

/*-- Output each state and their total sales_amount
SELECT dim_state_sf.state, sum(sales_amount)
FROM fact_booksales
    -- Joins for genre
    JOIN dim_book_sf on fact_booksales.book_id = dim_book_sf.book_id
    JOIN dim_genre_sf on dim_book_sf.genre_id = dim_genre_sf.genre_id
    -- Joins for state 
    JOIN dim_store_sf on fact_booksales.store_id = dim_store_sf.store_id 
    JOIN dim_city_sf on dim_store_sf.city_id = dim_city_sf.city_id
	JOIN dim_state_sf on  dim_city_sf.state_id = dim_state_sf.state_id
-- Get all books with in the novel genre and group the results by state
WHERE  
    dim_genre_sf.genre = 'novel'
GROUP BY
    dim_state_sf.state; */ 

