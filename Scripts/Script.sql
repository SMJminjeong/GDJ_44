--DEMOMEMBE TABLE 생성 쿼리
CREATE TABLE DEMOMEMBER(
	ID VARCHAR2(50) NOT NULL,
	PW VARCHAR2(300) NOT NULL,
	NAME VARCHAR2(100) NOT NULL,
	EMAIL VARCHAR2(100) NOT NULL,
	PHONE VARCHAR2(50) NOT NULL,
	AUTH VARCHAR2(20) NOT NULL,
	DELFLAG CHAR(1) NOT NULL,
	REGDATE DATE NOT NULL,
	CONSTRAINT "DEMOMEMBER_PK" PRIMARY KEY (ID)
);

--DEMOBOARD TABLE 생성 쿼리
CREATE TABLE DEMOBOARD(
	SEQ NUMBER,
	ID VARCHAR2(50) NOT NULL,
	TITLE VARCHAR2(200) NOT NULL,
	CONTENT VARCHAR2(4000),
	STEP NUMBER NOT NULL,
	DEPTH NUMBER NOT NULL,
	REFER NUMBER NOT NULL,
	READCOUNT NUMBER,
	DELFLAG CHAR(1) NOT NULL,
	REGDATE DATE NOT NULL,
	CONSTRAINT "DEMOBOARD_PK" PRIMARY KEY (SEQ),
	CONSTRAINT "DEMOBOARD_FK" FOREIGN KEY ("ID") REFERENCES DEMOMEMBER ("ID")
);

--DEMOBOARD_SEQ SEQ 1씩 증가 쿼리
CREATE SEQUENCE DEMOBOARD_SEQ START WITH 1 INCREMENT BY 1;

--DEMOMEMBER 암호화 전 더미 테이블 회원생성(ROLE_USER) 쿼리
INSERT INTO DEMOMEMBER (ID, PW, NAME, EMAIL, PHONE, AUTH, DELFLAG, REGDATE)
VALUES('DEMO05', '1234', 'DEMO05', 'DEMO05@gmail.com', '010-1234-5678', 'ROLE_USER', 'N', SYSDATE);
--DEMOMEMBER 암호화 전 더미 테이블 회원생성(ROLE_ADMIN) 쿼리
INSERT INTO DEMOMEMBER (ID, PW, NAME, EMAIL, PHONE, AUTH, DELFLAG, REGDATE)
VALUES('ADMIN', '1234', 'ADMIN', 'ADMIN@gmail.com', '010-1234-5678', 'ROLE_ADMIN', 'N', SYSDATE);


-------DEMOMEMBER_STATEMENT QUERY-------
--(1) DEMOMEMBER 회원 전체조회 쿼리 (등록일순 내림차순)
SELECT ID, NAME, EMAIL, PHONE, AUTH, DELFLAG, REGDATE
	FROM DEMOMEMBER 
		ORDER BY REGDATE DESC;
--(2) DEMOMEMBER 회원가입 쿼리 
INSERT INTO DEMOMEMBER (ID, PW, NAME, EMAIL, PHONE, AUTH, DELFLAG, REGDATE)
VALUES('DEMO05', '1234', 'DEMO05', 'DEMO05@gmail.com', '010-1234-5678', 'ROLE_USER', 'N', SYSDATE);	
--(3) DEMOMEMBER 로그인(아이디, 비밀번호, 사용여부='N') 쿼리
SELECT ID, NAME, EMAIL, PHONE, AUTH, REGDATE
	FROM DEMOMEMBER WHERE ID='DEMO01' AND PW='1234' AND DELFLAG='N';
-------------------------------------------------------
