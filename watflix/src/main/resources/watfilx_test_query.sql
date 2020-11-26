
/*ReviewWrite쿼리문 테스트*/
INSERT INTO REVIEW VALUES(#{reviewNo},#{reviewTitle},#{reviewContents},#{reviewHits},#{reviewLikes},sysdate,#{memberVO.id},#{contentsVO.contentsNo})

INSERT INTO REVIEW VALUES('1','Test1','테스트중입니다',1,1,sysdate,'tiamo','1',)
INSERT INTO REVIEW VALUES(REVIEW_SEQ.NEXTVAL,'tiamo','1','Test1','테스트중입니다',1,1,sysdate)

INSERT INTO REVIEW VALUES(#{reviewNo},{memberVO.id},#{contentsVO.contentsNo},#{reviewTitle},#{reviewContents},#{reviewHits},#{reviewLikes},sysdate)

/*ReviewWrite쿼리문 테스트를 위한 MEMBER TABLE 데이터 추가*/
INSERT INTO MEMBER VALUES('tiamo','1','Dan','010',null,null,'tiamo',null,null,null,null,null,null,null)
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL,ACC_STAUTS_NO) VALUES('a','1','깡상','gmail',0)

/*ReviewWrite쿼리문 테스트를 위한 CONTENTS TABLE 데이터 추가*/
INSERT INTO CONTENTS VALUES(CONTENTS_SEQ.NEXTVAL,'트랜스포머','타입','장르','요약','트레일러',0,1,1)

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