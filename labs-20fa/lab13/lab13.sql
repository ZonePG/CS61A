.read data.sql


CREATE TABLE average_prices AS
  SELECT category, AVG(MSRP) as average_price FROM products GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, MIN(price) FROM inventory GROUP BY item;

CREATE TABLE deal_products AS
  SELECT name, MIN(MSRP/rating) as rating_point FROM products GROUP BY category;

CREATE TABLE shopping_list AS
  SELECT item, store FROM lowest_prices, deal_products WHERE item = name;


CREATE TABLE total_bandwidth AS
  SELECT SUM(Mbs) FROM shopping_list, stores WHERE shopping_list.store = stores.store;

