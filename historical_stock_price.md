## Intermediate Queries
1. The highest daily trading range that Apple stock achieved in 2012. *11.95*
```sql
SELECT AVG(high - low)
  FROM tutorial.aapl_historical_stock_price 
  WHERE year = 2012
```

2. The lowest and highest prices that Apple stock achieved between 2005 and 2010 (inclusive)
*low: 31.3*; *high: 326.66*
```sql
SELECT MIN(low), MAX(high)
  FROM tutorial.aapl_historical_stock_price 
  WHERE year BETWEEN 2005 AND 2010
```

3. A list of all calendar months by average daily trading volume (so only 12 rows), sorted from highest to lowest
```sql
SELECT month, AVG(volume)
  FROM tutorial.aapl_historical_stock_price 
  GROUP BY month
  ORDER BY month
```

4. Return the percentage of unique "open" prices compared to all open prices in the data set *~83.08%*
```sql
SELECT COUNT(DISTINCT(open)) / 
   (SELECT COUNT(open) + 0.0
    FROM tutorial.aapl_historical_stock_price) * 100
  FROM tutorial.aapl_historical_stock_price 
```

5. A listing of average monthly price plus which quarter of the year they are in (e.g. "Q2" or "Q4")
```sql
SELECT AVG(close), (CASE
                      WHEN month < 4 THEN 'Q1'
                      WHEN month > 3 AND month < 7 THEN 'Q2'
                      WHEN month > 6 AND month < 10 THEN 'Q3'
                      ELSE 'Q4'
                    END) as quarter
  FROM tutorial.aapl_historical_stock_price 
GROUP BY month
ORDER BY quarter
```