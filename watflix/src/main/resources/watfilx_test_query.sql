/*TEST FOR REVIEWWRITE AT FE*/
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL) VALUES('BOSE','1','BOSEBABY','GMAIL')
SELECT * FROM MEMBER
/*CONTENTS(CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL) << PRIMARY */
SELECT * FROM CONTENTS
/*INSERT INTO REVIEW(REVIEW_NO,ID,CONTENTS_NO,REVIEW_TITLE,REVIEW_CONTENTS) << PRIMARY*/
select * from review
INSERT INTO REVIEW(REVIEW_NO,ID,CONTENTS_NO,REVIEW_TITLE,REVIEW_CONTENTS) 
VALUES('454','BOSE','81171201','블러드 샷 봤냐?','지린다 가슴이 웅장해진다...꼭봐라...')

SELECT * FROM COMMENTS

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
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL) VALUES('yuki','1','유리','gmail')
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL) VALUES('java','$2a$10$i2cyl1OhUeJ71PUTHozM9enjjiJ0rZVVjn/z7FVXnJA1pBi7gOUH2','강상훈','gmail');
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL) VALUES('spring','$2a$10$i2cyl1OhUeJ71PUTHozM9enjjiJ0rZVVjn/z7FVXnJA1pBi7gOUH2','양성식','gmail');

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
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL, 'java', '점심은 뭐 먹지?', '점심 뭐가 맛있나요?', SYSDATE, 0)

/*Comment 테스트를 위한 데이터 추가*/
INSERT INTO Comments VALUES (COMMENTS_SEQ.NEXTVAL, 'java', '81171201', '블러드샷?', 8, SYSDATE);
INSERT INTO Comments VALUES (COMMENTS_SEQ.NEXTVAL, 'java', '81004276', '쉐보레 카마로 멋지지 않나요?', 8, SYSDATE);
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
select * from grade

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
alter table ACC_STATUS 

ALTER TABLE member
RENAME COLUMN acc_stauts_no TO acc_status_no;



/* Faq test */
insert into faq(FAQ_NO,ID,FAQ_TITLE,FAQ_CONTENTS)
 		values(faq_seq.nextval,'yuki','자주 묻는 질문','이용 요금')
 		
 		select * from faq;
 		select * from member;
 		
 		delete from faq;

 select m.id,m.password,m.name,m.tel,m.birth,m.sex,m.email,m.address,m.login_time,
 		m.login_fail,m.point,m.signup_date,m.agreement,a.acc_status_info
 		from member m, (select * from acc_status) a
 		where m.id='java14'
 		select * from member where id='java14'
CREATE TABLE FAQ(
   FAQ_NO VARCHAR2(100) PRIMARY KEY,
   ID VARCHAR2(100) NOT NULL,
   FAQ_TITLE VARCHAR2(1000) NOT NULL,
   FAQ_CONTENTS CLOB NOT NULL,
   FAQ_POSTED_TIME DATE DEFAULT SYSDATE,
   FAQ_HITS NUMBER DEFAULT 0,
   CONSTRAINT FAQ_SERVICE_ID_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) ON DELETE CASCADE
)

/*QNA test*/
select * from QNA



CREATE TABLE QNA(
	QNA_NO NUMBER PRIMARY KEY,
	ID VARCHAR2(100) NOT NULL,
	QNA_TITLE VARCHAR2(1000) NOT NULL,
	QNA_CONTENTS CLOB NOT NULL,
	QNA_POSTED_TIME DATE DEFAULT SYSDATE,
	QNA_HITS NUMBER DEFAULT 0,
	CONSTRAINT QNA_SERVICE_ID_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) ON DELETE CASCADE
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
select * from member



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

select * from member
delete from membership
select * from party
select * from contents
delete from apply
/*컨텐츠의 리뷰 갯수 구하기*/
select * from REVIEW
select count(*) CONTENTS_NO from review
SELECT COUNT(*) R.CONTENTS_NO FROM REVIEW R, CONTENTS C WHERE R.CONTENTS_NO = C.CONTENTS_NO
SELECT R.REVIEW_TITLE, C.CONTENTS_NO FROM REVIEW WHERE R.CONENTS_NO = C.CONTENTS_NO
ON REVIEW.CONTENTS_NO = CONTENTS.CONTENTS_NO
SELECT * FROM CONTENTS
SELECT COUNT(*) FROM REVIEW
SELECT COUNT(REVIEW_TITLE) AS CONTENTS_REVIEW_NO FROM REVIEW WHERE CONTENTS_NO = '80204465'
delete from genre
drop table contents



select * from report
select * from review
union (all)

		SELECT R.REVIEW_NO,R.REVIEW_TITLE,R.REVIEW_LIKES,C.CONTENTS_NO,TO_CHAR(R.REVIEW_POSTED_TIME, 'YYYY.MM.DD HH24:MI:SS') 
		AS REVIEW_POSTED_TIME,M.ID,R.REVIEW_HITS,R.REVIEW_CONTENTS 
		FROM REVIEW R, MEMBER M, CONTENTS C 
		WHERE R.ID = M.ID AND R.REVIEW_NO = 22 AND C.CONTENTS_NO = '81171201'
		
		SELECT R.REVIEW_NO,M.ID,C.CONTENTS_NO,R.REVIEW_TITLE,R.REVIEW_CONTENTS, R.REVIEW_POSTED_TIME
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY REVIEW_NO DESC) AS RNUM, REVIEW_NO, ID, CONTENTS_NO, REVIEW_TITLE, 
		REVIEW_CONTENTS, TO_CHAR(REVIEW_POSTED_TIME,'yyyy-mm-dd') as REVIEW_POSTED_TIME FROM REVIEW) 
		R, MEMBER M, CONTENTS C
		WHERE R.ID = M.ID AND R.CONTENTS_NO = C.CONTENTS_NO AND C.CONTENTS_NO = #{contentsNo}
		AND RNUM BETWEEN #{pagingBean.startRowNumber} AND #{pagingBean.endRowNumber} ORDER BY REVIEW_NO DESC
		
SELECT RNUM,R.REVIEW_NO,M.ID,C.CONTENTS_NO,R.REVIEW_TITLE,R.REVIEW_CONTENTS,R.REVIEW_LIKES,R.REVIEW_HITS,R.REVIEW_POSTED_TIME
FROM (SELECT ROW_NUMBER() OVER(ORDER BY REVIEW_NO DESC) AS RNUM,REVIEW_NO,ID,CONTENTS_NO,REVIEW_TITLE,REVIEW_CONTENTS,REVIEW_LIKES,REVIEW_HITS,TO_CHAR(REVIEW_POSTED_TIME,'yyyy-mm-dd') as REVIEW_POSTED_TIME FROM REVIEW where CONTENTS_NO= '81171201') 
R, MEMBER M, CONTENTS C
WHERE R.ID = M.ID AND R.CONTENTS_NO = C.CONTENTS_NO AND RNUM BETWEEN 1 AND 100

/*재우 test*/
-- 제약 조건 비활성화, 확성화
alter table REPORT disable constraint REPORT_REVIEW_NO_FK
alter table REPORT enable constraint REPORT_REVIEW_NO_FK
-- 제약 조건 검색
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'REPORT'
-- 제약조건후 부모 테이블 data 삭제 및 테이블 조회
select * from report where comments_no is NULL;
select * from review;
delete from review where review_no=1
-- 내 신고 게시물 보기(리뷰)
SELECT REPORT_NO,ID,REVIEW_NO,REPORT_TYPE_NO,REPORT_CONTENTS,re_time,reportedId
FROM(SELECT row_number() over(order by REPORT_NO desc) as re_num, r.REPORT_NO,r.ID,r.REVIEW_NO,r.COMMENTS_NO, r.REPORT_TYPE_NO, r.REPORT_CONTENTS, r.re_time, rv.id as reportedId
FROM(SELECT REPORT_NO,ID,REVIEW_NO,COMMENTS_NO,REPORT_TYPE_NO,REPORT_CONTENTS,
to_char(REPORT_POSTED_TIME,'YYYY.MM.DD HH:MI:SS') as re_time
FROM REPORT where id='java') r, review rv where r.REVIEW_NO=rv.REVIEW_NO)
where re_num between 1 and 5
order by report_no desc;
-- 내 신고 게시물 보기(평점)
SELECT REPORT_NO,ID,COMMENTS_NO,REPORT_TYPE_NO,REPORT_CONTENTS,re_time,reportedId
FROM(SELECT row_number() over(order by r.REPORT_NO desc) as re_num, r.REPORT_NO,r.ID,r.REVIEW_NO,r.COMMENTS_NO, r.REPORT_TYPE_NO, r.REPORT_CONTENTS, r.re_time, c.id as reportedId
FROM(SELECT REPORT_NO,ID,REVIEW_NO,COMMENTS_NO,REPORT_TYPE_NO,REPORT_CONTENTS,
to_char(REPORT_POSTED_TIME,'YYYY.MM.DD HH:MI:SS') as re_time
FROM REPORT where id='java') r, COMMENTS c where r.COMMENTS_NO=c.COMMENTS_NO)
where re_num between 1 and 5
order by report_no desc;
-- 내가 작성한 신고글 수 조회
select count(*) from report where REVIEW_NO is not NULL and id='java'
select count(*) from report where REVIEW_NO is NULL and id='java'
-- 임시 데이터 삽입
insert into report(report_no, id, review_no, report_type_no, report_contents)
values(REPORT_SEQ.nextval, 'java', 1, 2, '음란물 신고합니다.');
select * from report where id='java' and review_no is not null
insert into report(report_no, id, comments_no, report_type_no, report_contents)
values(REPORT_SEQ.nextval, 'java', 3, 1, '신고합니다.');
-- 내 신고 게시물 sql 수정
SELECT REPORT_NO,ID,REVIEW_NO,REPORT_TYPE_info,REPORT_CONTENTS,re_time,reportedId
FROM(SELECT row_number() over(order by REPORT_NO desc) as re_num, r.REPORT_NO,r.ID,r.REVIEW_NO,r.COMMENTS_NO, rt.REPORT_TYPE_info, r.REPORT_CONTENTS, r.re_time, rv.id as reportedId
FROM(SELECT REPORT_NO,ID,REVIEW_NO,COMMENTS_NO,REPORT_TYPE_NO,REPORT_CONTENTS,
to_char(REPORT_POSTED_TIME,'YYYY.MM.DD HH:MI:SS') as re_time
FROM REPORT where id='java') r, review rv, report_type rt where r.REVIEW_NO=rv.REVIEW_NO and r.report_type_no = rt.report_type_no)
where re_num between 1 and 5
order by report_no desc;

select r.*, g.GRADE from member r, GRADE g 

select * from grade
insert into grade values ( 'ROLE_MEMBER' , 'java');
insert into grade values ( 'ROLE_MEMBER' , 'spring');

/*컨텐츠*/
CREATE TABLE CONTENTS(
   CONTENTS_NO VARCHAR2(1000) PRIMARY KEY,
   CONTENTS_TITLE VARCHAR2(4000) NOT NULL,
   CONTENTS_TYPE VARCHAR2(100) NOT NULL,
   GENRE_CODE VARCHAR2(1000) NOT NULL,
   CONSTRAINT CONTENTS_GENRE_CODE_FK FOREIGN KEY(GENRE_CODE) REFERENCES GENRE(GENRE_CODE) on delete cascade,
   CONTENTS_DATE VARCHAR2(100) NOT NULL,
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

select * from party

select * from apply
select * from party where party_no = 137

  select ms.membership_name, ms.MEMBERSHIP_NO , ms.CONCURRENT_USERS,
   p.PARTY_NO, m.ID, p.PARTY_TITLE, p.PARTY_HEADCOUNT, p.PARTY_APPLYCOUNT,
  to_char(p.PARTY_POSTED_TIME,'yyyy-mm-dd') as PARTY_POSTED_TIME, p.PARTY_STATUS, 
  CASE WHEN a.party_no = p.party_no THEN '지원' ELSE '미지원' END AS applys
  From PARTY p, member m, MEMBERSHIP ms, (select * from apply where id='spring') a
  
  WHERE p.id=m.id and p.membership_no = ms.membership_no
  
  

/* 테이블 컬럼명 바꾸기*/
ALTER TABLE member RENAME COLUMN acc_stauts_no TO acc_status_no


select * from apply where id='java' and party_no = 137


	SELECT p.PARTY_NO, p.id, p.PARTY_TITLE, ms.membership_name, p.PARTY_STATUS,
 		p.PARTY_HEADCOUNT,p.PARTY_APPLYCOUNT,to_char(p.PARTY_POSTED_TIME,'yyyy-mm-dd') as PARTY_POSTED_TIME,
 		CASE WHEN a.party_no = p.party_no THEN '지원' ELSE '미지원' END AS apply
 		
 		From(SELECT row_number() over (order by PARTY_NO desc) as rnum,PARTY_NO,ID,PARTY_TITLE,membership_no,PARTY_STATUS,
 		PARTY_HEADCOUNT,PARTY_APPLYCOUNT,PARTY_POSTED_TIME FROM PARTY) p ,
 		
 		MEMBERSHIP ms , (select * from apply where id='spring') a
 		
 		
 		WHERE rnum BETWEEN 1 AND 5 and p.membership_no = ms.membership_no and party_no = 173





select ms.membership_name, ms.MEMBERSHIP_NO , ms.CONCURRENT_USERS,
   		p.PARTY_NO, m.ID, p.PARTY_TITLE, p.PARTY_HEADCOUNT, p.PARTY_APPLYCOUNT,
  		to_char(p.PARTY_POSTED_TIME,'yyyy-mm-dd') as PARTY_POSTED_TIME, p.PARTY_STATUS,
  		
  		
  		From PARTY p, member m, MEMBERSHIP ms, 
  
 		WHERE p.id=m.id and p.membership_no = ms.membership_no and party_no = #{partyNo}



 		
 		
 		
 		
 		SELECT p.PARTY_NO, p.id, p.PARTY_TITLE, ms.membership_name, p.PARTY_STATUS,
 		p.PARTY_HEADCOUNT,p.PARTY_APPLYCOUNT,to_char(p.PARTY_POSTED_TIME,'yyyy-mm-dd') as PARTY_POSTED_TIME
 		
 		From(SELECT row_number() over (order by PARTY_NO desc) as rnum,PARTY_NO,ID,PARTY_TITLE,membership_no,PARTY_STATUS,
 		PARTY_HEADCOUNT,PARTY_APPLYCOUNT,PARTY_POSTED_TIME FROM PARTY) p ,
 		MEMBERSHIP ms
 		
 		WHERE rnum BETWEEN 1 AND 5 and p.membership_no = ms.membership_no
 		
 		
 		
 		
 		
 		 select ms.membership_name, ms.MEMBERSHIP_NO , ms.CONCURRENT_USERS,
   		p.PARTY_NO, m.ID, p.PARTY_TITLE, p.PARTY_HEADCOUNT, p.PARTY_APPLYCOUNT,
  		to_char(p.PARTY_POSTED_TIME,'yyyy-mm-dd') as PARTY_POSTED_TIME, p.PARTY_STATUS,
  		CASE WHEN a.party_no = p.party_no THEN '지원' ELSE '미지원' END AS applys
  		From PARTY p, member m, MEMBERSHIP ms, (select * from apply where id='java') a
  
 		WHERE p.id=m.id and p.membership_no = ms.membership_no and party_no = 137
 		
 		
select ms.membership_name, ms.MEMBERSHIP_NO , ms.CONCURRENT_USERS,
   p.PARTY_NO, m.ID, p.PARTY_TITLE, p.PARTY_HEADCOUNT, p.PARTY_APPLYCOUNT,
  to_char(p.PARTY_POSTED_TIME,'yyyy-mm-dd') as PARTY_POSTED_TIME, p.PARTY_STATUS, 
  CASE WHEN a.party_no = p.party_no THEN '지원'  ELSE '미지원'
  END AS applys
  From PARTY p, member m, MEMBERSHIP ms, (select * from apply where id='spring') a
  WHERE p.id=m.id and p.membership_no = ms.membership_no
 		
  ---------------------------------------------------------------------------
  select ms.membership_name, ms.MEMBERSHIP_NO , ms.CONCURRENT_USERS,
   p.PARTY_NO, m.ID, p.PARTY_TITLE, p.PARTY_HEADCOUNT, p.PARTY_APPLYCOUNT,
  to_char(p.PARTY_POSTED_TIME,'yyyy-mm-dd') as PARTY_POSTED_TIME, p.PARTY_STATUS, 
  CASE WHEN a.party_no = p.party_no THEN '지원' ELSE '미지원' END AS applys
  From PARTY p, member m, MEMBERSHIP ms, (select * from apply where id='spring') a
  WHERE p.id=m.id and p.membership_no = ms.membership_no
 		

select m.id,m.password,m.name,m.tel,to_char('m.birth','YYYY-MM-DD'),m.sex,m.email,m.address,m.login_time,
 		m.login_fail,m.point,m.signup_date,m.agreement,m.acc_status_no,a.acc_status_info
 		from member m, (select * from acc_status) a
 		where a.acc_status_no=m.acc_status_no and m.id='java1234'

/* 리뷰 테스트를 위한 데이터 추가 */
INSERT INTO review VALUES(review_seq.nextval, 'java', 60004481, '리뷰 테스트 용 스파이더맨!', '리뷰 테슷트입니다.', 0, 0, sysdate);
INSERT INTO review VALUES(review_seq.nextval, 'java', 81095669, '리뷰 테스트 용 진격의거인!', '리뷰 테슷트입니다.', 0, 0, sysdate);

select*from comments where contents_no = '81171201'

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

	SELECT comments_no, id, contents_no, comments, comments_stars, comments_posted_time FROM(
		SELECT row_number() over(order by comments_no desc) as rnum, comments_no, id, contents_no, comments, comments_stars, comments_posted_time
		FROM comments WHERE contents_no = #{contentsNo}) WHERE rnum BETWEEN #{pagingBean.startRowNumber} AND #{pagingBean.endRowNumber}
		
SELECT comments_no, id, contents_no, comments, comments_stars, comments_posted_time FROM(
SELECT row_number() over(order by comments_no desc) as rnum, comments_no, id, contents_no, comments, comments_stars, comments_posted_time
FROM comments WHERE contents_no = '81171201') WHERE rnum BETWEEN 1 AND 5

SELECT CMTS.COMMENTS_NO, M.ID, C.CONTENTS_NO, CMTS.COMMENTS, CMTS.COMMENTS_STARTS, CMTS.COMMENTS_POSTED_TIME 
FROM(SELECT ROW_NUMBER() OVER(ORDER BY COMMENTS_NO DESC) AS RNUM,COMMENTS_NO,ID,CONTENTS_NO,COMMENTS_COMMENTS_STARS,TO_CHAR(COMMENTS_POSTED_TIME,'yyyy-mm-dd') 
AS COMMENTS_POSTED_TIME FROM COMMENTS WHERE CONTENTS_NO=#{contentsNo}) CMTS, MEMBER M, CONTENTS C WHERE CMTS.ID = M.ID AND CMTS.CONTENTS_NO = C.CONTENTS_NO 
AND RNUM BETWEEN #{pagingBean.startRowNumber} AND #{pagingBean.endRowNumber}

SELECT S.COMMENTS_NO, M.ID, C.CONTENTS_NO, S.COMMENTS, S.COMMENTS_STARS, S.COMMENTS_POSTED_TIME 
FROM(SELECT ROW_NUMBER() OVER(ORDER BY COMMENTS_NO DESC) AS RNUM,COMMENTS_NO,ID,CONTENTS_NO,COMMENTS,COMMENTS_STARS,TO_CHAR(COMMENTS_POSTED_TIME,'yyyy-mm-dd') 
AS COMMENTS_POSTED_TIME FROM COMMENTS WHERE CONTENTS_NO='81171201') S, MEMBER M, CONTENTS C WHERE S.ID = M.ID AND S.CONTENTS_NO = C.CONTENTS_NO 
AND RNUM BETWEEN 1 AND 10

SELECT S.COMMENTS_NO, M.ID, C.CONTENTS_NO, S.COMMENTS, S.COMMENTS_STARS, S.COMMENTS_POSTED_TIME 
FROM(SELECT ROW_NUMBER() OVER(ORDER BY COMMENTS_NO DESC) AS RNUM,COMMENTS_NO,ID,CONTENTS_NO,COMMENTS,COMMENTS_STARS,TO_CHAR(COMMENTS_POSTED_TIME,'yyyy-mm-dd') 
AS COMMENTS_POSTED_TIME FROM COMMENTS WHERE CONTENTS_NO=#{contentsNo}) S, MEMBER M, CONTENTS C WHERE S.ID = M.ID AND S.CONTENTS_NO = C.CONTENTS_NO 
AND RNUM BETWEEN #{pagingBean.startRowNumber} AND #{pagingBean.endRowNumber}


SELECT RNUM,R.REVIEW_NO,M.ID,C.CONTENTS_NO,R.REVIEW_TITLE,R.REVIEW_CONTENTS,R.REVIEW_LIKES,R.REVIEW_HITS,R.REVIEW_POSTED_TIME
FROM (SELECT ROW_NUMBER() OVER(ORDER BY REVIEW_NO DESC) AS RNUM,REVIEW_NO,ID,CONTENTS_NO,REVIEW_TITLE,REVIEW_CONTENTS,REVIEW_LIKES,
REVIEW_HITS,TO_CHAR(REVIEW_POSTED_TIME,'yyyy-mm-dd') as REVIEW_POSTED_TIME FROM REVIEW where CONTENTS_NO=#{contentsNo}) R, MEMBER M, CONTENTS C
WHERE R.ID = M.ID AND R.CONTENTS_NO = C.CONTENTS_NO AND RNUM BETWEEN #{pagingBean.startRowNumber} AND #{pagingBean.endRowNumber}

select * from comments where CONTENTS_NO='70291089'


select * from apply 

 SELECT p.PARTY_NO, p.id, p.PARTY_TITLE, ms.membership_name, p.PARTY_STATUS,
       p.PARTY_HEADCOUNT,p.PARTY_APPLYCOUNT,to_char(p.PARTY_POSTED_TIME,'yyyy-mm-dd') as PARTY_POSTED_TIME
       
       From(SELECT row_number() over (order by PARTY_NO desc) as rnum,PARTY_NO,ID,PARTY_TITLE,membership_no,PARTY_STATUS,
       PARTY_HEADCOUNT,PARTY_APPLYCOUNT,PARTY_POSTED_TIME FROM PARTY) p ,
       MEMBERSHIP ms
       
       WHERE rnum BETWEEN 1 AND 10 and p.membership_no = ms.membership_no

select rnum,C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
 		CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
		from (select row_number() over(order by CONTENTS_NO DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
		CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents where CONTENTS_TYPE LIKE '%영화%' and genre_code='783') C, 
		 GENRE G
		where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN 0 AND 5
