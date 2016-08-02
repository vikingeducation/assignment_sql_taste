# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

select distinct month, avg(volume) as vol, avg(open) as open
from tutorial.aapl_historical_stock_price 
group by month 
order by month
