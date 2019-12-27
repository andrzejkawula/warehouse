--creating base tables

CREATE TABLE ADDRESSES(
                          ID SERIAL PRIMARY KEY,
                          STREET VARCHAR(60) NOT NULL,
                          HOME_NUMBER VARCHAR(6) NOT NULL,
                          FLAT_NUMBER VARCHAR(6),
                          POSTAL_CODE VARCHAR(6) NOT NULL,
                          CITY VARCHAR(30) NOT NULL
);

CREATE TABLE SUPPLIERS(
                          ID SERIAL PRIMARY KEY,
                          NAME VARCHAR(60) NOT NULL ,
                          ADDRESS_ID INT REFERENCES ADDRESSES(ID)
);

CREATE TABLE CLIENTS(
                        ID SERIAL PRIMARY KEY,
                        PHONE VARCHAR(16),
                        EMAIL VARCHAR(40),
                        ADDRESS_ID INT REFERENCES ADDRESSES(ID)
);

CREATE TABLE CLIENT_ORDERS(
                              ID SERIAL PRIMARY KEY,
                              CLIENT_ID INT REFERENCES CLIENTS(ID),
                              ORDER_DATE TIMESTAMP NOT NULL,
                              DELIVERY_DATE DATE,
                              STATUS VARCHAR(15)
);

CREATE TABLE PRODUCTS(
                         ID SERIAL PRIMARY KEY,
                         EXTERNAL_ID INT,
                         NAME VARCHAR(50) NOT NULL,
                         SUPPLIER_ID INTEGER REFERENCES SUPPLIERS(ID),
                         UNIT_PRICE NUMERIC(20, 10) NOT NULL,
                         AVAILABLE_AMOUNT NUMERIC(20, 10),
                         MEASURE VARCHAR(20),
                         TO_SEND_NUMBER INT,
                         TO_GET_NUMBER INT
);

CREATE TABLE CLIENT_ORDER_ITEMS(
                                   ID SERIAL PRIMARY KEY,
                                   CLIENT_ORDER_ID INT REFERENCES CLIENT_ORDERS(ID),
                                   PRODUCT_ID INT REFERENCES PRODUCTS(ID),
                                   AMOUNT NUMERIC(20, 10)
);

CREATE TABLE MY_ORDERS(
                          ID SERIAL PRIMARY KEY,
                          SUPPLIER_ID INT REFERENCES SUPPLIERS(ID),
                          ORDER_DATE TIMESTAMP NOT NULL,
                          DELIVERY_DATE DATE,
                          STATUS VARCHAR(15)
);

CREATE TABLE MY_ORDER_ITEMS(
                               ID SERIAL PRIMARY KEY,
                               MY_ORDER_ID INT REFERENCES MY_ORDERS(ID),
                               PRODUCT_ID INT REFERENCES PRODUCTS(ID),
                               AMOUT NUMERIC(20, 10) NOT NULL
);