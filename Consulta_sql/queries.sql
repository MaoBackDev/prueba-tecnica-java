CREATE TABLE IF NOT EXISTS company (
	company_id SERIAL NOT NULL PRIMARY KEY,
	company_name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS product (
	product_id SERIAL NOT NULL PRIMARY KEY,
	product_name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS seller (
	seller_id SERIAL NOT NULL PRIMARY KEY,
	"document" VARCHAR(20) NOT NULL,
	"name" VARCHAR(100) NOT NULL,
	company_id INT NOT NULL,
    FOREIGN KEY(company_id) 
	REFERENCES company(company_id)
);

CREATE TABLE IF NOT EXISTS sale (
	sale_id SERIAL NOT NULL PRIMARY KEY,
	"total" NUMERIC(10, 2) NOT NULL,
	"customer" VARCHAR(100) NOT NULL,
	seller_id INT NOT NULL,
    FOREIGN KEY(seller_id) 
	REFERENCES seller(seller_id)
);

CREATE TABLE IF NOT EXISTS saleDetail (
	sale_detail_id SERIAL NOT NULL PRIMARY KEY,
	"total" NUMERIC(10, 2) NOT NULL,
	"quantity" INT NOT NULL,
	product_id INT NOT NULL,
	sale_id INT NOT NULL,
    FOREIGN KEY(product_id) 
	REFERENCES product(product_id),
    FOREIGN KEY(sale_id) 
	REFERENCES sale(sale_id)
);

-- ********************** Insert data *********************
INSERT INTO company VALUES 
(DEFAULT, 'Company uno'),
(DEFAULT, 'Company dos')

INSERT INTO product VALUES 
(DEFAULT, 'Product uno'),
(DEFAULT, 'Product dos'),
(DEFAULT, 'Product tres')

INSERT INTO seller VALUES 
(DEFAULT, '123456', 'Seller uno', 1),
(DEFAULT, '123455', 'Seller dos', 2),
(DEFAULT, '123454', 'Seller tres', 1)

INSERT INTO sale VALUES 
(DEFAULT, 450000, 'Customer uno', 1),
(DEFAULT, 1200000, 'Customer dos', 2),
(DEFAULT, 300000, 'Customer tres', 1)

INSERT INTO saleDetail VALUES 
(DEFAULT, 450000, 2, 1, 1),
(DEFAULT, 1200000, 3, 2, 2),
(DEFAULT, 300000, 1, 3, 1)

SELECT 
c.company_name Empresa,
p.product_name Producto,
sd.quantity Cantidad,
sd.total Total
FROM company c
INNER JOIN seller s
ON c.company_id = s.company_id
INNER JOIN sale sl
ON s.seller_id = sl.seller_id
INNER JOIN saleDetail sd
ON sl.sale_id = sd.sale_id
INNER JOIN product p
ON p.product_id = sd.product_id;