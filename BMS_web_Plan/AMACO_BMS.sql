CREATE TABLE publisher (
    publisher_id NUMBER(4) PRIMARY KEY,
    publisher_name VARCHAR2(255)NOT NULL
);
INSERT INTO publisher(publisher_id, publisher_name)
    VALUES(1001,'오픈이지북스');
INSERT INTO publisher(publisher_id, publisher_name)
    VALUES(1002,'에듀윌');
INSERT INTO publisher(publisher_id, publisher_name)
    VALUES(1003,'INFINITY BOOKS');
INSERT INTO publisher(publisher_id, publisher_name)
    VALUES(1004,'한빛미디어');
INSERT INTO publisher(publisher_id, publisher_name)
    VALUES(1005,'이지스퍼블리싱');
INSERT INTO publisher(publisher_id, publisher_name)
    VALUES(1006,'지앤선');
INSERT INTO publisher(publisher_id, publisher_name)
    VALUES(1007,'길벗');
    
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
INSERT INTO customer(customer_id,customer_pw,customer_name,customer_sid1,customer_sid2,customer_hp,customer_email)
    VALUES('in6121','amaco78','이인홍','781216','1695713','01097833038','amaco78@gmail.com');
    
CREATE TABLE department (
    department_id NUMBER(4) PRIMARY KEY,
    department_name VARCHAR2(255)NOT NULL
);
INSERT INTO department(department_id,department_name) VALUES(1100,'구매');
INSERT INTO department(department_id,department_name) VALUES(1200,'영업');
INSERT INTO department(department_id,department_name) VALUES(1300,'물류');
INSERT INTO department(department_id,department_name) VALUES(1400,'회계');

CREATE TABLE employee (
    employee_id NUMBER(4) PRIMARY KEY,
    employee_name VARCHAR2(50)NOT NULL,
    department_id NUMBER(4)NOT NULL,
    CONSTRAINT employee_department_id_fk FOREIGN KEY(department_id) REFERENCES department(department_id)
);
INSERT INTO employee(employee_id,employee_name,department_id) VALUES(0001,'이인홍',1200);

CREATE TABLE book (
    ISBN CHAR(13) PRIMARY KEY,
    publisher_id NUMBER(4)NOT NULL,
    book_title VARCHAR2(255) NOT NULL,
    book_author VARCHAR2(50) NOT NULL,
    purchase_price NUMBER(6) NOT NULL,
    sell_price NUMBER(6) NOT NULL,
    CONSTRAINT book_publisher_id_fk FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);
INSERT INTO book(ISBN, publisher_id, book_title, book_author, purchase_price, sell_price)
    VALUES(9791195334247,1001,'해킹 방어를 위한 JAVA 시큐어코딩','김영숙',27000,30000);
INSERT INTO book(ISBN, publisher_id, book_title, book_author, purchase_price, sell_price)
    VALUES(9791159492372,1002,'ERP 정보관리사 생산1급','공경태,정혜숙',20000,22000);
INSERT INTO book(ISBN, publisher_id, book_title, book_author, purchase_price, sell_price)
    VALUES(9791187370680,1005,'HTML5+CSS3 웹 표준의 정석','고경희',25000,28000); 
INSERT INTO book(ISBN, publisher_id, book_title, book_author, purchase_price, sell_price)
    VALUES(9788979143713,1004,'Head First Java','케이시 시에라,버트 베이츠',25000,28000); 
INSERT INTO book(ISBN, publisher_id, book_title, book_author, purchase_price, sell_price)
    VALUES(9791185578217,1003,'어서와 Java는 처음이지','천인국',30000,33000);
INSERT INTO book(ISBN, publisher_id, book_title, book_author, purchase_price, sell_price)
    VALUES(9791160500325,1007,'시나공 정보처리기사 필기','길벗알앤디',28000,31000);
INSERT INTO book(ISBN, publisher_id, book_title, book_author, purchase_price, sell_price)
    VALUES(9788993827941,1006,'JavaScript and jQuery:The Missing Manual','데이비드 소이어 맥파랜드',30000,35000);
    
CREATE TABLE stock (
    ISBN CHAR(13) PRIMARY KEY,
    stock NUMBER(4) NOT NULL,
    CONSTRAINT stock_ISBN_fk FOREIGN KEY (ISBN) REFERENCES book(ISBN)
);

CREATE TABLE orderID (
    order_id CHAR(10) PRIMARY KEY,
    order_code CHAR(2) NOT NULL,
    order_date DATE DEFAULT SYSDATE,
    serial_number NUMBER(2)NOT NULL
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