use sales;
DESCRIBE dim_product;
ALTER TABLE dim_product RENAME COLUMN `ï»¿ProductKey` TO ProductKey;

SELECT
  SUM(`Sub Category`  = 'NULL')                    AS null_subcat,
  SUM(`Product Size`  = 'NULL')                    AS null_size,
  SUM(`Product Line` <> TRIM(`Product Line`))      AS line_with_spaces,
  SUM(`Product Status` = 'Outdate')                AS bad_status
FROM dim_product;

SELECT
  ProductKey,
  ProductItemCode,
  `Product Name`,
  NULLIF(`Sub Category`, 'NULL')                       AS `Sub Category`,
  NULLIF(`Product Category`, 'NULL')                   AS `Product Category`,
  `Product Color`,
  NULLIF(`Product Size`, 'NULL')                       AS `Product Size`,
  NULLIF(TRIM(`Product Line`), 'NULL')                 AS `Product Line`,
  NULLIF(`Product Model Name`, 'NULL')                 AS `Product Model Name`,
  NULLIF(`Product Description`, 'NULL')                AS `Product Description`,
  CASE `Product Status` WHEN 'Outdate' THEN 'Outdated'
       ELSE `Product Status` END                       AS `Product Status`
FROM dim_product
ORDER BY ProductKey ASC;

SELECT `Product Status`, COUNT(*) AS products
FROM (
  SELECT CASE `Product Status` WHEN 'Outdate' THEN 'Outdated'
         ELSE `Product Status` END AS `Product Status`
  FROM dim_product
) t
GROUP BY `Product Status`;

CREATE OR REPLACE VIEW vw_dim_product AS
SELECT
  ProductKey,
  ProductItemCode,
  `Product Name`,
  NULLIF(`Sub Category`, 'NULL')                       AS `Sub Category`,
  NULLIF(`Product Category`, 'NULL')                   AS `Product Category`,
  `Product Color`,
  NULLIF(`Product Size`, 'NULL')                       AS `Product Size`,
  NULLIF(TRIM(`Product Line`), 'NULL')                 AS `Product Line`,
  NULLIF(`Product Model Name`, 'NULL')                 AS `Product Model Name`,
  NULLIF(`Product Description`, 'NULL')                AS `Product Description`,
  CASE `Product Status` WHEN 'Outdate' THEN 'Outdated'
       ELSE `Product Status` END                       AS `Product Status`
FROM dim_product;

