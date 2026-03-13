CREATE OR REPLACE TEMPORARY VIEW sales(location, year, q1, q2, q3, q4) AS
  VALUES ('Toronto'      , 2020, 100 , 80 , 70, 150),
         ('San Francisco', 2020, NULL, 20 , 50,  60),
         ('Toronto'      , 2021, 110 , 90 , 80, 170),
         ('San Francisco', 2021, 70  , 120, 85, 105);

SELECT *
    FROM sales UNPIVOT INCLUDE NULLS
    (sales FOR quarter IN (q1       AS `Jan-Mar`,
                           q2       AS `Apr-Jun`,
                           q3       AS `Jul-Sep`,
                           q4       AS `Oct-Dec`));
