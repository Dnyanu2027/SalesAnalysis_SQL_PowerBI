use sales;
DESCRIBE fact_internetsales;
ALTER TABLE fact_internetsales RENAME COLUMN `ï»¿ProductKey` TO ProductKey;

SELECT COUNT(*)                      AS total_rows,
       COUNT(DISTINCT SalesOrderNumber) AS unique_orders,
       ROUND(SUM(SalesAmount), 2)    AS total_sales,
       MIN(OrderDateKey)             AS first_order,
       MAX(OrderDateKey)             AS last_order
FROM fact_internetsales;

SELECT
  (SELECT COUNT(*) FROM fact_internetsales f
     LEFT JOIN dim_customer c ON c.CustomerKey = f.CustomerKey WHERE c.CustomerKey IS NULL) AS missing_customers,
  (SELECT COUNT(*) FROM fact_internetsales f
     LEFT JOIN dim_product p  ON p.ProductKey  = f.ProductKey  WHERE p.ProductKey  IS NULL) AS missing_products,
  (SELECT COUNT(*) FROM fact_internetsales f
     LEFT JOIN dim_calendar d ON d.DateKey     = f.OrderDateKey WHERE d.DateKey    IS NULL) AS missing_dates;
     
     SELECT
  ProductKey,
  OrderDateKey,
  DueDateKey,
  ShipDateKey,
  CustomerKey,
  SalesOrderNumber,
  SalesAmount
FROM fact_internetsales
WHERE LEFT(OrderDateKey, 4) >= 2019
ORDER BY OrderDateKey ASC;

CREATE OR REPLACE VIEW vw_fact_internetsales AS
SELECT
  ProductKey,
  OrderDateKey,
  DueDateKey,
  ShipDateKey,
  CustomerKey,
  SalesOrderNumber,
  SalesAmount
FROM fact_internetsales
WHERE OrderDateKey >= 20190101;