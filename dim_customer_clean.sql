use sales;
DESCRIBE dim_customer;
ALTER TABLE dim_customer RENAME COLUMN `ï»¿CustomerKey` TO CustomerKey;
ALTER TABLE dim_customer MODIFY COLUMN DateFirstPurchase DATE;
SELECT COUNT(*)                    AS total_rows,
       COUNT(DISTINCT CustomerKey) AS unique_keys,
       MIN(DateFirstPurchase)      AS first_purchase,
       MAX(DateFirstPurchase)      AS last_purchase
FROM dim_customer;

SELECT
  CustomerKey,
  `First Name`,
  `Last Name`,
  `Full Name`,
  Gender,
  DateFirstPurchase,
  `Customer City`
FROM dim_customer
ORDER BY CustomerKey ASC;

CREATE OR REPLACE VIEW vw_dim_customer AS
SELECT
  CustomerKey,
  `First Name`,
  `Last Name`,
  `Full Name`,
  Gender,
  DateFirstPurchase,
  `Customer City`
FROM dim_customer;

select * from dim_customer;