# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```
```
SELECT * FROM tutorial.us_housing_units LIMIT 10;
```

```
SELECT midwest FROM tutorial.us_housing_units;
```
```
SELECT * FROM tutorial.us_housing_units WHERE month_name = 'December' AND
   year >= 1985;
```

```
SELECT * FROM tutorial.us_housing_units WHERE month > 6 AND year > 1989;
```

```
SELECT * FROM tutorial.us_housing_units WHERE south > 30;
```

```
SELECT (south + west + midwest + northeast) as total FROM
tutorial.us_housing_units;
```

```
SELECT * FROM tutorial.us_housing_units WHERE (south + west + midwest +
northeast) > 70;
```

```
SELECT * FROM tutorial.us_housing_units WHERE (south + west + midwest +
northeast) BETWEEN 50 AND 80;
```

```
SELECT AVG(south + west + midwest + northeast) FROM tutorial.us_housing_units;
```

```
SELECT * FROM tutorial.us_housing_units WHERE south > (west + midwest +
northeast);
```

Total column average
```
SELECT AVG(south / (south + west + midwest + northeast)) * 100 as south_percentage,
       AVG(west / (south + west + midwest + northeast)) * 100 as west_percentage,
       AVG(midwest / (south + west + midwest + northeast)) * 100 as midwest_percentage,
       AVG(northeast / (south + west + midwest + northeast)) * 100 as northeast_percentage
FROM tutorial.us_housing_units WHERE year >= 1990;
```

Row average
```
SELECT ((south / (south + west + midwest + northeast)) * 100) as south_percentage,
       ((west / (south + west + midwest + northeast)) * 100) as west_percentage,
       ((midwest / (south + west + midwest + northeast)) * 100) as midwest_percentage,
       ((northeast / (south + west + midwest + northeast)) * 100) as northeast_percentage
FROM tutorial.us_housing_units WHERE year >= 1990;
```

```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE artist LIKE 'Elvis
Presley';
```

```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE artist LIKE 'Tony%';
```
% is like Ruby's * matcher

```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE song_name LIKE '%love%';
```

```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE artist LIKE 'A%';
```

```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE year_rank < 4;
```

```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE artist IN ('Elvis
Presley', 'Rolling Stones', 'Van Halen');
```

() array literal constructor

```
SELECT COUNT(artist) as artist_count, artist
FROM tutorial.billboard_top_100_year_end
GROUP BY artist ORDER BY artist_count DESC LIMIT 1;
```

```
SELECT COUNT(year_rank), artist
FROM (SELECT year_rank, artist
      FROM tutorial.billboard_top_100_year_end
WHERE year_rank = 1) num_1_hits
GROUP BY artist ORDER BY count DESC LIMIT 2;
```

```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE (year_rank BETWEEN 10 AND
20) AND year = 1970;
```

```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year IN (SELECT year
               FROM tutorial.billboard_top_100_year_end
               WHERE artist = 'Madonna' and year_rank < 10)
AND year BETWEEN 1990 AND 1999;
```

```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 1985 AND ("group" NOT ILIKE '%Madonna%' AND "group" NOT ILIKE '%Phil
Collins%)';
```

```
SELECT song_name, year
FROM tutorial.billboard_top_100_year_end
WHERE year_rank = 1
GROUP BY "group", song_name, year;
```

```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist IS NULL;
```

```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna'
ORDER BY year_rank
LIMIT 100;
```

```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year >= 1990 AND year_rank <= 3
ORDER BY year_rank, year;
```

```
SELECT MIN(year_rank) FROM tutorial.billboard_top_100_year_end WHERE "group" ILIKE ('%Phil Collins%');
```

```
SELECT AVG(year_rank)
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Michael Jackson';
```

```
SELECT AVG(year_rank)
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna' AND year_rank <= 10;
```

```
SELECT artist, appearances
FROM (
  SELECT COUNT(artist) as appearances, artist
  FROM tutorial.billboard_top_100_year_end
  GROUP BY artist
) appearance_count
ORDER BY appearances DESC
LIMIT 10;
```

```
SELECT COUNT(DISTINCT(song_name)) as hits
FROM tutorial.billboard_top_100_year_end
WHERE ("group" ILIKE '%Madonna%'
      OR "group" ILIKE '%Elton John%'
      OR "group" ILIKE '%Beatles%'
      OR "group" ILIKE '%Elvis Presley%')
      AND year_rank <= 10;
```

##INTERMEDIATE aapl_historical_stock_price


```
SELECT COUNT(date)
FROM tutorial.aapl_historical_stock_price
WHERE (high - low) > 5;
```

```
SELECT MAX((high - low))
FROM tutorial.aapl_historical_stock_price
WHERE year = 2012;
```

```
SELECT AVG(((open + high + low + close) / 4))
FROM tutorial.aapl_historical_stock_price
WHERE volume > 10000000;
```

```
SELECT AVG(month_count)
FROM (
      SELECT COUNT(month) as month_count
      FROM tutorial.aapl_historical_stock_price
      WHERE year = 2012
      GROUP BY month
      ) days_per_month
;
```

```
SELECT year, MAX(high)
FROM tutorial.aapl_historical_stock_price
GROUP BY year
ORDER BY year;
```

```
SELECT *
FROM (
  SELECT month, AVG((high + low + open + close)/4) as price, AVG(volume) as vol
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  ORDER BY month
  ) monthly_avg
WHERE vol > 10000000;
```

```
SELECT year, month, AVG((high + low + open + close)/4) as price
FROM tutorial.aapl_historical_stock_price
GROUP BY month, year
ORDER BY year DESC, month ASC;
```

```
SELECT AVG((high + low + open + close)/4) as price
FROM tutorial.aapl_historical_stock_price
WHERE volume > 25000000;
```

```
SELECT year, month, price
FROM (
        SELECT AVG(volume) as avg_vol, AVG((high + low + open + close)/4) as price, month, year
        FROM tutorial.aapl_historical_stock_price
        GROUP BY month, year
      ) month_avg
WHERE avg_vol > 10000000
ORDER BY year, month;
```

```
SELECT year, MIN(low) as lowest, MAX(high) as highest
FROM tutorial.aapl_historical_stock_price
WHERE year BETWEEN 2005 AND 2010
GROUP BY year
ORDER BY year;
```

```
SELECT main.year, main. month, AVG((high + low + open + close)/4) as price
FROM
tutorial.aapl_historical_stock_price as main
INNER JOIN
(SELECT open_price.year, open_price.month
FROM (SELECT open, year, month
      FROM tutorial.aapl_historical_stock_price
      WHERE id IN (
                    SELECT MIN(id)
                    FROM tutorial.aapl_historical_stock_price
                    GROUP BY year, month
                    ORDER BY year, month
                  )
    ) open_price
    INNER JOIN
    (SELECT close, year, month
      FROM tutorial.aapl_historical_stock_price
      WHERE id IN (
                    SELECT MAX(id)
                    FROM tutorial.aapl_historical_stock_price
                    GROUP BY year, month
                    ORDER BY year, month
                  )
    ) close_price
ON (close_price.year = open_price.year AND close_price.month = open_price.month)
WHERE (open - close) > 25) valid
ON (main.year = valid.year AND main.month = valid.month)
GROUP BY main.year, main.month
ORDER BY main.year, main.month;
```

```
SELECT year, month, vol
FROM (
      SELECT year, month, AVG(volume) as vol
      FROM tutorial.aapl_historical_stock_price
      WHERE month > 6
      GROUP BY year, month
      ) avg_monthly
WHERE vol < 10000000
ORDER BY year, month
```

```
SELECT COUNT(DISTINCT(month))
FROM tutorial.aapl_historical_stock_price;
```

```
SELECT COUNT(DISTINCT(year))
FROM tutorial.aapl_historical_stock_price;
```

```
SELECT COUNT(DISTINCT(price))
FROM (
      SELECT open as price
      FROM tutorial.aapl_historical_stock_price
      UNION
      SELECT close as price
      FROM tutorial.aapl_historical_stock_price
      UNION
      SELECT high as price
      FROM tutorial.aapl_historical_stock_price
      UNION
      SELECT low as price
      FROM tutorial.aapl_historical_stock_price
      )unioned
WHERE price IS NOT NULL
```

```
SELECT (CAST(COUNT(DISTINCT(open))AS FLOAT)/COUNT(open)) * 100 as percent_distinct
FROM tutorial.aapl_historical_stock_price
```
