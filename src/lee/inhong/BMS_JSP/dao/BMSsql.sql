CREATE TABLE publisher (
    publisher_id NUMBER(4) PRIMARY KEY,
    publisher_name VARCHAR2(255) NOT NULL
);

CREATE TABLE customer (
    customer_id         VARCHAR2(20)    PRIMARY KEY,
    customer_pw         VARCHAR2(10)    NOT NULL,
    customer_name       VARCHAR2(20)    NOT NULL,
    customer_sid1       VARCHAR2(6)     NOT NULL,
    customer_sid2       VARCHAR2(7)     NOT NULL,
    customer_hp         VARCHAR2(13),
    customer_email      VARCHAR2(30)    NOT NULL,
    customer_regDate    TIMESTAMP       DEFAULT SYSDATE,
    CONSTRAINT customer_customer_email_uk UNIQUE(customer_email)
);

CREATE TABLE department (
    department_id NUMBER(4) PRIMARY KEY,
    department_name VARCHAR2(255) NOT NULL
);

CREATE TABLE employee (
    employee_id NUMBER(4) PRIMARY KEY,
    employee_name VARCHAR2(50) NOT NULL,
    department_id NUMBER(4) NOT NULL,
    CONSTRAINT employee_department_id_fk FOREIGN KEY(department_id) REFERENCES department(department_id)
);

CREATE TABLE book (
    ISBN CHAR(13) PRIMARY KEY,
    publisher_id NUMBER(4) NOT NULL,
    book_title VARCHAR2(255) NOT NULL,
    book_author VARCHAR2(50) NOT NULL,
    purchase_price NUMBER(6) NOT NULL,
    sell_price NUMBER(6) NOT NULL,
    CONSTRAINT book_publisher_id_fk FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

CREATE TABLE stock (
    ISBN CHAR(13) PRIMARY KEY,
    stock NUMBER(4) NOT NULL,
    CONSTRAINT stock_ISBN_fk FOREIGN KEY (ISBN) REFERENCES book(ISBN)
);

CREATE TABLE orderID (
    order_id CHAR(10) PRIMARY KEY,
    order_code CHAR(2) NOT NULL,
    order_date DATE DEFAULT SYSDATE,
    serial_number NUMBER(2) NOT NULL
);

CREATE TABLE orders (
    order_id CHAR(10) PRIMARY KEY,
    publisher_id NUMBER(4) NOT NULL,
    customer_id VARCHAR2(20) NOT NULL,
    employee_id NUMBER(4) NOT NULL,
    CONSTRAINT orders_publisher_id_fk FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    CONSTRAINT orders_customer_id_fk FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT orders_employee_id_fk FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    CONSTRAINT orders_order_id_fk FOREIGN KEY(order_id) REFERENCES orderID(order_id)
);

CREATE TABLE orderDetail (
    order_id CHAR(10) NOT NULL,
    detail_number NUMBER(2) NOT NULL,
    ISBN CHAR(13) NOT NULL,
    order_quantity NUMBER(4) DEFAULT 0,
    order_approval CHAR(1) DEFAULT 'N',
    CONSTRAINT orderDetail_order_id_fk FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    CONSTRAINT orderDetail_ISBN_fk FOREIGN KEY (ISBN) REFERENCES stock(ISBN),
    CONSTRAINT orderDetail_pk PRIMARY KEY(order_id, detail_number)
);

CREATE TABLE ledger (
    leder_id CHAR(10) PRIMARY KEY,
    order_id CHAR(10) NOT NULL,
    detail_number NUMBER(2) NOT NULL,
    debit_credit CHAR(1) DEFAULT 'N',
    leder_approcal CHAR(1) DEFAULT 'N',
    CONSTRAINT ledger_orderDetail_id_fk FOREIGN KEY (order_id, detail_number) REFERENCES orderDetail(order_id, detail_number)
);
--------------------------------------------------------------------------------
COMMIT;
ROLLBACK;
DROP TABLE publisher;
DROP TABLE customer;
DROP TABLE department;
DROP TABLE employee;
DROP TABLE book;
DROP TABLE stock;
DROP TABLE orderID;
DROP TABLE orders;
DROP TABLE orderDetail;
DROP TABLE ledger;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM SYS.USER_CONSTRAINTS;