-- -----------------------------------------
-- Sams Teach Yourself SQL in 10 Minutes
-- http://forta.com/books/0672336073/
-- Example table creation scripts for MySQL.
-- -----------------------------------------


-- ----------------------
-- Create Customers table
-- ----------------------
DROP DATABASE IF EXISTS DataBaseBook; -- 如果存在就先删除
CREATE DATABASE DataBaseBook;

CREATE TABLE DataBaseBook.Customers
(
  cust_id      char(10)  NOT NULL  COMMENT '主键',
  cust_name    char(50)  NOT NULL ,
  cust_address char(50)  NULL ,
  cust_city    char(50)  NULL ,
  cust_state   char(5)   NULL ,
  cust_zip     char(10)  NULL ,
  cust_country char(50)  NULL ,
  cust_contact char(50)  NULL ,
  cust_email   char(255) NULL
)COMMENT '员工所在的部门';

-- -----------------------
-- Create OrderItems table
-- -----------------------
CREATE TABLE DataBaseBook.OrderItems
(
  order_num  int          NOT NULL ,
  order_item int          NOT NULL ,
  prod_id    char(10)     NOT NULL ,
  quantity   int          NOT NULL ,
  item_price decimal(8,2) NOT NULL
);


-- -------------------
-- Create Orders table
-- -------------------
CREATE TABLE DataBaseBook.Orders
(
  order_num  int      NOT NULL ,
  order_date datetime NOT NULL ,
  cust_id    char(10) NOT NULL
);

-- ---------------------
-- Create Products table
-- ---------------------
CREATE TABLE DataBaseBook.Products
(
  prod_id    char(10)      NOT NULL ,
  vend_id    char(10)      NOT NULL ,
  prod_name  char(255)     NOT NULL ,
  prod_price decimal(8,2)  NOT NULL ,
  prod_desc  text          NULL
);

-- --------------------
-- Create Vendors table
-- --------------------
CREATE TABLE DataBaseBook.Vendors
(
  vend_id      char(10) NOT NULL ,
  vend_name    char(50) NOT NULL ,
  vend_address char(50) NULL ,
  vend_city    char(50) NULL ,
  vend_state   char(5)  NULL ,
  vend_zip     char(10) NULL ,
  vend_country char(50) NULL
);


-- -------------------
-- Define primary keys
-- -------------------
ALTER TABLE DataBaseBook.Customers ADD PRIMARY KEY (cust_id);
ALTER TABLE DataBaseBook.OrderItems ADD PRIMARY KEY (order_num, order_item);
ALTER TABLE DataBaseBook.Orders ADD PRIMARY KEY (order_num);
ALTER TABLE DataBaseBook.Products ADD PRIMARY KEY (prod_id);
ALTER TABLE DataBaseBook.Vendors ADD PRIMARY KEY (vend_id);


-- -------------------
-- Define foreign keys
-- -------------------
ALTER TABLE DataBaseBook.OrderItems ADD CONSTRAINT FK_OrderItems_Orders FOREIGN KEY (order_num) REFERENCES DataBaseBook.Orders (order_num);
ALTER TABLE DataBaseBook.OrderItems ADD CONSTRAINT FK_OrderItems_Products FOREIGN KEY (prod_id) REFERENCES DataBaseBook.Products (prod_id);
ALTER TABLE DataBaseBook.Orders ADD CONSTRAINT FK_Orders_Customers FOREIGN KEY (cust_id) REFERENCES DataBaseBook.Customers (cust_id);
ALTER TABLE DataBaseBook.Products ADD CONSTRAINT FK_Products_Vendors FOREIGN KEY (vend_id) REFERENCES DataBaseBook.Vendors (vend_id);
