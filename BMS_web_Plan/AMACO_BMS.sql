CREATE TABLE publisher (
    publisher_id NUMBER(4) PRIMARY KEY,
    publisher_name VARCHAR2(255)NOT NULL
);
INSERT INTO publisher(publisher_id, publisher_name)
    VALUES(1001,'���������Ͻ�');
INSERT INTO publisher(publisher_id, publisher_name)
    VALUES(1002,'������');
INSERT INTO publisher(publisher_id, publisher_name)
    VALUES(1003,'INFINITY BOOKS');
INSERT INTO publisher(publisher_id, publisher_name)
    VALUES(1004,'�Ѻ��̵��');
INSERT INTO publisher(publisher_id, publisher_name)
    VALUES(1005,'�������ۺ���');
INSERT INTO publisher(publisher_id, publisher_name)
    VALUES(1006,'���ؼ�');
INSERT INTO publisher(publisher_id, publisher_name)
    VALUES(1007,'���');
    
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
    VALUES('in6121','amaco78','����ȫ','781216','1695713','01097833038','amaco78@gmail.com');
    
CREATE TABLE department (
    department_id NUMBER(4) PRIMARY KEY,
    department_name VARCHAR2(255)NOT NULL
);
INSERT INTO department(department_id,department_name) VALUES(1100,'����');
INSERT INTO department(department_id,department_name) VALUES(1200,'����');
INSERT INTO department(department_id,department_name) VALUES(1300,'����');
INSERT INTO department(department_id,department_name) VALUES(1400,'ȸ��');

CREATE TABLE employee (
    employee_id NUMBER(4) PRIMARY KEY,
    employee_name VARCHAR2(50)NOT NULL,
    department_id NUMBER(4)NOT NULL,
    CONSTRAINT employee_department_id_fk FOREIGN KEY(department_id) REFERENCES department(department_id)
);
INSERT INTO employee(employee_id,employee_name,department_id) VALUES(1001,'����ȫ',1200);

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
    VALUES(9791195334247,1001,'��ŷ �� ���� JAVA ��ť���ڵ�','�迵��',27000,30000);
INSERT INTO book(ISBN, publisher_id, book_title, book_author, purchase_price, sell_price)
    VALUES(9791159492372,1002,'ERP ���������� ����1��','������,������',20000,22000);
INSERT INTO book(ISBN, publisher_id, book_title, book_author, purchase_price, sell_price)
    VALUES(9791187370680,1005,'HTML5+CSS3 �� ǥ���� ����','�����',25000,28000); 
INSERT INTO book(ISBN, publisher_id, book_title, book_author, purchase_price, sell_price)
    VALUES(9788979143713,1004,'Head First Java','���̽� �ÿ���,��Ʈ ������',25000,28000); 
INSERT INTO book(ISBN, publisher_id, book_title, book_author, purchase_price, sell_price)
    VALUES(9791185578217,1003,'��� Java�� ó������','õ�α�',30000,33000);
INSERT INTO book(ISBN, publisher_id, book_title, book_author, purchase_price, sell_price)
    VALUES(9791160500325,1007,'�ó��� ����ó����� �ʱ�','����˾ص�',28000,31000);
INSERT INTO book(ISBN, publisher_id, book_title, book_author, purchase_price, sell_price)
    VALUES(9788993827941,1006,'JavaScript and jQuery:The Missing Manual','���̺�� ���̾� ���ķ���',30000,35000);
    
CREATE TABLE stock (
    ISBN CHAR(13) PRIMARY KEY,
    stock NUMBER(4) NOT NULL,
    stock_state NUMBER(4) DEFAULT 3110,
    CONSTRAINT stock_ISBN_fk FOREIGN KEY (ISBN) REFERENCES book(ISBN)
);
-- stock_state : 
-- O = SoldOut     P = Pending    S = OnSale

CREATE TABLE orders (
    order_id CHAR(10) PRIMARY KEY,
    publisher_id NUMBER(4) NOT NULL,
    customer_id VARCHAR2(20),
    employee_id NUMBER(4),
    CONSTRAINT orders_publisher_id_fk FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    CONSTRAINT orders_customer_id_fk FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT orders_employee_id_fk FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

CREATE TABLE orderDetail (
    order_id CHAR(10) NOT NULL,
    detail_number NUMBER(2) NOT NULL,
    ISBN CHAR(13) NOT NULL,
    purchase_price NUMBER(6) NOT NULL,
    sell_price NUMBER(6) NOT NULL,
    order_quantity NUMBER(4) DEFAULT 0,
    order_state NUMBER(4) NOT NULL,
    CONSTRAINT orderDetail_order_id_fk FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    CONSTRAINT orderDetail_ISBN_fk FOREIGN KEY (ISBN) REFERENCES stock(ISBN),
    CONSTRAINT orderDetail_pk PRIMARY KEY(order_id, detail_number)
);

CREATE TABLE ledger (
    leder_id CHAR(10) PRIMARY KEY,
    order_id CHAR(10) NOT NULL,
    detail_number NUMBER(2) NOT NULL,
    debit_credit CHAR(1) NOT NULL,
    leder_state NUMBER(4) NOT NULL,
    CONSTRAINT ledger_orderDetail_id_fk FOREIGN KEY (order_id, detail_number) REFERENCES orderDetail(order_id, detail_number)
);
--------------------------------------------------------------------------------
-- �Խ���
--------------------------------------------------------------------------------
CREATE TABLE bms_board (
     num NUMBER(5), --�۹�ȣ
	 writer     VARCHAR2(20)    NOT NULL, --�ۼ���
	 passwd     VARCHAR2(10)    NOT NULL, --��й�ȣ
	 subject    VARCHAR2(50)    NOT NULL, --������
	 content    VARCHAR2(500), --�۳���
	 readCnt    NUMBER(5)       DEFAULT 0, --��ȸ��
	 ref        NUMBER(5)       DEFAULT 0, --�׷�ȭ ���̵�
	 ref_step   NUMBER(5)       DEFAULT 0, --�׷� ����
	 ref_level  NUMBER(5)       DEFAULT 0, --�׷� ����
	 reg_date   TIMESTAMP       DEFAULT SYSDATE, --�ۼ���
	 ip         VARCHAR2(15),
     CONSTRAINT mvc_board_num_pk PRIMARY KEY(num)--ip
);
INSERT INTO bms_board(num,writer,passwd,subject,content,readCnt,ref,ref_step,ref_level,reg_date,ip)
VALUES(BOARD_SEQ.NEXTVAL,'����ȫ1','carrot','�׽�Ʈ����1','�׽�Ʈ�����Դϴ�1.',0,BOARD_SEQ.CURRVAL,0,0,SYSDATE,'192.168.1.4');

CREATE SEQUENCE board_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999;
--------------------------------------------------------------------------------
-- å �߰��� STOCK ���̺� �ش� �� �߰�
--------------------------------------------------------------------------------
DROP TRIGGER trigger_makestock;
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigger_makestock
    AFTER INSERT
    ON book
    FOR EACH ROW
BEGIN
    dbms_output.put_line('Trigger running');
    INSERT INTO stock
    VALUES(:NEW.ISBN, 0, 3110);
    dbms_output.put_line('Trigger operation successed');
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('ERR CODE'||TO_CHAR(SQLCODE));
            dbms_output.put_line('ERR MESSAGE'||SQLERRM);
END;
/
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:ALL'; 
--------------------------------------------------------------------------------
COMMIT;
ROLLBACK;
DROP TABLE publisher;
DROP TABLE customer;
DROP TABLE department;
DROP TABLE employee;
DROP TABLE book;
DROP TABLE stock;
DROP TABLE orders;
DROP TABLE orderDetail;
DROP TABLE ledger;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM SYS.USER_CONSTRAINTS;
  
SELECT *
FROM	(SELECT B.ISBN,B.book_title,B.book_author,P.publisher_name,
                B.purchase_price,B.sell_price,S.stock,S.stock_state,rownum rNum
        FROM book B, publisher P, stock S
        WHERE B.publisher_id = P.publisher_id
        AND B.ISBN = S.ISBN
        AND B.publisher_id = CASE B.publisher_id
                                WHEN 0 THEN B.publisher_id
                                ELSE B.publisher_id
                            END
        AND S.stock_state = CASE S.stock_state
                                WHEN '0' THEN S.stock_state
                                ELSE S.stock_state
                            END
        AND S.stock <= CASE S.stock
                            WHEN 0 THEN S.stock
                            ELSE S.stock
                            END
        )
WHERE rNum >= 1 AND rNum <= 5;

SELECT sum(B.purchase_price*S.stock), sum(B.sell_price*S.stock), sum(stock)
FROM    book B, stock S
WHERE   B.ISBN = S.ISBN;

SELECT *
FROM book B, publisher P, stock S
WHERE B.PUBLISHER_ID = P.PUBLISHER_ID
AND B.ISBN = S.ISBN
AND S.STOCK_STATE = 'S';
--------------------------------------------------------------------------------
-- orderid ������ ���� �� ��¥ ����� ������ �ʱ�ȭ ���ν���
--------------------------------------------------------------------------------
DROP SEQUENCE orderid_serialNo_seq;
CREATE SEQUENCE orderid_serialNo_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99
    CYCLE;

DROP PROCEDURE orderid_serialNo_seq_RESET;
CREATE OR REPLACE PROCEDURE orderid_serialNo_seq_RESET
      (SEQ_MAXVAL IN NUMBER)
IS
      SEQ_NOW NUMBER(2) := 0;
      SEQ_RESET NUMBER(2) := 0;
BEGIN
      SEQ_NOW := orderid_serialNo_seq.NEXTVAL;
      IF(SEQ_NOW != 0) THEN
      SEQ_RESET := SEQ_MAXVAL - SEQ_NOW;
      END IF;
      FOR I IN 1..SEQ_RESET LOOP
            SEQ_NOW := orderid_serialNo_seq.NEXTVAL;
      END LOOP;
END;
/

SELECT orderid_serialNo_seq.NEXTVAL
FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYMMDD')||LPAD(orderid_serialNo_seq.CURRVAL,2,0)
FROM DUAL;
EXECUTE orderid_serialNo_seq_RESET(99);

--------------------------------------------------------------------------------
-- order_id = order_code || order_date(yymmdd) || serial_nember
--------------------------------------------------------------------------------
-- ����
INSERT INTO orders(ORDER_ID,PUBLISHER_ID,CUSTOMER_ID,EMPLOYEE_ID)
VALUES  ('SE'||TO_CHAR(SYSDATE,'YYMMDD')||LPAD(orderid_serialNo_seq.CURRVAL,2,0),
        null,'in6121',1001);
--------------------------------------------------------------------------------
-- orderlist
--------------------------------------------------------------------------------
SELECT *
FROM    (SELECT O.order_id,OD.detail_number,B.book_title,
                S.stock,OD.order_quantity,OD.order_approval,rownum rNum
        FROM orders O, orderDetail OD, stock S, book B 
        WHERE   O.order_id = OD.order_id
        AND     OD.ISBN = S.ISBN
        AND     S.ISBN = B.ISBN
        )
WHERE rNum >= 1 AND rNUM <= 100;
-- �� ���/��
SELECT NVL(sum(B.PURCHASE_PRICE),0)
FROM book B, orderdetail O
WHERE B.ISBN = O.ISBN
AND SUBSTR(O.order_id,1,2) = 'PU'
AND TO_DATE(SUBSTR(O.order_id,3,6), 'YYMMDD') >= TRUNC(SYSDATE, 'MONTH')
AND TO_DATE(SUBSTR(O.order_id,3,6), 'YYMMDD') <= LAST_DAY(SYSDATE)
AND O.ORDER_APPROVAL = 'Y';
-- �� �����/��
SELECT NVL(sum(B.SELL_PRICE),0)
FROM book B, orderdetail O
WHERE B.ISBN = O.ISBN
AND SUBSTR(O.order_id,1,2) = 'SE'
AND TO_DATE(SUBSTR(O.order_id,3,6), 'YYMMDD') >= TRUNC(SYSDATE, 'MONTH')
AND TO_DATE(SUBSTR(O.order_id,3,6), 'YYMMDD') <= LAST_DAY(SYSDATE);

--------------------------------------------------------------------------------
-- ���� �˻� sql
--------------------------------------------------------------------------------
SELECT  *
FROM    (SELECT O.order_id,OD.detail_number,B.book_title,
        OD.purchase_price,OD.sell_price,S.stock,
        OD.order_quantity,OD.order_approval,rownum rNum		
        FROM orders O, orderDetail OD, stock S, book B
        WHERE   O.order_id = OD.order_id
        AND     OD.ISBN = S.ISBN
        AND     S.ISBN = B.ISBN
        AND		SUBSTR(OD.order_id,3,6) >= TO_CHAR(NVL(NULL,SYSDATE-365),'YYMMDD')
        AND		SUBSTR(OD.order_id,3,6) <= TO_CHAR(NVL(NULL,SYSDATE),'YYMMDD')
        AND 	SUBSTR(OD.order_id,1,2) = CASE NVL(NULL,'0')
                WHEN '0' THEN SUBSTR(OD.order_id,1,2) ELSE 'PU' END
		AND		OD.order_approval = CASE NVL(NULL,'0')
				WHEN '0' THEN OD.order_approval ELSE 'Y' END
		);
        

SELECT B.ISBN,B.BOOK_TITLE, B.SELL_PRICE book_price, OD.SELL_PRICE, OD.ORDER_QUANTITY,
        (OD.SELL_PRICE*OD.ORDER_QUANTITY) TOTAL_PRICE, O.customer_id	
FROM    orders O, orderDetail OD, stock S, book B
WHERE   O.order_id = OD.order_id
AND     OD.ISBN = S.ISBN
AND     S.ISBN = B.ISBN
AND     SUBSTR(OD.order_id,1,2) = 'PU'
AND     OD.order_approval = 'Y'
AND     O.CUSTOMER_ID = 'in6121';