/*ReviewWrite쿼리문 테스트*/
INSERT INTO REVIEW VALUES(#{reviewNo},#{reviewTitle},#{reviewContents},#{reviewHits},#{reviewLikes},sysdate,#{memberVO.id},#{contentsVO.contentsNo})

INSERT INTO REVIEW VALUES('1','Test1','테스트중입니다',1,1,sysdate,'tiamo','1',)
INSERT INTO REVIEW VALUES(REVIEW_SEQ.NEXTVAL,'tiamo','1','Test1','테스트중입니다',1,1,sysdate)

INSERT INTO REVIEW VALUES(#{reviewNo},{memberVO.id},#{contentsVO.contentsNo},#{reviewTitle},#{reviewContents},#{reviewHits},#{reviewLikes},sysdate)

/*ReviewWrite쿼리문 테스트를 위한 MEMBER TABLE 데이터 추가*/
INSERT INTO MEMBER VALUES('tiamo','1','Dan','010',null,null,'tiamo',null,null,null,null,null,null,null)
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL,ACC_STAUTS_NO) VALUES('a','1','깡상','gmail',0)
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL,ACC_STAUTS_NO) VALUES('jikang','1','지강','gmail',0)
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL) VALUES('yuki','1','유리','gmail')


/*ReviewWrite쿼리문 테스트를 위한 CONTENTS TABLE 데이터 추가*/
INSERT INTO CONTENTS VALUES(CONTENTS_SEQ.NEXTVAL,'트랜스포머','타입','장르','요약','트레일러',0,1,1)

/*Notice 테스트를 위한 데이터 추가*/
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL, 'jikang', '점심은 뭐 먹지?', '점심 뭐가 맛있나요?', SYSDATE, 0)

select count(*) from product_order
select count(*) from member
select count(*) from apply

select * from contents
select * from genre




delete from genre
delete from contents;

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
drop table contents CASCADE CONSTRAINTS;
drop table genre;
drop table member;
drop table acc_status;

select * from contents


/* Faq test */
insert into faq(FAQ_NO,ID,FAQ_TITLE,FAQ_CONTENTS)
 		values(faq_seq.nextval,'yuki','자주 묻는 질문','이용 요금')
 		
 		select * from faq;
 		select * from member;
 		
 		delete from faq;
 		
CREATE TABLE FAQ(
   FAQ_NO VARCHAR2(100) PRIMARY KEY,
   ID VARCHAR2(100) NOT NULL,
   FAQ_TITLE VARCHAR2(1000) NOT NULL,
   FAQ_CONTENTS CLOB NOT NULL,
   FAQ_POSTED_TIME DATE DEFAULT SYSDATE,
   FAQ_HITS NUMBER DEFAULT 0,
   CONSTRAINT FAQ_SERVICE_ID_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) ON DELETE CASCADE
)


delete from COMMENTS;
ALTER TABLE COMMENTS  MODIFY COMMENTS_NO number;
delete from REVIEW;
ALTER TABLE REVIEW  MODIFY REVIEW_NO number;
delete from NOTICE;
ALTER TABLE NOTICE  MODIFY NOTICE_NO number;
delete from REPORT;
ALTER TABLE REPORT  MODIFY REPORT_NO number;
delete from PRODUCT;
ALTER TABLE PRODUCT  MODIFY PRODUCT_NO number;
delete from PRODUCT_ORDER;
ALTER TABLE PRODUCT_ORDER  MODIFY ORDER_NO number;
delete from FAQ;
ALTER TABLE FAQ  MODIFY FAQ_NO number;
delete from PARTY;
ALTER TABLE PARTY  MODIFY PARTY_NO number;