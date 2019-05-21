DROP TABLE IF EXISTS houses;


CREATE TABLE houses (
id SERIAL8 PRIMARY KEY,
address VARCHAR(255),
value INT2,
num_bedrooms INT2,
year VARCHAR(255)
);
