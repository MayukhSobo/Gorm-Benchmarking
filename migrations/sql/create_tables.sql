-- Create a Product table
CREATE TABLE IF NOT EXISTS product (
    id INT NOT NULL,
    name varchar(250) NOT NULL,
    PRIMARY KEY (id)
);

-- Create a country table
CREATE TABLE IF NOT EXISTS country (
    id INT NOT NULL,
    country_name varchar(450) NOT NULL,
    PRIMARY KEY (id)
);

-- Creation of city table with country as a foreign key
CREATE TABLE IF NOT EXISTS city (
    id INT NOT NULL,
    city_name varchar(450) NOT NULL,
    country_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_country
    FOREIGN KEY(country_id)
    REFERENCES country(id)
);

-- Create a store table with city as a foreign key
CREATE TABLE IF NOT EXISTS store (
    id INT NOT NULL,
    name varchar(250) NOT NULL,
    city_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_city
    FOREIGN KEY(city_id)
    REFERENCES city(id)
);

-- Creation of user table
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL,
    name varchar(250) NOT NULL,
    PRIMARY KEY (id)
);

-- Creation of status_name table
CREATE TABLE IF NOT EXISTS status_name (
    id INT NOT NULL,
    status_name varchar(450) NOT NULL,
    PRIMARY KEY (id)
);


-- Creation of sale table with product, user, store foreign key
CREATE TABLE IF NOT EXISTS sale (
    id varchar(200) NOT NULL,
    amount DECIMAL(20,3) NOT NULL,
    date_sale TIMESTAMP,
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    store_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_product
    FOREIGN KEY(product_id)
    REFERENCES product(id),
    CONSTRAINT fk_user
    FOREIGN KEY(user_id)
    REFERENCES users(id),
    CONSTRAINT fk_store
    FOREIGN KEY(store_id)
    REFERENCES store(id)
);

-- Creation of order_status table with status name as foreign key
CREATE TABLE IF NOT EXISTS order_status (
    id varchar(200) NOT NULL,
    update_at TIMESTAMP,
    sale_id varchar(200) NOT NULL,
    status_name_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_sale
    FOREIGN KEY(sale_id)
    REFERENCES sale(id),
    CONSTRAINT fk_status_name
    FOREIGN KEY(status_name_id)
    REFERENCES status_name(id)
);