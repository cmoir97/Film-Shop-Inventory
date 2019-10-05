DROP TABLE films;
DROP TABLE production_companies;

CREATE TABLE production_companies
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE films
(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  director VARCHAR(255),
  quantity INT8,
  buy_cost INT8,
  sell_price INT8,
  production_company_id INT8 REFERENCES production_companies(id)
);
