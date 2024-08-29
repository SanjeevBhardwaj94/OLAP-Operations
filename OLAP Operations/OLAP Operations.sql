Create database OLAP_Operations;
Use OLAP_Operations;

CREATE TABLE sales_sample(
Product_ID INT,
REGION VARCHAR (50) CHECK (REGION IN ('EAST', 'WEST', 'NORTH', 'SOUTH', 'CENTRAL')),
DATE DATE,
SALES_AMOUNT DECIMAL (10,2)
);

-- Insert 10 sample rows with 2024 dates
INSERT INTO sales_sample (Product_ID, REGION, DATE, SALES_AMOUNT) VALUES
(1, 'EAST', '2024-01-01', 1200.50),
(2, 'WEST', '2024-02-15', 950.75),
(3, 'NORTH', '2024-03-10', 1500.00),
(4, 'SOUTH', '2024-04-05', 875.25),
(5, 'CENTRAL', '2024-05-20', 1100.00),
(6, 'EAST', '2024-06-01', 1050.80),
(7, 'WEST', '2024-07-12', 1175.60),
(8, 'NORTH', '2024-08-25', 1400.90),
(9, 'SOUTH', '2024-09-18', 920.35),
(10, 'CENTRAL', '2024-10-03', 1225.45);

-- Drill Down Region
SELECT
    REGION,
    SUM(SALES_AMOUNT) AS Total_Sales,
    AVG(SALES_AMOUNT) AS Avg_Sales
FROM
    sales_sample 
GROUP BY
    REGION;
	
    
-- Drill Down Product
SELECT
    Product_ID,
    SUM(SALES_AMOUNT) AS Total_Sales,
    AVG(SALES_AMOUNT) AS Avg_Sales
FROM
    sales_sample 
GROUP BY
    Product_ID;
    
   -- Dice - write a query to view sales for specific combinations of product, region and date

SELECT
    Product_ID,
    REGION,
    DATE,
    SUM(SALES_AMOUNT) AS Total_Sales
FROM
    sales_sample
WHERE
    Product_ID IN (1, 2, 3)
    AND REGION IN ('EAST', 'WEST')
    AND DATE BETWEEN '2024-01-01' AND '2024-06-30'
GROUP BY
    Product_ID, REGION, DATE
ORDER BY
    Product_ID, REGION, DATE;
    
    -- Slice - query to slice the data to view sales for a particular region or date range
SELECT
    REGION,
    DATE,
    SUM(SALES_AMOUNT) AS Total_Sales
FROM
    sales_sample
WHERE
REGION = 'EAST' AND DATE BETWEEN '2024-01-01' AND '2024-06-30'
GROUP BY
	REGION, DATE
ORDER BY
REGION, DATE;    
    
    
