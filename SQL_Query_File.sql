/* File was loaded instantly as text format (avoiding error in prior) in SQL Database */

USE blinkit_db;

CREATE TABLE blinkit_data (
    item_fat_content TEXT,
    item_identifier TEXT,
    item_type TEXT,
    outlet_establishment_year TEXT,
    outlet_identifier TEXT,
    outlet_location_type TEXT,
    outlet_size TEXT,
    outlet_type TEXT,
    item_visibility TEXT,
    item_weight TEXT,
    total_sales TEXT,
    rating TEXT
);

/* Imported CSV into blinkit_db */

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/BlinkIT_Grocery_Data.csv'
INTO TABLE blinkit_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/* Validate the raw data in prior before data cleaning and verifying the dataset */

SELECT COUNT(*) FROM blinkit_data;

DESCRIBE blinkit_data;

/* Clean data (CRITICAL STEP) */

UPDATE blinkit_data
SET item_weight = NULL
WHERE item_weight IN ('', 'NA', 'NULL');

UPDATE blinkit_final
SET item_fat_content =
CASE
	WHEN item_fat_content = 'LF' THEN 'Low Fat'
	WHEN item_fat_content = 'reg' THEN 'Regular'
ELSE item_fat_content
END;

SELECT DISTINCT item_fat_content FROM blinkit_final;

/* Creating a FINAL table (proper types) */

CREATE TABLE blinkit_final (
    item_fat_content VARCHAR(50),
    item_identifier VARCHAR(50),
    item_type VARCHAR(50),
    outlet_establishment_year INT,
    outlet_identifier VARCHAR(50),
    outlet_location_type VARCHAR(50),
    outlet_size VARCHAR(50),
    outlet_type VARCHAR(100),
    item_visibility DECIMAL(6,4),
    item_weight DECIMAL(6,2),
    total_sales DECIMAL(12,2),
    rating DECIMAL(2,1)
);

/* Insert clean data */

INSERT INTO blinkit_final
SELECT
    item_fat_content,
    item_identifier,
    item_type,
    NULLIF(outlet_establishment_year, ''),
    outlet_identifier,
    outlet_location_type,
    outlet_size,
    outlet_type,
    CAST(item_visibility AS DECIMAL(6,4)),
    CAST(item_weight AS DECIMAL(6,2)),
    CAST(total_sales AS DECIMAL(12,2)),
    CAST(rating AS DECIMAL(2,1))
FROM blinkit_data;

---------------- END ---------------

-------- Starting with KPI's Requirement --------
 
/* 1. Total_sales */

SELECT CONCAT(CAST(SUM(total_sales)/1000000 AS DECIMAL(10,2)),' ','Millon') AS Total_Sales_Millons
FROM blinkit_final;

/* 2. Average_sales */

SELECT ROUND(AVG(total_sales), 0) AS Avg_Sales 
FROM blinkit_final;

/* 3. Number_of_items */

SELECT COUNT(*) AS No_Of_Items
FROM blinkit_final;

/* 4. AVG RATING */

SELECT CAST(AVG(rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_final;

/* 5. Total Sales by Fat Content */

SELECT item_fat_content, 
	CAST(SUM(total_sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_final
GROUP BY item_fat_content;

/* 6. Total Sales by Item Type */

SELECT item_type, 
	CAST(SUM(total_sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_final
GROUP BY item_type
ORDER BY total_sales DESC;

/* 7. Fat Content by Outlet for Total Sales */

SELECT
    outlet_location_type,
    ROUND(SUM(CASE 
        WHEN item_fat_content = 'Low Fat' 
        THEN total_sales 
        ELSE 0 
    END), 2) AS Low_Fat,

    ROUND(SUM(CASE 
        WHEN item_fat_content = 'Regular' 
        THEN total_sales 
        ELSE 0 
    END), 2) AS Regular
FROM blinkit_final
GROUP BY outlet_location_type
ORDER BY outlet_location_type;    

/* 8. Total Sales by Outlet Establishment */

SELECT outlet_establishment_year, 
	CAST( SUM(total_sales) AS DECIMAL (10,2)) as Total_Sales
FROM blinkit_final
GROUP BY outlet_establishment_year
ORDER BY outlet_establishment_year DESC;

/* 9. Percentage of Sales by Outlet Size */

WITH sales_cte AS (
    SELECT
        outlet_size,
        SUM(total_sales) AS total_sales
    FROM blinkit_final
    GROUP BY outlet_size
)
SELECT
    outlet_size,
    CAST(total_sales AS DECIMAL(10,2)) AS Total_Sales,
    CAST(
        total_sales * 100.0 / SUM(total_sales) OVER ()
        AS DECIMAL(10,2)
    ) AS Sales_Percentage
FROM sales_cte
ORDER BY Total_Sales;

/* 10. Sales by Outlet Location */

SELECT outlet_location_type,
	CAST(SUM(total_sales) AS DECIMAL (10,2)) AS Total_Sales
FROM blinkit_final	
GROUP BY outlet_location_type
ORDER BY Total_Sales DESC;

/* 11. All Metrics by Outlet Type */

SELECT outlet_type,
	CAST(SUM(total_sales) AS DECIMAL(10,2)) AS Total_Sales,
    ROUND(AVG(total_sales), 0) AS Avg_Sales,
    COUNT(*) AS No_Of_Items,
    CAST(AVG(rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_final
GROUP BY outlet_type
ORDER BY Total_Sales DESC;

------------------------- END -----------------------------
    
    
