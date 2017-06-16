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
    employee_pw VARCHAR2(10) NOT NULL,
    employee_name VARCHAR2(50)NOT NULL,
    department_id NUMBER(4)NOT NULL,
    CONSTRAINT employee_department_id_fk FOREIGN KEY(department_id) REFERENCES department(department_id)
);
INSERT INTO employee(employee_id,employee_name,department_id) VALUES(1001,'carrot','이인홍',1200);

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
-- 게시판
--------------------------------------------------------------------------------
CREATE TABLE bms_board (
     num NUMBER(5), --글번호
	 writer     VARCHAR2(20)    NOT NULL, --작성자
	 passwd     VARCHAR2(10)    NOT NULL, --비밀번호
	 subject    VARCHAR2(255)    NOT NULL, --글제목
	 content    VARCHAR2(500), --글내용
	 readCnt    NUMBER(5)       DEFAULT 0, --조회수
	 ref        NUMBER(5)       DEFAULT 0, --그룹화 아이디
	 ref_step   NUMBER(5)       DEFAULT 0, --그룹 스탭
	 ref_level  NUMBER(5)       DEFAULT 0, --그룹 레벨
	 reg_date   TIMESTAMP       DEFAULT SYSDATE, --작성일
	 ip         VARCHAR2(15),
     announce   CHAR(1)         DEFAULT 'N'
     CONSTRAINT mvc_board_num_pk PRIMARY KEY(num)--ip
);

INSERT INTO bms_board(num,writer,passwd,subject,content,readCnt,ref,ref_step,ref_level,reg_date,ip)
VALUES(BOARD_SEQ.NEXTVAL,'이인홍1','carrot','테스트제목1','테스트내용입니다1.',0,BOARD_SEQ.CURRVAL,0,0,SYSDATE,'192.168.1.4');

CREATE SEQUENCE board_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999;
    
DROP TABLE bms_review;
CREATE TABLE bms_review (
     num            NUMBER(5)       PRIMARY KEY, --글번호
	 ISBN           CHAR(13)        NOT NULL,   --제품번호
     customer_id    VARCHAR2(20)    NOT NULL,   --작성자
	 content        VARCHAR2(500),              --글내용
     starpoint      NUMBER(1)       DEFAULT 3,
	 reg_date       TIMESTAMP       DEFAULT SYSDATE, --작성일
     CONSTRAINT bms_review_ISBN_fk FOREIGN KEY(ISBN) REFERENCES book(ISBN)
);
INSERT INTO bms_review
VALUES(review_seq.NEXTVAL,'9791159492372','in6121','배송빨라요',5,SYSDATE);

SELECT R.num, R.ISBN, B.book_title, R.customer_id, R.content, R.starpoint, R.reg_date 
FROM bms_review R, book B 
WHERE R.ISBN = B.ISBN
AND R.ISBN = '9791159492372'
ORDER BY reg_date DESC;

CREATE SEQUENCE review_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999;
--------------------------------------------------------------------------------
-- 책 추가시 STOCK 테이블에 해당 행 추가
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
                B.purchase_price,B.sell_price,S.stock,S.stock_state
        FROM book B, publisher P, stock S
        WHERE B.publisher_id = P.publisher_id
        AND B.ISBN = S.ISBN
        AND B.book_title like '%'||NVL(null,B.book_title)||'%'
        UNION
         SELECT B.ISBN,B.book_title,B.book_author,P.publisher_name,
                B.purchase_price,B.sell_price,S.stock,S.stock_state
        FROM book B, publisher P, stock S
        WHERE B.publisher_id = P.publisher_id
        AND B.ISBN = S.ISBN
        AND B.book_author like '%'||NVL(null,B.book_title)||'%'
        INTERSECT
        SELECT B.ISBN,B.book_title,B.book_author,P.publisher_name,
                B.purchase_price,B.sell_price,S.stock,S.stock_state
        FROM book B, publisher P, stock S
        WHERE B.publisher_id = P.publisher_id
        AND B.ISBN = S.ISBN
        AND B.publisher_id = CASE B.publisher_id
                            WHEN 0 THEN B.publisher_id
                            ELSE B.publisher_id
                            END
        AND S.stock_state = CASE S.stock_state
                            WHEN 0 THEN S.stock_state
                            ELSE S.stock_state
                            END
        )
order by 1;
        

SELECT sum(B.purchase_price*S.stock), sum(B.sell_price*S.stock), sum(stock)
FROM    book B, stock S
WHERE   B.ISBN = S.ISBN;

SELECT *
FROM book B, publisher P, stock S
WHERE B.PUBLISHER_ID = P.PUBLISHER_ID
AND B.ISBN = S.ISBN
AND S.STOCK_STATE = 'S';
--------------------------------------------------------------------------------
-- orderid 시퀀스 적용 및 날짜 변경시 시퀀스 초기화 프로시져
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
-- 구매
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
-- 총 비용/월
SELECT NVL(sum(B.PURCHASE_PRICE),0)
FROM book B, orderdetail O
WHERE B.ISBN = O.ISBN
AND SUBSTR(O.order_id,1,2) = 'PU'
AND TO_DATE(SUBSTR(O.order_id,3,6), 'YYMMDD') >= TRUNC(SYSDATE, 'MONTH')
AND TO_DATE(SUBSTR(O.order_id,3,6), 'YYMMDD') <= LAST_DAY(SYSDATE)
AND O.ORDER_APPROVAL = 'Y';
-- 총 매출액/월
SELECT NVL(sum(B.SELL_PRICE),0)
FROM book B, orderdetail O
WHERE B.ISBN = O.ISBN
AND SUBSTR(O.order_id,1,2) = 'SE'
AND TO_DATE(SUBSTR(O.order_id,3,6), 'YYMMDD') >= TRUNC(SYSDATE, 'MONTH')
AND TO_DATE(SUBSTR(O.order_id,3,6), 'YYMMDD') <= LAST_DAY(SYSDATE);

--------------------------------------------------------------------------------
-- 오더 검색 sql
--------------------------------------------------------------------------------
SELECT  *
FROM    (
        SELECT O.order_id,OD.detail_number,B.book_title,
        OD.purchase_price,OD.sell_price,S.stock,
        OD.order_quantity,OD.order_state
        FROM orders O, orderDetail OD, stock S, book B
        WHERE   O.order_id = OD.order_id
        AND     OD.ISBN = S.ISBN
        AND     S.ISBN = B.ISBN
        AND B.book_title like '%'||NVL('Java',B.book_title)||'%'
        INTERSECT
        SELECT O.order_id,OD.detail_number,B.book_title,
        OD.purchase_price,OD.sell_price,S.stock,
        OD.order_quantity,OD.order_state		
        FROM orders O, orderDetail OD, stock S, book B
        WHERE   O.order_id = OD.order_id
        AND     OD.ISBN = S.ISBN
        AND     S.ISBN = B.ISBN
        AND		SUBSTR(OD.order_id,3,6) >= TO_CHAR(NVL(NULL,SYSDATE-365),'YYMMDD')
        AND		SUBSTR(OD.order_id,3,6) <= TO_CHAR(NVL(NULL,SYSDATE),'YYMMDD')
        AND 	SUBSTR(OD.order_id,1,2) = CASE NVL(NULL,'0')
                WHEN '0' THEN SUBSTR(OD.order_id,1,2) ELSE 'PU' END
		AND		OD.order_state = CASE NVL(NULL,0)
				WHEN 0 THEN OD.order_state ELSE 0 END
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

--------------------------------------------------------------------------------
-- 베스트셀러 검색
--------------------------------------------------------------------------------
SELECT  *
FROM    (SELECT B.ISBN, B.publisher_id, B.book_title, B.book_author,
                B.purchase_price, B.sell_price, P.publisher_name, O.order_id,
                SUM(O.ORDER_QUANTITY), rownum rNum
        FROM    book B INNER JOIN publisher P
        ON      (B.publisher_id = P.publisher_id) INNER JOIN stock S
        ON      (B.ISBN = S.ISBN AND S.STOCK_STATE IN (3120,3130)) INNER JOIN orderDetail O
        ON      (S.ISBN = O.ISBN AND O.ORDER_STATE IN (2120,2210,2230))
        GROUP BY B.ISBN, B.publisher_id, B.book_title, B.book_author,
        B.purchase_price, B.sell_price, P.publisher_name, O.order_id, rownum
        ORDER BY SUM(O.ORDER_QUANTITY) DESC
        )
WHERE rNum >=1 AND rNum <= 10;

SELECT ISBN, SUM(order_quantity)
FROM (
        SELECT *
        FROM orderdetail
        WHERE order_state IN (2120,2210,2230)
    )
GROUP BY ISBN
ORDER BY SUM(order_quantity) DESC;



SELECT *
FROM    (SELECT num, writer, passwd, subject, content, readCnt,
                ref, ref_step, ref_level, reg_date, ip, rownum rNum
                FROM    (SELECT * FROM mvc_board
                        ORDER BY ref DESC, ref_step ASC
                        )
        )
WHERE rNum >= 5 AND rNum <= 15;
--------------------------------------------------------------------------------
-- 주간 판매 트랜드 분석
--------------------------------------------------------------------------------
SELECT      TO_CHAR(TO_DATE(SUBSTR(order_id,3,6),'YYMMDD'),'W'),
            SUM(order_quantity),
            SUM(sell_price*order_quantity/10000)
FROM        ORDERDETAIL
WHERE       order_state IN (2120,2210,2230)
AND         TO_CHAR(TO_DATE(SUBSTR(order_id,3,6),'YYMMDD'),'MM') = TO_CHAR(SYSDATE,'MM')
GROUP BY    TO_CHAR(TO_DATE(SUBSTR(order_id,3,6),'YYMMDD'),'W')
ORDER BY    1;