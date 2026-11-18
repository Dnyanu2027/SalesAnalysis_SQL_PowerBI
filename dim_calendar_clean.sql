SELECT
  DateKey,
  `Date`,
  `Day`,
  DAYOFWEEK(`Date`)                                        AS DayNo,      -- 1 = Sunday ... 7 = Saturday
  CASE WHEN DAYOFWEEK(`Date`) IN (1, 7) THEN 1 ELSE 0 END  AS IsWeekend,
  `Month`,
  MonthShort,
  MonthNo,
  CONCAT(`Year`, '-', LPAD(MonthNo, 2, '0'))               AS YearMonth,
  `Quarter`,
  `Year`
FROM dim_calendar
WHERE `Year` BETWEEN 2019 AND 2021;


