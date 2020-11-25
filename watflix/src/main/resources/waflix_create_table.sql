/*계정상태*/
CREATE TABLE ACC_STATUS(
   ACC_STATUS_NO NUMBER PRIMARY KEY,
   ACC_STATUS_INFO VARCHAR2(100) NOT NULL
)

/*사용자*/
CREATE TABLE MEMBER(
	ID VARCHAR2(100) PRIMARY KEY,
	PASSWORD VARCHAR2(100) NOT NULL,
	NAME VARCHAR2(100) NOT NULL,
	TEL VARCHAR2(100),
	BIRTH DATE,
	SEX VARCHAR2(100) CHECK (SEX IN ('남성', '여성')),
	EMAIL VARCHAR2(100) NOT NULL,
	ADDRESS VARCHAR2(100),
	LOGIN_TIME DATE,
	LOGIN_FAIL NUMBER DEFAULT 0,
	POINT NUMBER DEFAULT 0,
	SIGNUP_DATE DATE DEFAULT SYSDATE,
	AGREEMENT VARCHAR2(100) CHECK (AGREEMENT IN ('동의', '비동의')),
	ACC_STAUTS_NO NUMBER DEFAULT 0,
	CONSTRAINT MEMBER_ACC_STAUTS_NO_FK FOREIGN KEY(ACC_STAUTS_NO) REFERENCES ACC_STATUS(ACC_STATUS_NO) on delete cascade
)

/*컨텐츠*/
CREATE TABLE CONTENTS(
	CONTENTS_NO VARCHAR2(100) PRIMARY KEY,
	CONTENTS_TITLE VARCHAR2(4000) NOT NULL,
	CONTENTS_TYPE VARCHAR2(100) NOT NULL,
	CONTENTS_GENRE VARCHAR2(100) NOT NULL,
	CONTENTS_SUMMARY CLOB NOT NULL,
	CONTENTS_TRAILER CLOB NOT NULL,
	CONTENTS_AVG_STARS NUMBER DEFAULT 0,
	CONTENTS_LIKES NUMBER DEFAULT 0,
	CONTENTS_HITS NUMBER DEFAULT 0
)

/*컨텐츠포스터*/
CREATE TABLE CONTENTS_POSTER(
	CONTENTS_PIC_NAME VARCHAR(4000) NOT NULL,
	CONTENTS_NO VARCHAR2(1000) NOT NULL,
	CONSTRAINT CONTENTS_POSTER_NO_FK FOREIGN KEY(CONTENTS_NO) REFERENCES CONTENTS(CONTENTS_NO) on delete cascade,
	CONSTRAINT CONTENTS_POSTER_PK PRIMARY KEY(CONTENTS_PIC_NAME, CONTENTS_NO)
	)

	/*평점*/
CREATE TABLE COMMENTS(
	COMMENTS_NO VARCHAR(100) PRIMARY KEY,
	ID VARCHAR2(100) NOT NULL,
	CONSTRAINT COMMENTS_ID_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) on delete cascade,
	CONTENTS_NO VARCHAR2(100) NOT NULL,
	CONSTRAINT COMMENT_CONTENTS_NO_FK FOREIGN KEY(CONTENTS_NO) REFERENCES CONTENTS(CONTENTS_NO) on delete cascade,
	COMMENTS  VARCHAR2(100) NOT NULL,
	COMMENTS_STARS NUMBER DEFAULT 0,
	COMMENTS_POSTED_TIME DATE DEFAULT SYSDATE
)

/*리뷰*/
CREATE TABLE REVIEW(
	REVIEW_NO VARCHAR2(100) PRIMARY KEY,
	ID VARCHAR2(100) NOT NULL,
	CONSTRAINT REVIEW_ID_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) on delete cascade,
	CONTENTS_NO VARCHAR2(100) NOT NULL,
	CONSTRAINT REVIEW_CONTENTS_NO_FK FOREIGN KEY(CONTENTS_NO) REFERENCES CONTENTS(CONTENTS_NO) on delete cascade,
	REVIEW_TITLE VARCHAR2(1000) NOT NULL,
	REVIEW_CONTENTS CLOB NOT NULL,
	REVIEW_HITS NUMBER DEFAULT 0,
	REVIEW_LIKES NUMBER DEFAULT 0,
	REVIEW_POSTED_DATE DATE DEFAULT SYSDATE
)

/*공지*/
create table NOTICE(
	NOTICE_NO VARCHAR2(100) primary key,
	ID VARCHAR2(100) NOT NULL,
	CONSTRAINT NOTICE_ID_FK FOREIGN KEY (ID) REFERENCES MEMBER(ID) on delete cascade,
	NOTICE_TITLE VARCHAR2(100) NOT NULL,
	NOTICE_CONTENTS CLOB not null,
	NOTICE_POSTED_TIME date default sysdate,
	NOTICE_HITS NUMBER default 0
)

/*신고타입*/
CREATE TABLE REPORT_TYPE(
	REPORT_TYPE_NO NUMBER  PRIMARY KEY,
	REPORT_TYPE_INFO VARCHAR2(100) NOT NULL
)

/*신고*/
create table REPORT(
	REPORT_NO  VARCHAR2(100) primary key,
	
	ID VARCHAR2(100) not null,
	CONSTRAINT REPORT_ID_FK FOREIGN KEY (ID) REFERENCES MEMBER(ID),
	
	REVIEW_NO VARCHAR2(100) not null,
	CONSTRAINT REPORT_REVIEW_NO_FK FOREIGN KEY (REVIEW_NO) REFERENCES REVIEW(REVIEW_NO),
	
	COMMENTS_NO VARCHAR2(100) NOT NULL,
	CONSTRAINT REPORT_COMMENTS_NO_FK FOREIGN KEY(COMMENTS_NO) REFERENCES COMMENTS(COMMENTS_NO),
	
	REPORT_TYPE_NO NUMBER NOT NULL,
	CONSTRAINT REPORT_TYPE_NO_FK FOREIGN KEY(REPORT_TYPE_NO) REFERENCES REPORT_TYPE(REPORT_TYPE_NO),
	
	REPORT_CONTENTS CLOB NOT NULL,
	REPORT_TIME DATE DEFAULT SYSDATE
)

/*상품*/
CREATE TABLE PRODUCT(
   PRODUCT_NO VARCHAR2(1000) PRIMARY KEY,
   PRODUCT_NAME VARCHAR2(100) NOT NULL,
   PRODUCT_POINT NUMBER NOT NULL,
   PRODUCT_DETAIL CLOB NOT NULL,
   PRODUCT_CATEGORY VARCHAR2(100) NOT NULL,
   PRODUCT_PIC VARCHAR2(1000) NOT NULL,
   PRODUCT_BRAND VARCHAR2(100) NOT NULL,
   PRODUCT_STOCK NUMBER DEFAULT 0
)

/*상품주문*/
CREATE TABLE PRODUCT_ORDER(
   ORDER_NO VARCHAR2(100) PRIMARY KEY,
   PRODUCT_NO VARCHAR2(1000) NOT NULL,
   CONSTRAINT ORDER_PRODUCT_NO_FK FOREIGN KEY(PRODUCT_NO) REFERENCES PRODUCT(PRODUCT_NO) ON DELETE CASCADE,
   ID VARCHAR2(100) NOT NULL,
   CONSTRAINT ORDER_ID_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) ON DELETE CASCADE,
   PURCHASED_TIME DATE DEFAULT SYSDATE
)


/*회원등급*/
CREATE TABLE GRADE(
   GRADE VARCHAR2(100) NOT NULL,
   ID VARCHAR2(100) NOT NULL,
   CONSTRAINT MEMBER_GRADE_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) ON DELETE CASCADE,
   CONSTRAINT MEMBER_GRADE_PK PRIMARY KEY(GRADE, ID)
)

CREATE TABLE FAQ_SERVICE (
   FAQ_NO VARCHAR2(100) PRIMARY KEY,
   ID VARCHAR2(100) NOT NULL,
   FAQ_TITLE VARCHAR2(100) NOT NULL,
   FAQ_CONTENTS CLOB NOT NULL,
   FAQ_POSTED_TIME DATE  DEFAULT SYSDATE,
   FAQ_HITS NUMBER DEFAULT 0,
   CONSTRAINT FAQ_SERVICE_ID_FK FOREIGN KEY (ID) REFERENCES MEMBER(ID)
)













