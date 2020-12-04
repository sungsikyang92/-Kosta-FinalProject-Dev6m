/*TEST FOR REVIEWWRITE AT FE*/
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL) VALUES('BOSE','1','BOSEBABY','GMAIL')
SELECT * FROM MEMBER
/*CONTENTS(CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL) << PRIMARY */
SELECT * FROM CONTENTS
/*INSERT INTO REVIEW(REVIEW_NO,ID,CONTENTS_NO,REVIEW_TITLE,REVIEW_CONTENTS) << PRIMARY*/
select * from review
INSERT INTO REVIEW(REVIEW_NO,ID,CONTENTS_NO,REVIEW_TITLE,REVIEW_CONTENTS) 
VALUES('454','BOSE','81171201','블러드 샷 봤냐?','지린다 가슴이 웅장해진다...꼭봐라...')

SELECT * FROM REVIEW WHERE REVIEW_NO=777
/*ReviewWrite쿼리문 테스트*/
INSERT INTO REVIEW(REVIEW_NO,ID,CONTENTS_NO,REVIEW_TITLE,REVIEW_CONTENTS) VALUES(REVIEW_NO.SEQ.NEXTVAL,);
/*ReviewWrite쿼리문 테스트를 위한 MEMBER TABLE 데이터 추가*/
INSERT INTO MEMBER VALUES('tiamo','1','Dan','010',null,null,'tiamo',null,null,null,null,null,null,null)
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL,ACC_STAUTS_NO) VALUES('a','1','깡상','gmail',0)
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL) VALUES('b','1','깡상','gmail')
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL) VALUES('c','1','똘이','gmail')
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL) VALUES('ㅇ','1','앵식','gmail')
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL,ACC_STAUTS_NO) VALUES('jikang','1','지강','gmail',0)
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL) VALUES('spring','1','강상훈','gmail')
<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/Minikanko/-Kosta-FinalProject-Dev6m.git
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL) VALUES('yuki','1','유리','gmail')
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL) VALUES('java','$2a$10$i2cyl1OhUeJ71PUTHozM9enjjiJ0rZVVjn/z7FVXnJA1pBi7gOUH2','앵앵앵','gmail')
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL) VALUES('spring',$2a$10$i2cyl1OhUeJ71PUTHozM9enjjiJ0rZVVjn/z7FVXnJA1pBi7gOUH2,'웨에엥','gmail')

/*ReviewWrite쿼리문 테스트를 위한 CONTENTS TABLE 데이터 추가*/
INSERT INTO CONTENTS VALUES(CONTENTS_SEQ.NEXTVAL,'트랜스포머','타입','장르','요약','트레일러',0,1,1)

/*ReviewList 불러오는 쿼리문 테스트를 위한 MEMBER TABLE과 REVIEW TABLE JOIN*/
SELECT R.REVIEW_NO, M.ID, R.REVIEW_TITLE, R.REVIEW_CONTENTS
FROM REVIEW R
INNER JOIN MEMBER M
ON R.ID = M.ID
select review_title from review where review_no = 11

select * from review
/*ReviewList 불러오는 쿼리문 테스트를 위한 MEMBER TABLE, REVIEW TABLE, CONTENTS TABLE 결합 TEST*/
SELECT R.REVIEW_NO, M.ID, C.CONTENTS_NO, R.REVIEW_TITLE, R.REVIEW_CONTENTS
FROM REVIEW R
INNER JOIN MEMBER M
ON R.ID = M.ID
INNER JOIN CONTENTS C
ON R.CONTENTS_NO = C.CONTENTS_NO
select * from review
/*ReviewList를 위한 두개의 테이블(REVIEW, MEMBER) PagingBean 결합 테스트*/
SELECT R.REVIEW_NO, M.ID, R.REVIEW_TITLE, R.REVIEW_CONTENTS
FROM(SELECT ROW_NUMBER() OVER(ORDER BY REVIEW_NO DESC) AS RNUM, REVIEW_NO, ID, REVIEW_TITLE, REVIEW_CONTENTS 
FROM REVIEW) R, MEMBER M WHERE R.ID = M.ID AND RNUM BETWEEN 1 AND 5 ORDER BY REVIEW_NO DESC

/*ReviewList 와 PagingBean 결합 테스트 실패작리스트*/
SELECT R.REVIEW_NO, M.ID, C.CONTENTS_NO, R.REVIEW_TITLE, R.REVIEW_CONTENTS
FROM(SELECT ROW_NUMBER() OVER(ORDER BY REVIEW_NO DESC) AS RNUM, REVIEW_NO, ID, REVIEW_TITLE, REVIEW_CONTENTS 
FROM REVIEW) R, MEMBER M WHERE R.ID = M.ID AND RNUM BETWEEN 1 AND 5 ORDER BY REVIEW_NO DESC;

SELECT R.REVIEW_NO, M.ID, C.CONTENTS_NO, R.REVIEW_TITLE, R.REVIEW_CONTENTS
FROM(SELECT ROW_NUMBER() OVER(ORDER BY REVIEW_NO DESC) AS RNUM, REVIEW_NO, ID, CONTENTS_NO, REVIEW_TITLE, REVIEW_CONTENTS FROM REVIEW) 
R, MEMBER M, CONTENTS C
WHERE R.ID = M.ID, R.CONTENTS_NO = C.CONTENTS_NO
AND RNUM BETWEEN 1 AND 5 ORDER BY REVIEW_NO DESC;

SELECT R.REVIEW_NO, M.ID, R.REVIEW_TITLE, R.REVIEW_CONTENTS
FROM(SELECT ROW_NUMBER() OVER(ORDER BY REVIEW_NO DESC) AS RNUM, REVIEW_NO, ID, REVIEW_TITLE, REVIEW_CONTENTS 
FROM REVIEW) R, MEMBER M WHERE R.ID = M.ID 
AND RNUM BETWEEN 1 AND 5 ORDER BY REVIEW_NO DESC
LEFT JOIN CONTENTS ON R.CONTENTS_NO = C.CONTENTS_NO

SELECT R.REVIEW_NO, M.ID, R.REVIEW_TITLE, R.REVIEW_CONTENTS
FROM(SELECT ROW_NUMBER() OVER(ORDER BY REVIEW_NO DESC) AS RNUM, REVIEW_NO, ID, REVIEW_TITLE, REVIEW_CONTENTS 
FROM REVIEW) R, (SELECT ID FROM MEMBER WHERE R.ID = ID) M, (SELECT CONTENTS_NO FROM CONTENTS WHERE R.CONTENTS_NO = CONTENTS_NO) C 
AND RNUM BETWEEN 1 AND 5 ORDER BY REVIEW_NO DESC

SELECT * FROM test1 INNER JOIN test2 ON test1.b = test2.b INNER JOIN test3 ON test2.b = test3.b

SELECT REVIEW_NO, ID, CONTENTS_NO, REVIEW_TITLE, REVIEW_CONTENTS FROM REVIEW
SELECT REVIEW_NO, ID, CONTENTS_NO, REVIEW_TITLE, REVIEW_CONTENTS FROM REVIEW LEFT JOIN MEMBER ON REVIEW.ID = MEMBER.ID

/*ReviewList 와 PagingBean 결합 테스트 성공(Where절은 and로 묶어서 연결한다)*/
SELECT R.REVIEW_NO, M.ID,C.CONTENTS_NO,R.REVIEW_TITLE, R.REVIEW_CONTENTS, R.REVIEW_POSTED_TIME
FROM (SELECT ROW_NUMBER() OVER(ORDER BY REVIEW_NO DESC) AS RNUM, REVIEW_NO, ID, CONTENTS_NO, REVIEW_TITLE, REVIEW_CONTENTS ,REVIEW_POSTED_TIME FROM REVIEW) 
R, MEMBER M, CONTENTS C
WHERE R.ID = M.ID AND R.CONTENTS_NO = C.CONTENTS_NO 
AND R.RNUM BETWEEN 1 AND 5 ORDER BY REVIEW_NO DESC;

SELECT R.REVIEW_NO, M.ID,C.CONTENTS_NO,R.REVIEW_TITLE, R.REVIEW_CONTENTS
FROM (SELECT ROW_NUMBER() OVER(ORDER BY REVIEW_NO DESC) AS RNUM, REVIEW_NO, ID, CONTENTS_NO, REVIEW_TITLE, REVIEW_CONTENTS FROM REVIEW) 
R, MEMBER M, CONTENTS C
WHERE R.ID = M.ID AND R.CONTENTS_NO = C.CONTENTS_NO 
AND RNUM BETWEEN 1 AND 5 ORDER BY REVIEW_NO DESC;

/*ReviewDetail Test*/
SELECT R.REVIEW_NO,R.REVIEW_TITLE,R.REVIEW_LIKES,TO_CHAR(R.REVIEW_POSTED_TIME, 'YYYY.MM.DD HH24:MI:SS') 
AS REVIEW_POSTED_TIME,M.ID,R.REVIEW_HITS,R.REVIEW_CONTENTS 
FROM REVIEW R, MEMBER M 
WHERE R.ID = M.ID AND REVIEW_NO = '8'

SELECT * FROM REVIEW

		SELECT R.REVIEW_NO,R.REVIEW_TITLE,R.REVIEW_LIKES,TO_CHAR(R.REVIEW_POSTED_TIME, 'YYYY.MM.DD HH24:MI:SS') 
		AS REVIEW_POSTED_TIME,M.ID,R.REVIEW_HITS,R.REVIEW_CONTENTS 
		FROM REVIEW R, MEMBER M 
		WHERE R.ID = M.ID AND REVIEW_NO = '8'
		
UPDATE REVIEW SET REVIEW_TITLE = '나는강지훈', REVIEW_CONTENTS = '똘이아범이지'
WHERE REVIEW_NO = '8'
/*ReviewHitsUpdate Test*/
UPDATE REVIEW SET REVIEW_HITS=REVIEW_HITS+1 WHERE REVIEW_NO= 16
SELECT * FROM REVIEW

/*Notice 테스트를 위한 데이터 추가*/
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL, 'jikang', '점심은 뭐 먹지?', '점심 뭐가 맛있나요?', SYSDATE, 0)

/*Comment 테스트를 위한 데이터 추가*/
INSERT INTO Comments VALUES (COMMENTS_SEQ.NEXTVAL, 'jikang', '81004276', '쉐보레 카마로 멋지지 않나요?', 8, SYSDATE);
INSERT INTO Comments VALUES (COMMENTS_SEQ.NEXTVAL, 'java', '60004481', '나도 스파이더맨 처럼 날아다닐 수 있으면?', 8, SYSDATE);
INSERT INTO Comments VALUES (COMMENTS_SEQ.NEXTVAL, 'java', '81095669', '진격의 거인이 그렇게 재미있냐?', 8, SYSDATE);

/*report 테스트를 위한 데이터 추가*/
INSERT INTO report VALUES (report_seq.nextval, 'jikang', null, 1, 1, '신고합니다', sysdate)
INSERT INTO report VALUES (report_seq.nextval, 'jikang', 1, null, 2, '신고합니다', sysdate)

INSERT INTO review VALUES (review_seq.nextval, 'jikang', '81004276', '리뷰 제목', '리뷰 내용', 0, 0, sysdate)

/*Notice 테스트용*/
SELECT notice_no, id, notice_title, notice_hits FROM(
SELECT row_number() over(order by notice_no desc) as rnum, notice_no, id, notice_title, notice_hits
FROM notice
) WHERE rnum BETWEEN 7 AND 25

UPDATE notice SET notice_title = '오늘 점심은 청년다방', notice_contents = '배부르다' WHERE notice_no = 1

DELETE FROM notice WHERE notice_no=3
/*Comments 테스트용*/
SELECT comments_no, id, contents_no, comments, comments_stars, comments_posted_time FROM comments

SELECT comments_no, id, contents_no, comments, comments_stars, comments_posted_time FROM(
SELECT row_number() over(order by comments_no desc) as rnum, comments_no, id, contents_no, comments, comments_stars, comments_posted_time
FROM comments WHERE contents_no = '81004276') WHERE rnum BETWEEN 3 AND 8


SELECT comments_no, id, contents_no, comments, comments_stars, comments_posted_time FROM(
SELECT row_number() over(order by comments_no desc) as rnum, comments_no, id, contents_no, comments, comments_stars, comments_posted_time
FROM comments) WHERE rnum BETWEEN 3 AND 8

INSERT INTO comments(comments_no, id, contents_no, comments, comments_stars, comments_posted_time)
VALUES(comments_seq.nextval, 'jikang', '60004481', '스파이더맨이 되는 방법을 알고싶나요?', 6, sysdate)

/* report 테스트용*/
SELECT report_no, id, review_no, comments_no, report_type_no, report_contents, report_posted_time
FROM report WHERE report_no=#{value}

SELECT r.report_no, r.id, r.review_no, r.comments_no, r.report_type_no, r.report_contents, r.report_posted_time, t.report_type_info
FROM report r, report_type t WHERE r.report_type_no=t.report_type_no AND r.report_no = 1

/* comments 갯수 순 content 리스트 조회 */
SELECT b.contents_no, b.contents_title, b.contents_type, b.genre_code, b.contents_small_thumbnail, b.contents_big_thumbnail, b.contents_avg_stars, b.contents_likes, b.contents_hits, count(a.comments_no) as comments_count
FROM comments a, contents b
WHERE a.contents_no(+)=b.contents_no
GROUP BY b.contents_no, b.contents_title, b.contents_type, b.genre_code, b.contents_small_thumbnail, b.contents_big_thumbnail, b.contents_avg_stars, b.contents_likes, b.contents_hits
ORDER BY comments_count DESC;


select count(*) from product_order
select count(*) from member
select count(*) from apply
select count(*) from review

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
drop sequence NOTICE_SEQ;

select * from contents

insert into party value(party_no , id, party_title,membership_no, party_headcount)
values (PARTY_SEQ.nextval,'java','파티원제목1',1,1)

select * from party
delete from party

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
select * from contents



select * from member;
select * from membership;
select * from party;
select * from party where party_no=14

insert into party values ( 
PARTY_SEQ.nextval, 'java', '제목', 3, 4, 0, sysdate, '진행중');


select party_seq.nextval from dual
select * from party;


select ms.membership_name, p.PARTY_NO, m.ID, 
p.PARTY_TITLE,  p.MEMBERSHIP_NO, 
p.PARTY_HEADCOUNT, 
p.PARTY_APPLYCOUNT,
to_char(p.PARTY_POSTED_TIME,'yyyy-mm-dd') as posted_time, 
p.PARTY_STATUS
from PARTY p, member m, MEMBERSHIP ms
where p.id=m.id and p.membership_no = ms.membership_no and party_no=14


update party set id = 'spring' ,membership_no = 2 where party_no = 2
select * from apply;


insert into APPLY(ID, PARTY_NO )
values ('java',13);

select * from party
select * from contents
delete from apply
delete from genre
drop table contents


/*재우 test*/
select * from report
union (all)













