/*ReviewWrite쿼리문 테스트*/
INSERT INTO REVIEW VALUES(#{reviewNo},#{reviewTitle},#{reviewContents},#{reviewHits},#{reviewLikes},sysdate,#{memberVO.id},#{contentsVO.contentsNo})

INSERT INTO REVIEW VALUES('1','Test1','테스트중입니다',1,1,sysdate,'tiamo','1',)
INSERT INTO REVIEW VALUES(REVIEW_SEQ.NEXTVAL,'tiamo','1','Test1','테스트중입니다',1,1,sysdate)

INSERT INTO REVIEW VALUES(#{reviewNo},{memberVO.id},#{contentsVO.contentsNo},#{reviewTitle},#{reviewContents},#{reviewHits},#{reviewLikes},sysdate)

/*ReviewWrite쿼리문 테스트를 위한 MEMBER TABLE 데이터 추가*/
INSERT INTO MEMBER VALUES('tiamo','1','Dan','010',null,null,'tiamo',null,null,null,null,null,null,null)

/*ReviewWrite쿼리문 테스트를 위한 CONTENTS TABLE 데이터 추가*/
INSERT INTO CONTENTS VALUES(CONTENTS_SEQ.NEXTVAL,'트랜스포머','타입','장르','요약','트레일러',0,1,1)

select count(*) from product_order
select count(*) from member
select count(*) from faq
