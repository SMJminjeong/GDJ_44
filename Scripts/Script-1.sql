--------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE SUBJECT;
----- 1) 과목테이블 생성 쿼리
CREATE TABLE SUBJECT (
	SUB_NUM VARCHAR2(50),
	SUB_TITLE VARCHAR2(300),
	SUB_CONTENT VARCHAR2 (1000),
	SUB_KEYWORD JSON,
	SUB_TAG JSON ,
	SUB_CODE VARCHAR2(30),
	SUB_REGDATE DATE DEFAULT SYSDATE,
	SUB_REG_ID VARCHAR2(100),
	SUB_REG_CODE VARCHAR2(30),
	SUB_INS VARCHAR2(100) ,
	SUB_STATUS CHAR(1) DEFAULT 'W',
	SUB_REJECTION VARCHAR2(500),
	CONSTRAINT "SUBJECT_PK" PRIMARY KEY (SUB_NUM),
	CONSTRAINT "SUBJECT_FK" FOREIGN KEY ("SUB_CODE") REFERENCES SUB_CODE (COD_CODE)
);
----- 1-1) 과목테이블 SUB_REGISTER TABLE 등록자코드 제약조건 추가 쿼리
ALTER TABLE SUBJECT 
	ADD CONSTRAINT "SUBJECT_REG_FK" FOREIGN KEY ("SUB_REG_CODE") REFERENCES SUB_REGISTER ("REG_CODE");
----- 1-2) 과목테이블 SEQUENCE 생성
CREATE SEQUENCE SUB_SEQ START WITH 100 INCREMENT BY 1;
----- 1-3) SUBJECT테이블 COMMENT 추가
COMMENT ON TABLE SUBJECT IS '과목';
COMMENT ON COLUMN SUBJECT.SUB_NUM  IS '과목 번호';
COMMENT ON COLUMN SUBJECT.SUB_TITLE  IS '과목명';
COMMENT ON COLUMN SUBJECT.SUB_CONTENT  IS '과목 설명';
COMMENT ON COLUMN SUBJECT.SUB_KEYWORD  IS '과목 키워드';
COMMENT ON COLUMN SUBJECT.SUB_TAG  IS '사용자입력 과목태그';
COMMENT ON COLUMN SUBJECT.SUB_CODE  IS '정형태그 과목코드';
COMMENT ON COLUMN SUBJECT.SUB_REGDATE  IS '과목등록일';
COMMENT ON COLUMN SUBJECT.SUB_REG_ID  IS '과목등록ID';
COMMENT ON COLUMN SUBJECT.SUB_REG_CODE  IS '과목등록자코드';
COMMENT ON COLUMN SUBJECT.SUB_INS  IS '과목담당강사';
COMMENT ON COLUMN SUBJECT.SUB_STATUS  IS '과목승인상태';
COMMENT ON COLUMN SUBJECT.SUB_REJECTION  IS '과목반려사유';

--------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE SUB_CURRICULUM;
----- 2) 과목커리큘럼테이블 생성 쿼리
CREATE TABLE SUB_CURRICULUM (
	CUR_SEQ NUMBER,
	CUR_SUB_NUM VARCHAR2(50),
	CUR_DETAIL JSON ,
	CUR_SUBCONTENT VARCHAR2(4000),
	CUR_VERSION VARCHAR2(100),
	CUR_TIME VARCHAR2(100) ,
	CUR_LEVEL VARCHAR2(10),
	CONSTRAINT "SUB_CURRICULUM_PK" PRIMARY KEY (CUR_SEQ),
	CONSTRAINT "SUB_CURRICULUM_FK" FOREIGN KEY ("CUR_SUB_NUM") REFERENCES SUBJECT ("SUB_NUM")
);
----- 2-1) 과목커리큘럼테이블 SEQUENCE 생성
CREATE SEQUENCE SUB_CUR_SEQ START WITH 100 INCREMENT BY 1;
----- 2-2) SUB_CURRICULUM테이블 COMMENT 추가
COMMENT ON TABLE SUB_CURRICULUM IS '과목 커리큘럼';
COMMENT ON COLUMN SUB_CURRICULUM.CUR_SEQ  IS '커리큘럼 번호';
COMMENT ON COLUMN SUB_CURRICULUM.CUR_SUB_NUM  IS '과목번호';
COMMENT ON COLUMN SUB_CURRICULUM.CUR_DETAIL  IS '커리큘럼 상세내용';
COMMENT ON COLUMN SUB_CURRICULUM.CUR_SUBCONTENT  IS '커리큘럼 기타내용';
COMMENT ON COLUMN SUB_CURRICULUM.CUR_VERSION  IS '과목 버전';
COMMENT ON COLUMN SUB_CURRICULUM.CUR_TIME  IS '과목 시간';
COMMENT ON COLUMN SUB_CURRICULUM.CUR_LEVEL  IS '과목 난이도';

--------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE SUB_CODE;
----- 3) 과목코드 및 태그(정형화) 테이블 생성 쿼리
CREATE TABLE SUB_CODE (
	COD_CODE VARCHAR2(30),
	COD_NAME VARCHAR2(50), 
	COD_TAG JSON,
	CONSTRAINT "SUB_CODE_PK" PRIMARY KEY (COD_CODE)
);
----- 3-1) SUB_CODE테이블 SEQUENCE 생성
CREATE SEQUENCE SUB_CODE_SEQ START WITH 100 INCREMENT BY 1;
----- 3-2) SUB_CODE테이블 COMMENT 추가
COMMENT ON TABLE SUB_CODE IS '정형화된 과목별 태그';
COMMENT ON COLUMN SUB_CODE.COD_CODE  IS '과목별 카테고리코드';
COMMENT ON COLUMN SUB_CODE.COD_NAME  IS '과목명';
COMMENT ON COLUMN SUB_CODE.COD_TAG  IS '과목카테고리별 과목태그';

--------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE SUB_REGISTER;
----- 4) 과목등록 학생/강사 구분 테이블 생성 쿼리
CREATE TABLE SUB_REGISTER (
	REG_CODE VARCHAR2(30),
	REG_CATE CHAR(1),
	REG_ID VARCHAR2(100),
	CONSTRAINT "SUB_REGISTER_PK" PRIMARY KEY (REG_CODE)
);
----- 4-1) 과목커리큘럼테이블 SEQUENCE 생성
CREATE SEQUENCE SUB_REG_SEQ START WITH 100 INCREMENT BY 1;
----- 4-2) 과목테이블 COMMENT 추가
COMMENT ON TABLE SUB_REGISTER IS '과목등록자 구분';
COMMENT ON COLUMN SUB_REGISTER.REG_CODE  IS '과목 등록자코드';
COMMENT ON COLUMN SUB_REGISTER.REG_CATE  IS '등록자 구분코드';
COMMENT ON COLUMN SUB_REGISTER.REG_ID  IS '과목등록ID';
--------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO SUBJECT (SUB_NUM, 
												SUB_TITLE, 
												SUB_CONTENT, 
												SUB_KEYWORD, 
												SUB_TAG, 
												SUB_CODE, 
												SUB_REGDATE, 
												SUB_REG_ID, 
												SUB_REG_CODE, 
												SUB_INS, 
												SUB_STATUS, 
												SUB_REJECTION) 
								VALUES ('20210101SUB001',
												'실전! JPA 활용2 - API 개발과 성능 최적화',
												'스프링 부트와 JPA를 활용해서 API를 개발합니다. 그리고 JPA 극한의 성능 최적화 방법을 학습할 수 있습니다.',
												JSON_ARRAY('JPA','API'),
												JSON_ARRAY('#JAVA','#java','#Java','#자바','#스프링부트','#개발','#jpa'),
												'SUB001',
												to_date('20220510', 'RRRR-MM-DD'),
												'aspurret5m511',
												'REG001',
												NULL,
												'A',
												NULL);
												
	
INSERT INTO SUB_CODE (COD_CODE,
												COD_NAME ,
												COD_TAG)
								VALUES ('SUB'||SUB_CODE_SEQ.NEXTVAL,
												'DATABASE',
												JSON_ARRAY('#DATABASE','#데이터베이스','#DB'));
											
SELECT * FROM SUB_CODE ;

DESC SUB_CODE;
											


