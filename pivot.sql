SELECT product, 2023_total, 2024_total
FROM values ('E',2023, 10000),
            ('E',2024, 15000),
            ('E',2025, 20000),
            ('C',2023, 10000),
            ('C',2024, 15000),
            ('C',2025, 20000) AS T(product, Year, Amount)
PIVOT (
    SUM(Amount)
    FOR Year IN (2023 as 2023_total, 2024 as 2024_total)
)