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
   ACC_STATUS_NO NUMBER DEFAULT 0,
   CONSTRAINT MEMBER_ACC_STATUS_NO_FK FOREIGN KEY(ACC_STATUS_NO) REFERENCES ACC_STATUS(ACC_STATUS_NO) on delete cascade
)

/*장르코드*/
CREATE TABLE GENRE(
   GENRE_CODE VARCHAR2(1000) PRIMARY KEY,
   GENRE_NAME VARCHAR2(1000) NOT NULL
)

/*컨텐츠*/
CREATE TABLE CONTENTS(
   CONTENTS_NO VARCHAR2(1000) PRIMARY KEY,
   CONTENTS_TITLE VARCHAR2(4000) NOT NULL,
   CONTENTS_TYPE VARCHAR2(100) NOT NULL,
   GENRE_CODE VARCHAR2(1000) NOT NULL,
   CONSTRAINT CONTENTS_GENRE_CODE_FK FOREIGN KEY(GENRE_CODE) REFERENCES GENRE(GENRE_CODE) on delete cascade,
   CONTENTS_DATE NUMBER NOT NULL,
   CONTENTS_RUNNINGTIME VARCHAR2(100),
   CONTENTS_ACTOR VARCHAR2(4000) NOT NULL,
   CONTENTS_PRODUCER VARCHAR2(1000) DEFAULT '',
   CONTENTS_SUMMARY CLOB NOT NULL,
   CONTENTS_SMALL_THUMBNAIL VARCHAR2(4000) NOT NULL,
   CONTENTS_BIG_THUMBNAIL VARCHAR2(4000) NOT NULL,
   CONTENTS_AGE VARCHAR2(100) NOT NULL,
   CONTENTS_AVG_STARS NUMBER DEFAULT 0,
   CONTENTS_LIKES NUMBER DEFAULT 0,
   CONTENTS_HITS NUMBER DEFAULT 0
)

/*평점*/
CREATE TABLE COMMENTS(
   COMMENTS_NO NUMBER PRIMARY KEY,
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
   REVIEW_NO NUMBER PRIMARY KEY,
   ID VARCHAR2(100) NOT NULL,
   CONSTRAINT REVIEW_ID_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) on delete cascade,
   CONTENTS_NO VARCHAR2(100) NOT NULL,
   CONSTRAINT REVIEW_CONTENTS_NO_FK FOREIGN KEY(CONTENTS_NO) REFERENCES CONTENTS(CONTENTS_NO) on delete cascade,
   REVIEW_TITLE VARCHAR2(1000) NOT NULL,
   REVIEW_CONTENTS CLOB NOT NULL,
   REVIEW_HITS NUMBER DEFAULT 0,
   REVIEW_LIKES NUMBER DEFAULT 0,
   REVIEW_POSTED_TIME DATE DEFAULT SYSDATE,
   REVIEW_LIKE_STATUS NUMBER DEFAULT 0
)

/*공지*/
create table NOTICE(
   NOTICE_NO NUMBER primary key,
   ID VARCHAR2(100) NOT NULL,
   CONSTRAINT NOTICE_ID_FK FOREIGN KEY (ID) REFERENCES MEMBER(ID) on delete cascade,
   NOTICE_TITLE VARCHAR2(1000) NOT NULL,
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
   REPORT_NO NUMBER primary key,
   ID VARCHAR2(100) not null,
   CONSTRAINT REPORT_ID_FK FOREIGN KEY (ID) REFERENCES MEMBER(ID),
   REVIEW_NO NUMBER default null,
   CONSTRAINT REPORT_REVIEW_NO_FK FOREIGN KEY (REVIEW_NO) REFERENCES REVIEW(REVIEW_NO),
   COMMENTS_NO NUMBER default NULL,
   CONSTRAINT REPORT_COMMENTS_NO_FK FOREIGN KEY(COMMENTS_NO) REFERENCES COMMENTS(COMMENTS_NO),
   REPORT_TYPE_NO NUMBER NOT NULL,
   CONSTRAINT REPORT_TYPE_NO_FK FOREIGN KEY(REPORT_TYPE_NO) REFERENCES REPORT_TYPE(REPORT_TYPE_NO),
   REPORT_CONTENTS CLOB NOT NULL,
   REPORT_POSTED_TIME DATE DEFAULT SYSDATE
)

/*상품카테고리*/
CREATE TABLE PRODUCT_CATEGORY(
   PRODUCT_CATEGORY_NO NUMBER PRIMARY KEY,
   PRODUCT_CATEGORY_NAME VARCHAR2(100) NOT NULL
)

/*상품상태정보*/
CREATE TABLE PRO_STATUS(
   PRO_STATUS_NO NUMBER PRIMARY KEY,
   PRO_STATUS_INFO VARCHAR2(1000) NOT NULL
)

/*상품*/
CREATE TABLE PRODUCT(
   PRODUCT_NO NUMBER PRIMARY KEY,
   PRODUCT_NAME VARCHAR2(100) NOT NULL,
   PRODUCT_POINT NUMBER NOT NULL,
   PRODUCT_DETAIL CLOB NOT NULL,
   PRODUCT_CATEGORY_NO NUMBER NOT NULL,
   CONSTRAINT PRODUCT_CATEGORY_NO_FK FOREIGN KEY(PRODUCT_CATEGORY_NO) REFERENCES PRODUCT_CATEGORY(PRODUCT_CATEGORY_NO) ON DELETE CASCADE,
   PRODUCT_PIC VARCHAR2(1000) NOT NULL,
   PRODUCT_BRAND VARCHAR2(100) NOT NULL,
   PRODUCT_STOCK NUMBER DEFAULT 0,
   PRO_STATUS_NO  NUMBER DEFAULT 1,
   CONSTRAINT PRO_STATUS_NO_FK FOREIGN KEY(PRO_STATUS_NO) REFERENCES PRO_STATUS(PRO_STATUS_NO) ON DELETE CASCADE
)

/*상품주문*/
CREATE TABLE PRODUCT_ORDER(
   ORDER_NO NUMBER PRIMARY KEY,
   PRODUCT_NO NUMBER NOT NULL,
   CONSTRAINT ORDER_PRODUCT_NO_FK FOREIGN KEY(PRODUCT_NO) REFERENCES PRODUCT(PRODUCT_NO) ON DELETE CASCADE,
   QUANTITY NUMBER default 1,
   ID VARCHAR2(100) NOT NULL,
   CONSTRAINT ORDER_ID_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) ON DELETE CASCADE,
   PURCHASED_TIME DATE DEFAULT SYSDATE
)

/*포인트 사용내역*/
CREATE TABLE POINT_HISTORY(
	POINT_HISTORY_NO NUMBER PRIMARY KEY,
	ID VARCHAR2(100) NOT NULL,
	CONSTRAINT POINT_HISTORY_ID_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) ON DELETE CASCADE,
	REVIEW_NO NUMBER,
	CONSTRAINT POINT_HISTORY_REVIEWNO_FK FOREIGN KEY(REVIEW_NO) REFERENCES REVIEW(REVIEW_NO),
	COMMENTS_NO NUMBER,
	CONSTRAINT POINT_HISTORY_COMMENTNO_FK FOREIGN KEY(COMMENTS_NO) REFERENCES COMMENTS(COMMENTS_NO),
	ORDER_NO NUMBER,
	CONSTRAINT POINT_HISTORY_ORDERNO_FK FOREIGN KEY(ORDER_NO) REFERENCES PRODUCT_ORDER(ORDER_NO),
	POINT NUMBER NOT NULL,
	POINT_HISTORY_CONTENTS VARCHAR2(1000) NOT NULL,
	CURRENT_TIME DATE DEFAULT SYSDATE
)

/*회원등급*/
CREATE TABLE GRADE(
   GRADE VARCHAR2(100) NOT NULL,
   ID VARCHAR2(100) NOT NULL,
   CONSTRAINT MEMBER_GRADE_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) ON DELETE CASCADE,
   CONSTRAINT MEMBER_GRADE_PK PRIMARY KEY(GRADE, ID)
)

/*FAQ*/
CREATE TABLE FAQ(
   FAQ_NO NUMBER PRIMARY KEY,
   ID VARCHAR2(100) NOT NULL,
   FAQ_TITLE VARCHAR2(1000) NOT NULL,
   FAQ_CONTENTS CLOB NOT NULL,
   FAQ_POSTED_TIME DATE DEFAULT SYSDATE,
   FAQ_HITS NUMBER DEFAULT 0,
   CONSTRAINT FAQ_SERVICE_ID_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) ON DELETE CASCADE
)

/*QNA*/
CREATE TABLE QNA(
   QNA_NO NUMBER PRIMARY KEY,
   ID VARCHAR2(100) NOT NULL,
   QNA_TYPE_NO NUMBER NOT NULL,
   QNA_TITLE VARCHAR2(1000) NOT NULL,
   QNA_CONTENTS CLOB NOT NULL,
   QNA_POSTED_TIME DATE DEFAULT SYSDATE,
   CONSTRAINT QNA_ID_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) ON DELETE CASCADE,
   CONSTRAINT QNA_TYPE_NO_FK FOREIGN KEY(QNA_TYPE_NO) REFERENCES QNA_TYPE(QNA_TYPE_NO) ON DELETE CASCADE
)
/*QNA 타입*/
   CREATE TABLE QNA_TYPE(
   QNA_TYPE_NO NUMBER PRIMARY KEY,
   QNA_TYPE VARCHAR2(1000) NOT NULL
   )

/*QNA 답변*/
CREATE TABLE QNA_ANSWER(
   QNA_ANSWER_NO NUMBER PRIMARY KEY,
   QNA_ANSWER_CONTENTS CLOB NOT NULL,
   QNA_ANSWER_POSTED_TIME DATE DEFAULT SYSDATE,
   QNA_NO NUMBER NOT NULL,
   ID VARCHAR2(100) NOT NULL,
   CONSTRAINT QNA_SERVICE_ID_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) ON DELETE CASCADE,
   CONSTRAINT QNA_NO_FK FOREIGN KEY(QNA_NO) REFERENCES QNA(QNA_NO) ON DELETE CASCADE
   )

drop table qna;
drop table qna_answer;

/* 이용권타입 */
CREATE TABLE MEMBERSHIP(
   MEMBERSHIP_NO NUMBER PRIMARY KEY,
   MEMBERSHIP_NAME VARCHAR2(100) NOT NULL,
   CONCURRENT_USERS NUMBER DEFAULT 0
)

/* 파티게시판 */
CREATE TABLE PARTY(
   PARTY_NO NUMBER PRIMARY KEY,
   ID VARCHAR2(100) NOT NULL,
   CONSTRAINT PARTY_ID_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) ON DELETE CASCADE,
   PARTY_TITLE VARCHAR2(1000) NOT NULL,
   MEMBERSHIP_NO NUMBER NOT NULL,
   CONSTRAINT PARTY_MEMBERSHIP_NO_FK FOREIGN KEY(MEMBERSHIP_NO) REFERENCES MEMBERSHIP(MEMBERSHIP_NO) ON DELETE CASCADE,
   PARTY_HEADCOUNT NUMBER NOT NULL,
   PARTY_APPLYCOUNT NUMBER DEFAULT 0,
   PARTY_POSTED_TIME DATE DEFAULT SYSDATE,
   PARTY_STATUS VARCHAR2(100) DEFAULT '진행중'
)

/* 지원자 */
CREATE TABLE APPLY (
	ID VARCHAR2(100) NOT NULL,
	CONSTRAINT APPLY_ID_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) ON DELETE CASCADE,
	PARTY_NO NUMBER NOT NULL,
	CONSTRAINT APPLY_PARTY_NO_FK FOREIGN KEY(PARTY_NO) REFERENCES PARTY(PARTY_NO) ON DELETE CASCADE,
	APPLY_RESULT VARCHAR2(100) DEFAULT '완료',
	APPLY_TIME DATE DEFAULT SYSDATE,
	CONSTRAINT APPLY_PK PRIMARY KEY(ID, PARTY_NO)
)

/*컨텐츠 좋아요*/
CREATE TABLE CONTENTS_LIKE(
   CONTENTS_NO VARCHAR2(1000) NOT NULL,
   ID VARCHAR2(100) NOT NULL,
   CONSTRAINT CONTENTS_NO_LIKE_FK FOREIGN KEY(CONTENTS_NO) REFERENCES CONTENTS(CONTENTS_NO) ON DELETE CASCADE,
   CONSTRAINT MEMBER_C_ID_LIKE_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) ON DELETE CASCADE,
   CONSTRAINT CONTENTS_LIKE_PK PRIMARY KEY(CONTENTS_NO, ID)
)

/*리뷰 좋아요*/
CREATE TABLE REVIEW_LIKE(
   REVIEW_NO NUMBER NOT NULL,
   ID VARCHAR2(100) NOT NULL,
   CONSTRAINT REVIEW_NO_LIKE_FK FOREIGN KEY(REVIEW_NO) REFERENCES REVIEW(REVIEW_NO) ON DELETE CASCADE,
   CONSTRAINT MEMBER_R_LIKE_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) ON DELETE CASCADE,
   CONSTRAINT REVIEW_LIKE_PK PRIMARY KEY(REVIEW_NO, ID)
)

/*평점 시퀀스 생성 생성*/
CREATE SEQUENCE COMMENTS_SEQ NOCACHE;
/*리뷰 시퀀스 생성*/
CREATE SEQUENCE REVIEW_SEQ NOCACHE;
/*공지 시퀀스 생성*/
CREATE SEQUENCE NOTICE_SEQ NOCACHE;
/*신고 시퀀스 생성*/
CREATE SEQUENCE REPORT_SEQ NOCACHE;
/*상품 시퀀스 생성*/
CREATE SEQUENCE PRODUCT_SEQ NOCACHE;
/*상품주문 시퀀스 생성*/
CREATE SEQUENCE PRODUCT_ORDER_SEQ NOCACHE;
/*FAQ 시퀀스 생성*/
CREATE SEQUENCE FAQ_SEQ NOCACHE;
/*QNA 시퀀스 생성*/
CREATE SEQUENCE QNA_SEQ NOCACHE;
/*QNA_ANSWER 시퀀스 생성*/
CREATE SEQUENCE QNA_ANSWER_SEQ NOCACHE;
/*PARTY 시퀀스 생성*/
CREATE SEQUENCE PARTY_SEQ NOCACHE;
/*POINT_HISTORY 시퀀스 생성*/
CREATE SEQUENCE POINT_HISTORY_SEQ NOCACHE;

/*계정상태, 신고타입, 멤버쉽,상품 카테고리 데이터 미리 생성*/
INSERT INTO ACC_STATUS VALUES(0,'사용계정');
INSERT INTO ACC_STATUS VALUES(1,'휴먼계정');
INSERT INTO ACC_STATUS VALUES(2,'탙퇴계정');

INSERT INTO REPORT_TYPE VALUES(1,'욕설');
INSERT INTO REPORT_TYPE VALUES(2,'음란물');

INSERT INTO MEMBERSHIP VALUES(1,'BASIC',1);
INSERT INTO MEMBERSHIP VALUES(2,'STANDARD',2);
INSERT INTO MEMBERSHIP VALUES(3,'PREMIUM',4);

INSERT INTO PRODUCT_CATEGORY VALUES(1,'뷰티');
INSERT INTO PRODUCT_CATEGORY VALUES(2,'식품');

INSERT INTO QNA_TYPE VALUES(1,'포인트');
INSERT INTO QNA_TYPE VALUES(2,'회원문의');

INSERT INTO PRO_STATUS VALUES(1,'정상판매');
INSERT INTO PRO_STATUS VALUES(2,'판매중지');

/*Table drop*/
DROP TABLE CONTENTS_LIKE;
DROP TABLE REVIEW_LIKE;
drop table apply;
drop table party;
drop table membership;
drop table faq;
drop table grade;
drop table product_order;
drop table product;
drop table report;
drop table report_type;
drop table notice;
drop table review;
drop table comments;
drop table contents cascade constraint;
drop table genre;
drop table member cascade constraint;
drop table acc_status cascade constraint;

