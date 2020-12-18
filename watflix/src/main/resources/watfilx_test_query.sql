/*TEST FOR REVIEWWRITE AT FE*/
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL) VALUES('BOSE','1','BOSEBABY','GMAIL')
SELECT * FROM MEMBER
/*CONTENTS(CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL) << PRIMARY */
SELECT * FROM CONTENTS
/*INSERT INTO REVIEW(REVIEW_NO,ID,CONTENTS_NO,REVIEW_TITLE,REVIEW_CONTENTS) << PRIMARY*/
select * from review
INSERT INTO REVIEW(REVIEW_NO,ID,CONTENTS_NO,REVIEW_TITLE,REVIEW_CONTENTS) 
VALUES('454','BOSE','81171201','블러드 샷 봤냐?','지린다 가슴이 웅장해진다...꼭봐라...')

SELECT * FROM product

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
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL) VALUES('java14','$2a$10$i2cyl1OhUeJ71PUTHozM9enjjiJ0rZVVjn/z7FVXnJA1pBi7gOUH2','킹왕짱','gmail');
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL) VALUES('spring','$2a$10$i2cyl1OhUeJ71PUTHozM9enjjiJ0rZVVjn/z7FVXnJA1pBi7gOUH2','양성식','gmail');
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL) VALUES('java1','$2a$10$i2cyl1OhUeJ71PUTHozM9enjjiJ0rZVVjn/z7FVXnJA1pBi7gOUH2','양성식','gmail');
INSERT INTO MEMBER(ID,PASSWORD,NAME,EMAIL) VALUES('spring1','$2a$10$i2cyl1OhUeJ71PUTHozM9enjjiJ0rZVVjn/z7FVXnJA1pBi7gOUH2','양성식','gmail');


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
INSERT INTO report VALUES (report_seq.nextval, 'java', null, 257, 1, '신고합니다', sysdate);
INSERT INTO report VALUES (report_seq.nextval, 'java', 93, null, 2, '신고합니다', sysdate);

INSERT INTO review VALUES (review_seq.nextval, 'java3', '81004276', '리뷰 제목', '리뷰 내용', 0, 0, sysdate)

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

/* qna test
 */

select q.QNA_NO, q.QNA_TITLE,to_char(q.QNA_POSTED_TIME,'YYYY.MM.DD HH24:MI:SS')
	as QNA_POSTED_TIME,q.ID,q.QNA_CONTENTS,t.QNA_TYPE
	from qna q,member m,qna_Type t
	where q.ID=m.id and q.QNA_NO='29' and q.QNA_TYPE_NO=t.QNA_TYPE_NO

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

select * from acc_status;

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
select * from report where id='java';
select * from ACC_STATUS 




insert into acc_status values(3 , '계정정지')
select * from REPORT
select * from review
select * from CONTENTS where contents_no = '80061943'


insert into value(id,contents_no,review_title,review_contents) values()



REVIEW_NO NUMBER PRIMARY KEY,
	ID VARCHAR2(100) NOT NULL,
	CONSTRAINT REVIEW_ID_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID) on delete cascade,
	CONTENTS_NO VARCHAR2(100) NOT NULL,
	CONSTRAINT REVIEW_CONTENTS_NO_FK FOREIGN KEY(CONTENTS_NO) REFERENCES CONTENTS(CONTENTS_NO) on delete cascade,
	REVIEW_TITLE VARCHAR2(1000) NOT NULL,
	REVIEW_CONTENTS CLOB NOT NULL,
	REVIEW_HITS NUMBER DEFAULT 0,
	REVIEW_LIKES NUMBER DEFAULT 0,
	REVIEW_POSTED_TIME DATE DEFAULT SYSDATE






insert into report value(report_no, id, review_no, comments_no, report_type_no, REPORT_CONTENTS) values(1,'java2',1,'81171201',1,sysdate)
select * from report_type
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

/* 재우 test */
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
-- 권한
insert into grade values('ROLE_ADMIN', 'admin')
-- 내 리뷰 게시물 가져오기
SELECT REVIEW_NO,ID,CONTENTS_NO,REVIEW_TITLE,REVIEW_CONTENTS,REVIEW_LIKES,REVIEW_POSTED_TIME
FROM (SELECT ROW_NUMBER() OVER(ORDER BY review_no DESC) AS RNUM, REVIEW_NO, ID, CONTENTS_NO,
REVIEW_TITLE, REVIEW_CONTENTS, REVIEW_LIKES, TO_CHAR(REVIEW_POSTED_TIME,'yyyy-mm-dd') as REVIEW_POSTED_TIME
FROM REVIEW where id='java')
WHERE RNUM BETWEEN 1 AND 5 ORDER BY review_no desc;
-- 내가 작성한 전체 리뷰 count
select count(*) from review where id =''
-- 내 평점 게시물 가져오기
SELECT comments_no, id, contents_no, comments, comments_stars, comments_posted_time
FROM(SELECT row_number() over(order by comments_no desc) as rnum, comments_no, id, contents_no, comments, comments_stars, comments_posted_time
FROM comments where id = 'java')
WHERE rnum BETWEEN 1 AND 5;
-- 내가 작성한 전체 평점 count
select count(*) from review where id='spring'
select * from review
-- drop 시퀀스
drop SEQUENCE COMMENTS_SEQ;
drop SEQUENCE REVIEW_SEQ;
drop SEQUENCE NOTICE_SEQ;
drop SEQUENCE REPORT_SEQ;
drop SEQUENCE PRODUCT_SEQ;
drop SEQUENCE PRODUCT_ORDER_SEQ;
drop SEQUENCE FAQ_SEQ;
drop SEQUENCE QNA_SEQ;
drop SEQUENCE QNA_ANSWER_SEQ;
drop SEQUENCE PARTY_SEQ;
drop SEQUENCE POINT_HISTORY_SEQ;
-- 권한 추가
insert into grade values ( 'ROLE_ADMIN' , 'java');
-- 신고 당한 횟수 추가(MEMBER)
ALTER TABLE MEMBER ADD REPORTCOUNT NUMBER DEFAULT 0;
-- 검색 SQL
select C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,
C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
from (select row_number() over(order by CONTENTS_NO DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,
CONTENTS_BIG_THUMBNAIL,CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
from contents where contents_title like '%인%') C, GENRE G
where C.GENRE_CODE=G.GENRE_CODE;
select distinct G.GENRE_CODE, G.GENRE_NAME
from (select CONTENTS_TYPE, GENRE_CODE
from CONTENTS where contents_title like '%인%') C, GENRE G
where C.GENRE_CODE=G.GENRE_CODE
select * from CONTENTS
--
select comments_no, id, contents_no, comments, comments_stars, comments_posted_time from comments where comments_no = 1
select * from COmments
-- 신고 테이블 제약조건 수정
alter table report drop CONSTRAINT REPORT_REVIEW_NO_FK;
alter table report drop CONSTRAINT REPORT_COMMENTS_NO_FK;
alter table report add CONSTRAINT REPORT_REVIEW_NO_FK FOREIGN KEY (REVIEW_NO) REFERENCES REVIEW(REVIEW_NO) on delete cascade;
alter table report add CONSTRAINT REPORT_COMMENTS_NO_FK FOREIGN KEY(COMMENTS_NO) REFERENCES COMMENTS(COMMENTS_NO) on delete cascade;
--qa 테스트용
insert into member(id, password, name, sex, email)
values('test', '1', 'test', '여성', 'spring@spring.com');
insert into comments(comments_no, id, contents_no, comments)
values(COMMENTS_SEQ.nextval, 'test', 80165295,'매크로');
insert into review(review_no, id, contents_no, review_title, review_contents)
values(REVIEW_SEQ.nextval, 'test', 80165295, 'test', '메크로');
insert into member(id, password, name, sex, email)
values('test3', '$2a$10$i2cyl1OhUeJ71PUTHozM9enjjiJ0rZVVjn/z7FVXnJA1pBi7gOUH2', 'test', '여성', 'spring@sprin.com');
insert into grade values ( 'ROLE_MEMBER' , 'test3');
--데이터 삭제
delete from member
delete from comments
select * from member
select * from grade
select * from contents
UPDATE contents SET contents_avg_stars = 0


select * from grade where id='java'
insert into grade values ( 'ROLE_MEMBER' , 'java');
insert into grade values ( 'ROLE_MEMBER' , 'spring');

insert into grade values ( 'ROLE_MEMBER' , 'spring1');
insert into grade values ( 'ROLE_MEMBER' , 'java1');
insert into grade values ( 'ROLE_MEMBER' , 'java14');

update grade set grade = 'ROLE_ADMIN' where id='java'
insert into grade values('')

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
		
		select RNUM, m.id,m.password,m.name,m.tel,to_char(m.birth,'YYYY-MM-DD') as birth,m.sex,m.email,m.address,m.login_time,
 		m.login_fail,m.point,m.signup_date,m.agreement,m.acc_status_no,a.acc_status_info ,  		
 		r. (select count(*) from report where id='java') as reportCount 

 		
 		from member m, (select * from acc_status) a 
 		where a.acc_status_no=m.acc_status_no and m.id='java'
 		
 		
 		SELECT RNUM,M.ID,M.PASSWORD,M.NAME,M.TEL,M.BIRTH,M.SEX,M.EMAIL,M.ADDRESS,M.LOGIN_TIME,M.LOGIN_FAIL,M.POINT,
 		M.SIGNUP_DATE,M.AGREEMENT,M.ACC_STATUS_NO,A.ACC_STATUS_INFO, (SELECT COUNT(*) FROM REPORT WHERE ID = 'java') AS REPORTCOUNT
 		
 		FROM (SELECT ROW_NUMBER() OVER(ORDER BY ID DESC) AS RNUM,ID,PASSWORD,NAME,TEL,BIRTH,SEX,EMAIL,ADDRESS,LOGIN_TIME,LOGIN_FAIL,
 		POINT,TO_CHAR(SIGNUP_DATE, 'YYYY-MM-DD') AS SIGNUP_DATE,AGREEMENT,ACC_STATUS_NO 
 		
 		FROM MEMBER )M, REPORT R , ACC_STATUS A
 		WHERE M.ACC_STATUS_NO = A.ACC_STATUS_NO AND R.ID = M.ID AND RNUM BETWEEN 1 AND 5
 		
 		
 		SELECT RNUM,R.REVIEW_NO,M.ID,C.CONTENTS_NO,R.REVIEW_TITLE,R.REVIEW_CONTENTS,R.REVIEW_LIKES,R.REVIEW_HITS,R.REVIEW_POSTED_TIME
 		
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY REVIEW_NO DESC) AS RNUM,REVIEW_NO,ID,CONTENTS_NO,REVIEW_TITLE,
		REVIEW_CONTENTS,REVIEW_LIKES,REVIEW_HITS,TO_CHAR(REVIEW_POSTED_TIME,'yyyy-mm-dd') as REVIEW_POSTED_TIME 
		
		
		FROM REVIEW where CONTENTS_NO=#{contentsNo}) R, MEMBER M, CONTENTS C
		
		
		WHERE R.ID = M.ID AND R.CONTENTS_NO = C.CONTENTS_NO AND RNUM BETWEEN #{pagingBean.startRowNumber} AND #{pagingBean.endRowNumber}
		
		select * from report
		insert into comments(comments_no, id, contents_no, comments)
values(COMMENTS_SEQ.nextval, 'java', 81171201,'매크로');

insert into review(review_no, id, contents_no, review_title, review_contents)
values(REVIEW_SEQ.nextval, 'java', 81171201, '블러드샷 리뷰입니다.', '재미있어요. 추천합니다.');

		
		insert into report(report_no, id, review_no, report_type_no, report_contents)
values(REPORT_SEQ.nextval, 'java', 2, 2, '음란물 신고합니다.');


AND R.ID = M.ID

select * from report 
select * from ACC_STATUS

UPDATE MEMBER SET ACC_STATUS_NO = 2 WHERE ID='java';
SELECT * FROM MEMBER WHERE ID='java';

WHERE ID = #{id}

SELECT RNUM,M.ID,M.PASSWORD,M.NAME,M.TEL,M.BIRTH,M.SEX,M.EMAIL,M.ADDRESS,M.LOGIN_TIME,M.LOGIN_FAIL,M.POINT,
 		M.SIGNUP_DATE,M.AGREEMENT,M.ACC_STATUS_NO,A.ACC_STATUS_INFO
 		
 		FROM (SELECT ROW_NUMBER() OVER(ORDER BY ID DESC) AS RNUM,ID,PASSWORD,NAME,TEL,BIRTH,SEX,EMAIL,ADDRESS,LOGIN_TIME,LOGIN_FAIL,
 		POINT,TO_CHAR(SIGNUP_DATE, 'YYYY-MM-DD') AS SIGNUP_DATE,AGREEMENT,ACC_STATUS_NO 
 		
 		FROM MEMBER )M, ACC_STATUS A
 		WHERE M.ACC_STATUS_NO = A.ACC_STATUS_NO  AND RNUM BETWEEN 1 AND 5

ALTER TABLE MEMBER ADD REPORTCOUNT NUMBER DEFAULT 0;
SELECT * FROM MEMBER

		/*리뷰 좋아요 테스트*/
INSERT INTO REVIEW_LIKE VALUES(195,'java14')
INSERT INTO REVIEW_LIKE VALUES(196,'java14')
INSERT INTO REVIEW_LIKE VALUES(198,'java14')
INSERT INTO REVIEW_LIKE VALUES(198,'java1');
INSERT INTO REVIEW_LIKE VALUES(198,'spring');
INSERT INTO REVIEW_LIKE VALUES(198,'spring1');
SELECT FROM REVIEW_LIKE 
SELECT COUNT(*) FROM REVIEW_LIKE 
SELECT COUNT(*) FROM REVIEW_LIKE WHERE REVIEW_NO = 198

DELETE FROM REVIEW_LIKE WHERE REVIEW_NO = 196 AND ID = 'java14'


DELETE FROM REVIEW WHERE REVIEW_NO = #{reviewNo}
SELECT COUNT(*) FROM REVIEW WHERE REVIEW_NO = 270
SELECT RL.count(*),R.REVIEW_NO,R.ID FROM REVIEW R, REVIEW_LIKE RL WHERE R.ID = RL.ID AND REVIEW_NO = 270 AND ID = 'java'


SELECT (SELECT COUNT(*) FROM REVIEW_LIKE WHERE REVIEW_NO = 270 AND ID = 'java') AS REVIEW_LIKE_STATUS, REVIEW_NO, ID FROM REVIEW WHERE REVIEW_NO = 270 AND ID = 'java'
SELECT REVIEW_LIKE_STATUS, REVIEW_NO, ID FROM REVIEW_LIKE WHERE REVIEW_NO = 270 AND ID = 'java'

	<!-- 리뷰좋아요 유무 여부 -->
	<select id="mReviewLikeExist" parameterType="reviewLikeVO" resultType="int">
		SELECT (SELECT COUNT(*) FROM REVIEW_LIKE WHERE REVIEW_NO = #{reviewVO.reviewNo} AND ID = #{memberVO.id}) AS REVIEW_LIKE_COUNT, 
		REVIEW_NO, ID FROM REVIEW WHERE REVIEW_NO = #{reviewVO.reviewNo} AND ID = #{memberVO.id}
	</select>
		<!-- 리뷰 디테일 -->
	<select id="mGetReviewDetail" resultMap="reviewRM">
		SELECT R.REVIEW_NO,R.REVIEW_TITLE,R.REVIEW_LIKES,C.CONTENTS_NO,TO_CHAR(R.REVIEW_POSTED_TIME, 'YYYY.MM.DD HH24:MI:SS') 
		AS REVIEW_POSTED_TIME,M.ID,R.REVIEW_HITS,R.REVIEW_CONTENTS 
		FROM REVIEW R, MEMBER M, CONTENTS C 
		WHERE R.ID = M.ID AND R.REVIEW_NO = 1 and R.CONTENTS_NO=C.CONTENTS_NO
	</select>
	SELECT (SELECT COUNT(*) FROM REVIEW_LIKE WHERE REVIEW_NO = 1 AND ID = 'java') AS REVIEW_LIKE_STATUS, REVIEW_NO, ID FROM REVIEW WHERE REVIEW_NO = 1 AND ID = 'java'
	
	SELECT (SELECT COUNT(*) FROM REVIEW_LIKE WHERE REVIEW_NO = 1 AND ID = 'java') AS REVIEW_LIKE_STATUS,R.REVIEW_NO,R.REVIEW_TITLE,R.REVIEW_LIKES,C.CONTENTS_NO,TO_CHAR(R.REVIEW_POSTED_TIME, 'YYYY.MM.DD HH24:MI:SS') 
		AS REVIEW_POSTED_TIME,M.ID,R.REVIEW_HITS,R.REVIEW_CONTENTS 
		FROM REVIEW R, MEMBER M, CONTENTS C 
		WHERE R.ID = M.ID AND R.REVIEW_NO = 1 AND M.ID = 'java' AND R.CONTENTS_NO=C.CONTENTS_NO
		
	<select id="mReviewLikeExist" parameterType="reviewLikeVO" resultType="int">
		SELECT (SELECT COUNT(*) FROM REVIEW_LIKE WHERE REVIEW_NO = #{reviewVO.reviewNo} AND ID = #{memberVO.id}) AS REVIEW_LIKE_COUNT,
		R.REVIEW_NO,R.REVIEW_TITLE,R.REVIEW_LIKES,C.CONTENTS_NO,TO_CHAR(R.REVIEW_POSTED_TIME, 'YYYY.MM.DD HH24:MI:SS') 
		AS REVIEW_POSTED_TIME,M.ID,R.REVIEW_HITS,R.REVIEW_CONTENTS 
		FROM REVIEW R, MEMBER M, CONTENTS C 
		WHERE R.ID = M.ID AND R.REVIEW_NO = #{reviewNo} and R.CONTENTS_NO=C.CONTENTS_NO
	</select>
	
	SELECT (SELECT COUNT(*) FROM REVIEW_LIKE WHERE REVIEW_NO = 1 AND ID = 'java') AS REVIEW_LIKE_STATUS,R.REVIEW_NO,R.REVIEW_TITLE,
	R.REVIEW_LIKES,C.CONTENTS_NO,TO_CHAR(R.REVIEW_POSTED_TIME, 'YYYY.MM.DD HH24:MI:SS') 
	AS REVIEW_POSTED_TIME,M.ID,R.REVIEW_HITS,R.REVIEW_CONTENTS 
	FROM REVIEW R, MEMBER M, CONTENTS C 
	WHERE R.ID = M.ID AND R.REVIEW_NO = 1 AND R.CONTENTS_NO=C.CONTENTS_NO
	

UPDATE contents SET contents_avg_stars = 8 WHERE contents_no = 81171201;


		SELECT P.POINT_HISTORY_NO,P.ID,P.REVIEW_NO,R.REVIEW_TITLE,P.COMMENTS_NO,C.COMMENTS,P.ORDER_NO,
		POINT,POINT_HISTORY_CONTENTS,CURRENT_TIME, 
		CASE 
		WHEN R.CONTENTS_NO=T.CONTENTS_NO and P.REVIEW_NO>0 THEN T.CONTENTS_TITLE ELSE null END AS R.CONTENTS_TITLE,
		case 
		WHEN C.CONTENTS_NO=T.CONTENTS_NO and C.REVIEW_NO>0 THEN T.CONTENTS_TITLE ELSE null END AS C.CONTENTS_TITLE
		
		
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY POINT_HISTORY_NO DESC) AS RNUM,POINT_HISTORY_NO,ID,REVIEW_NO,COMMENTS_NO,ORDER_NO,
		POINT,POINT_HISTORY_CONTENTS,CURRENT_TIME FROM POINT_HISTORY) P, REVIEW R, COMMENTS C, PRODUCT_ORDER O,CONTENTS T
		WHERE P.REVIEW_NO=R.REVIEW_NO AND P.COMMENTS_NO=C.COMMENTS_NO AND O.ORDER_NO=P.ORDER_NO 


	

	SELECT NVL(SUM(comments_stars), 0) FROM comments WHERE contents_no=70131314;


/*컨텐츠좋아요 시작*/

SELECT (SELECT COUNT(*) FROM REVIEW_LIKE WHERE REVIEW_NO = 1 AND ID = 'java') AS REVIEW_LIKE_STATUS,R.REVIEW_NO,R.REVIEW_TITLE,
R.REVIEW_LIKES,C.CONTENTS_NO,TO_CHAR(R.REVIEW_POSTED_TIME, 'YYYY.MM.DD HH24:MI:SS') 
AS REVIEW_POSTED_TIME,M.ID,R.REVIEW_HITS,R.REVIEW_CONTENTS 
FROM REVIEW R, MEMBER M, CONTENTS C 
WHERE R.ID = M.ID AND R.REVIEW_NO = 1 AND R.CONTENTS_NO=C.CONTENTS_NO

SELECT COUNT(*) FROM CONTENTS_LIKE WHERE CONTENTS_NO = '1' AND ID = 'java'
/*mContentsHighHits의 Original*/
select C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,
C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
from (select row_number() over(order by CONTENTS_LIKES DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,
CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents) C, GENRE G
where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN 1 AND 10




SELECT (SELECT COUNT(*) FROM (SELECT DISTINCT M.ID, L.CONTENTS_NO, C.CONTENTS_TYPE FROM MEMBER M, CONTENTS C, CONTENTS_LIKE L 
WHERE L.CONTENTS_NO = C.CONTENTS_NO AND M.ID = 'java') ABC WHERE ID = 'java' AND C.CONTENTS_NO=CONTENTS_NO) 
AS CONTENTS_LIKE_STATUS,C.CONTENTS_NO,C.CONTENTS_TITLE,
C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,
C.CONTENTS_LIKES,C.CONTENTS_HITS,M.ID,R.REVIEW_NO,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
from (select row_number() over(order by CONTENTS_NO DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,CONTENTS_SUMMARY,
CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE 
from contents where CONTENTS_TYPE LIKE '%'||'액션'||'%') C, 
GENRE G, MEMBER M, REVIEW R
where C.GENRE_CODE=G.GENRE_CODE AND C.CONTENTS_NO = R.CONTENTS_NO AND M.ID=R.ID AND rnum BETWEEN 1 AND 10

select * from CONTENTS
select * from CONTENTS_like where id = 'java' 
UNION
SELECT * FROM CONTENTS WHERE CONTENTS_TYPE LIKE '%'||'액션'||'%'
AND CONTENTS_TYPE = '%'||'액션'||'%'

SELECT M.CONTENTS_NO, C.CONTENTS_TYPE LIKE '%'||'액션'||'%' FROM CONTENTS C, MEMBER M WHERE C.CONTENTS_NO = M.CONTENTS_NO

SELECT DISTINCT M.ID, L.CONTENTS_NO, C.CONTENTS_TYPE FROM MEMBER M, CONTENTS C, CONTENTS_LIKE L 
WHERE L.CONTENTS_NO = C.CONTENTS_NO AND M.ID = 'java'

(SELECT COUNT(*) FROM (SELECT DISTINCT M.ID, L.CONTENTS_NO, C.CONTENTS_TYPE FROM MEMBER M, CONTENTS C, CONTENTS_LIKE L 
WHERE L.CONTENTS_NO = C.CONTENTS_NO AND M.ID = 'java') ABC WHERE id = 'java')

SELECT COUNT(*) FROM (SELECT DISTINCT M.ID, L.CONTENTS_NO, C.CONTENTS_TYPE FROM MEMBER M, CONTENTS C, CONTENTS_LIKE L 
WHERE L.CONTENTS_NO = C.CONTENTS_NO AND M.ID = 'java') ABC WHERE ID = 'java' AND CONTENTS_NO = '81312563'

SELECT (SELECT COUNT(*) FROM CONTENTS_LIKE WHERE ID = 'java' AND C.CONTENTS_NO=CONTENTS_NO) AS CONTENTS_LIKE_STATUS,
		C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,
		G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
		CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
		FROM (SELECT row_number() over(ORDER BY CONTENTS_LIKES DESC) AS rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,
		CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
		CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents) C, GENRE G
		WHERE C.GENRE_CODE=G.GENRE_CODE AND rnum BETWEEN 1 AND 10

		
select distinct contents_type from CONTENTS

select C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
from (select row_number() over(order by CONTENTS_NO DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents where CONTENTS_TYPE LIKE '%'||'액션'||'%') C, 
GENRE G
where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN 1 AND 100

SELECT (SELECT COUNT(*) FROM (SELECT DISTINCT M.ID, L.CONTENTS_NO, C.CONTENTS_TYPE FROM MEMBER M, CONTENTS C, CONTENTS_LIKE L 
WHERE L.CONTENTS_NO = C.CONTENTS_NO AND M.ID = 'java') ABC WHERE ID = 'java' AND C.CONTENTS_NO=CONTENTS_NO) 
AS CONTENTS_LIKE_STATUS,C.CONTENTS_NO,C.CONTENTS_TITLE,
C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,
C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
from (select row_number() over(order by CONTENTS_NO DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,CONTENTS_SUMMARY,
CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE 
from contents where CONTENTS_TYPE LIKE '%'||'액션'||'%') C, 
GENRE G
where C.GENRE_CODE=G.GENRE_CODE AND rnum BETWEEN 1 AND 100

SELECT (SELECT COUNT(*)
		FROM (SELECT DISTINCT M.ID, L.CONTENTS_NO, C.CONTENTS_TYPE
			  FROM MEMBER M, CONTENTS C, CONTENTS_LIKE L 
			  WHERE L.CONTENTS_NO = C.CONTENTS_NO AND M.ID = 'java') ABC 
	    WHERE ID = 'java' AND C.CONTENTS_NO=CONTENTS_NO) AS CONTENTS_LIKE_STATUS,C.CONTENTS_NO,C.CONTENTS_TITLE,
		C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,
		C.CONTENTS_LIKES,C.CONTENTS_HITS,M.ID,
		CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
FROM    (SELECT row_number() over(order by CONTENTS_NO DESC) as rnum,
				CONTENTS_NO, CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,CONTENTS_SUMMARY,
				CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
				CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,
				CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,
				CONTENTS_PRODUCER,CONTENTS_AGE 
		 FROM   contents 
		 WHERE  CONTENTS_TYPE LIKE '%'||'액션'||'%') C, GENRE G, MEMBER M, REVIEW R
WHERE   C.GENRE_CODE=G.GENRE_CODE AND R.CONTENTS_NO = C.CONTENTS_NO AND M.ID=R.ID AND rnum BETWEEN 1 AND 100

SELECT (SELECT COUNT(*)
		FROM (SELECT DISTINCT M.ID, L.CONTENTS_NO, C.CONTENTS_TYPE
			  FROM MEMBER M, CONTENTS C, CONTENTS_LIKE L 
			  WHERE L.CONTENTS_NO = C.CONTENTS_NO AND M.ID = #{id}) ABC 
	    WHERE ID = #{id} AND C.CONTENTS_NO=CONTENTS_NO) AS CONTENTS_LIKE_STATUS,C.CONTENTS_NO,C.CONTENTS_TITLE,
		C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,
		C.CONTENTS_LIKES,C.CONTENTS_HITS,M.ID,
		CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
FROM    (SELECT row_number() over(order by CONTENTS_NO DESC) as rnum,
				CONTENTS_NO, CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,CONTENTS_SUMMARY,
				CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
				CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,
				CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,
				CONTENTS_PRODUCER,CONTENTS_AGE 
		 FROM   contents 
		 WHERE  CONTENTS_TYPE LIKE '%'||#{contentsType}||'%') C, GENRE G, MEMBER M, REVIEW R
WHERE   C.GENRE_CODE=G.GENRE_CODE AND R.CONTENTS_NO = C.CONTENTS_NO AND M.ID=R.ID AND rnum BETWEEN #{startNumber} AND #{endNumber}









SELECT *
FROM  GENRE
WHERE GERNE_COCE='81171201'
select * from member
	SELECT (SELECT COUNT(*) FROM (SELECT DISTINCT M.ID, L.CONTENTS_NO, C.CONTENTS_TYPE FROM MEMBER M, CONTENTS C, CONTENTS_LIKE L 
	WHERE L.CONTENTS_NO = C.CONTENTS_NO AND M.ID = 'java') ABC WHERE ID = 'java' AND C.CONTENTS_NO=CONTENTS_NO) 
	AS CONTENTS_LIKE_STATUS,C.CONTENTS_NO,C.CONTENTS_TITLE,
	C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,
	C.CONTENTS_LIKES,C.CONTENTS_HITS,
	CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
	from (select row_number() over(order by CONTENTS_NO DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,CONTENTS_SUMMARY,
	CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
	CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE 
	from contents where CONTENTS_TYPE LIKE '%'||'액션'||'%') C, 
	GENRE G
	where C.GENRE_CODE=G.GENRE_CODE AND rnum BETWEEN 1 AND 100
	
		SELECT (SELECT COUNT(*) FROM CONTENTS_LIKE WHERE ID = 'java' AND C.CONTENTS_NO=CONTENTS_NO) 
	AS CONTENTS_LIKE_STATUS,C.CONTENTS_NO,C.CONTENTS_TITLE,
	C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,
	C.CONTENTS_LIKES,C.CONTENTS_HITS,
	CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
	from (select row_number() over(order by CONTENTS_NO DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,CONTENTS_SUMMARY,
	CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
	CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE 
	from contents where CONTENTS_TYPE LIKE '%'||'액션'||'%') C, 
	GENRE G
	where C.GENRE_CODE=G.GENRE_CODE AND rnum BETWEEN 1 AND 100


SELECT (SELECT COUNT(*) FROM CONTENTS_LIKE WHERE CONTENTS_NO = #{contentsNo} AND ID = #{id}) as CONTENTS_LIKE_STATUS,C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,
G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
from (select row_number() over(order by CONTENTS_LIKES DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,
CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents) C, GENRE G
where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN 1 AND 10

SELECT (SELECT COUNT(*) FROM CONTENTS_LIKE WHERE CONTENTS_NO = '1' AND ID = 'java') as CONTENTS_LIKE_STATUS,C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,
G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
from (select row_number() over(order by CONTENTS_LIKES DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,
CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents) C, GENRE G
where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN 1 AND 10


SELECT 
C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,
G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE,
CASE WHEN C.contents_no = L.contents_no THEN 1 ELSE 0 END AS contents_like_status
from 
(select row_number() over(order by CONTENTS_LIKES DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,
CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,
CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE 
from contents) C, GENRE G,(SELECT contents_no FROM CONTENTS_LIKE WHERE ID = 'java') L
where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN 1 AND 10



select c.ea, C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,
C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE

from (select row_number() over(order by ea DESC) as rnum,c.ea,C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,C.GENRE_CODE,
C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,
C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,C.CONTENTS_DATE,C.CONTENTS_RUNNINGTIME,C.CONTENTS_ACTOR,C.CONTENTS_PRODUCER,C.CONTENTS_AGE from 

(
select distinct (select count(*) from comments where contents_no=c.contents_no) as ea,C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,C.GENRE_CODE,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,
C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
C.CONTENTS_DATE,C.CONTENTS_RUNNINGTIME,C.CONTENTS_ACTOR,C.CONTENTS_PRODUCER,C.CONTENTS_AGE from contents c) C)

C, GENRE G
where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN 1 AND 10 




distinct (select count(*) from comments where contents_no=c.contents_no) as ea,


select * from point_history
SELECT P.POINT_HISTORY_NO,P.ID,P.REVIEW_NO,R.REVIEW_TITLE,P.COMMENTS_NO,C.COMMENTS,P.ORDER_NO,
		POINT,POINT_HISTORY_CONTENTS,CURRENT_TIME
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY POINT_HISTORY_NO DESC) AS RNUM,POINT_HISTORY_NO,ID,REVIEW_NO,COMMENTS_NO,ORDER_NO,
		POINT,POINT_HISTORY_CONTENTS,CURRENT_TIME FROM POINT_HISTORY WHERE ID='java') P, REVIEW R, COMMENTS C
		WHERE 
		if(P.REVIEW_NO!=NULL)
		P.REVIEW_NO=R.REVIEW_NO or P.COMMENTS_NO=C.COMMENTS_NO

select C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
 		CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
		from (select row_number() over(order by CONTENTS_DATE) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
		CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents where CONTENTS_TYPE LIKE '%영화%') C, 
		GENRE G where C.GENRE_CODE=G.GENRE_CODE

delete from genre
select * from genre

select C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
 		CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
		from (select row_number() over(order by CONTENTS_DATE DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
		CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents where CONTENTS_TYPE LIKE '%영화%') C, 
		GENRE G
		where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN #{startNumber} AND #{endNumber} 


SELECT (SELECT FROM CONTENTS_LIKE WHERE ID = #{id}) as CONTENTS_LIKE_STATUS,C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,
G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
from (select row_number() over(order by CONTENTS_LIKES DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,
CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents) C, GENRE G
where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN 1 AND 10

SELECT (SELECT CONTENTS_NO FROM CONTENTS_LIKE WHERE ID = 'spring') AS CONTENTS_LIKE_STATUS,C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,
G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,
C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
from (select row_number() over(order by CONTENTS_LIKES DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,
CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents) C,
GENRE G
where CONTENTS_LIKE_STATUS IN(SELECT CONTENTS_NO FROM CONTENTS WHERE CONTENTS)C.GENRE_CODE=G.GENRE_CODE AND rnum BETWEEN 1 AND 10


SELECT (SELECT COUNT(*) FROM REVIEW_LIKE WHERE REVIEW_NO = #{reviewNo} AND ID = #{id}) AS REVIEW_LIKE_STATUS,R.REVIEW_NO,R.REVIEW_TITLE,R.REVIEW_LIKES,C.CONTENTS_NO,TO_CHAR(R.REVIEW_POSTED_TIME, 'YYYY.MM.DD HH24:MI:SS') 
AS REVIEW_POSTED_TIME,M.ID,R.REVIEW_HITS,R.REVIEW_CONTENTS 
FROM REVIEW R, MEMBER M, CONTENTS C 
WHERE R.ID = M.ID AND R.REVIEW_NO = #{reviewNo} AND R.CONTENTS_NO=C.CONTENTS_NO

SELECT CONTENTS_NO FROM CONTENTS_LIKE WHERE ID = 'spring'
SELECT CONTENTS_NO FROM CONTENTS
SELECT COUNT(*) FROM CONTENTS_LIKE WHERE ID = 'spring'
SELECT COUNT(CONTENTS_NO) FROM CONTENTS_LIKE WHERE ID = 'spring'

SELECT * FROM CONTENTS_LIKE

SELECT C.CONTENTS_NO FROM CONTENTS C, CONTENTS_LIKE L WHERE C.CONTENTS_NO = L.CONTENTS_NO AND CONTENTS_NO = '60004480'

select count(*) from CONTENTS_LIKE WHERE ID='java' and CONTENTS_NO = '60004480'

select * from contents_like where id='spring'

SELECT (SELECT COUNT(*) FROM CONTENTS_LIKE WHERE ID = 'spring' and C.CONTENTS_NO=CONTENTS_NO) AS CONTENTS_LIKE_STATUS,
C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,
G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
from (select row_number() over(order by CONTENTS_LIKES DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,
CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents) C, GENRE G
where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN 1 AND 10

SELECT (SELECT COUNT(*) FROM CONTENTS_LIKE WHERE ID = 'java' AND C.CONTENTS_NO=CONTENTS_NO) AS CONTENTS_LIKE_STATUS,
C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,
G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
FROM (SELECT row_number() over(ORDER BY CONTENTS_LIKES DESC) AS rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,
CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents) C, GENRE G
WHERE C.GENRE_CODE=G.GENRE_CODE AND rnum BETWEEN 1 AND 10

select C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,
C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
from (select row_number() over(order by CONTENTS_LIKES DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,
CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents) C, GENRE G
where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN 1 AND 10
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> branch 'master' of https://github.com/Minikanko/-Kosta-FinalProject-Dev6m.git


select point from member where id = 'java14'


SELECT P.POINT_HISTORY_NO,P.ID,P.REVIEW_NO,(select REVIEW_TITLE from REVIEW where P.REVIEW_no=REVIEW_no) AS REVIEW_TITLE,P.COMMENTS_NO,
		(select COMMENTS from COMMENTS where P.COMMENTS_no=COMMENTS_no) as COMMENTS,P.ORDER_NO,
		POINT,POINT_HISTORY_CONTENTS,CURRENT_TIME
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY POINT_HISTORY_NO DESC) AS RNUM,POINT_HISTORY_NO,ID,REVIEW_NO,COMMENTS_NO,ORDER_NO,
		POINT,POINT_HISTORY_CONTENTS,CURRENT_TIME FROM POINT_HISTORY WHERE ID='java') P, REVIEW R, COMMENTS C
		
		select * from point_history
select * from member
SELECT P.POINT_HISTORY_NO,P.ID,P.REVIEW_NO,(select REVIEW_TITLE from REVIEW where P.REVIEW_no=REVIEW_no) AS REVIEW_TITLE,
      P.COMMENTS_NO,P.POINT,P.POINT_HISTORY_CONTENTS,P.CURRENT_TIME,P.ORDER_NO,
      (select COMMENTS from COMMENTS where P.COMMENTS_no=COMMENTS_no) as COMMENTS
      FROM (SELECT ROW_NUMBER() OVER(ORDER BY POINT_HISTORY_NO DESC) AS RNUM,
      POINT_HISTORY_NO,ID,REVIEW_NO,COMMENTS_NO,ORDER_NO,
      POINT,POINT_HISTORY_CONTENTS,CURRENT_TIME FROM POINT_HISTORY WHERE ID='java') P where
      RNUM BETWEEN #{pagingBean.startRowNumber} AND #{pagingBean.endRowNumber}
=======



select point from member where id = 'java14'


SELECT P.POINT_HISTORY_NO,P.ID,P.REVIEW_NO,(select REVIEW_TITLE from REVIEW where P.REVIEW_no=REVIEW_no) AS REVIEW_TITLE,P.COMMENTS_NO,
		(select COMMENTS from COMMENTS where P.COMMENTS_no=COMMENTS_no) as COMMENTS,P.ORDER_NO,
		POINT,POINT_HISTORY_CONTENTS,CURRENT_TIME
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY POINT_HISTORY_NO DESC) AS RNUM,POINT_HISTORY_NO,ID,REVIEW_NO,COMMENTS_NO,ORDER_NO,
		POINT,POINT_HISTORY_CONTENTS,CURRENT_TIME FROM POINT_HISTORY WHERE ID='java') P, REVIEW R, COMMENTS C
		
		select * from point_history
select * from member
SELECT P.POINT_HISTORY_NO,P.ID,P.REVIEW_NO,(select REVIEW_TITLE from REVIEW where P.REVIEW_no=REVIEW_no) AS REVIEW_TITLE,
      P.COMMENTS_NO,P.POINT,P.POINT_HISTORY_CONTENTS,P.CURRENT_TIME,P.ORDER_NO,
      (select COMMENTS from COMMENTS where P.COMMENTS_no=COMMENTS_no) as COMMENTS
      FROM (SELECT ROW_NUMBER() OVER(ORDER BY POINT_HISTORY_NO DESC) AS RNUM,
      POINT_HISTORY_NO,ID,REVIEW_NO,COMMENTS_NO,ORDER_NO,
      POINT,POINT_HISTORY_CONTENTS,CURRENT_TIME FROM POINT_HISTORY WHERE ID='java') P where
      RNUM BETWEEN #{pagingBean.startRowNumber} AND #{pagingBean.endRowNumber}

>>>>>>> branch 'master' of https://github.com/Minikanko/-Kosta-FinalProject-Dev6m.git


select * from genre



	


SELECT (SELECT COUNT(*) FROM CONTENTS_LIKE WHERE CONTENTS_NO = #{contentsNo} AND ID = #{id}) as CONTENTS_LIKE_STATUS,C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,
G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
from (select row_number() over(order by CONTENTS_LIKES DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,
CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents) C, GENRE G
where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN 1 AND 10



	select O.ORDER_NO,O.PRODUCT_NO,O.PRODUCT_NAME,O.PRODUCT_BRAND,O.QUANTITY,O.ID,O.PURCHASED_TIME
		FROM 
		(SELECT row_number() over(order by ORDER_NO) as rnum,O.ORDER_NO,O.PRODUCT_NO,P.PRODUCT_NAME,P.PRODUCT_BRAND,O.QUANTITY,O.ID,O.PURCHASED_TIME
		FROM PRODUCT_ORDER O,PRODUCT P WHERE P.PRODUCT_NO=O.PRODUCT_NO AND ID='java') O
		WHERE rnum BETWEEN #{pagingBean.startRowNumber} AND #{pagingBean.endRowNumber}

		
		
		
		SELECT P.POINT_HISTORY_NO,P.ID,P.REVIEW_NO,(select REVIEW_TITLE from REVIEW where P.REVIEW_no=REVIEW_no) AS REVIEW_TITLE,
			P.COMMENTS_NO,P.POINT,P.POINT_HISTORY_CONTENTS,P.CURRENT_TIME,P.ORDER_NO,
		(select COMMENTS from COMMENTS where P.COMMENTS_no=COMMENTS_no) as COMMENTS
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY POINT_HISTORY_NO DESC) AS RNUM,
		POINT_HISTORY_NO,ID,REVIEW_NO,COMMENTS_NO,ORDER_NO,
		POINT,POINT_HISTORY_CONTENTS,CURRENT_TIME FROM POINT_HISTORY WHERE ID='java') P 
		
SELECT (SELECT COUNT(*) FROM CONTENTS_LIKE WHERE CONTENTS_NO = '1' AND ID = 'java') as CONTENTS_LIKE_STATUS,C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,
G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
from (select row_number() over(order by CONTENTS_LIKES DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,
CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents) C, GENRE G
where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN 1 AND 10


SELECT 
C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,
G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE,
CASE WHEN C.contents_no = L.contents_no THEN 1 ELSE 0 END AS contents_like_status
from 
(select row_number() over(order by CONTENTS_LIKES DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,
CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,
CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE 
from contents) C, GENRE G,(SELECT contents_no FROM CONTENTS_LIKE WHERE ID = 'java') L
where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN 1 AND 10



select c.ea, C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,
C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE

from (select row_number() over(order by ea DESC) as rnum,c.ea,C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,C.GENRE_CODE,
C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,
C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,C.CONTENTS_DATE,C.CONTENTS_RUNNINGTIME,C.CONTENTS_ACTOR,C.CONTENTS_PRODUCER,C.CONTENTS_AGE from 

(
select distinct (select count(*) from comments where contents_no=c.contents_no) as ea,C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,C.GENRE_CODE,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,
C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
C.CONTENTS_DATE,C.CONTENTS_RUNNINGTIME,C.CONTENTS_ACTOR,C.CONTENTS_PRODUCER,C.CONTENTS_AGE from contents c) C)

C, GENRE G
where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN 1 AND 10 




distinct (select count(*) from comments where contents_no=c.contents_no) as ea,


select * from point_history
SELECT P.POINT_HISTORY_NO,P.ID,P.REVIEW_NO,R.REVIEW_TITLE,P.COMMENTS_NO,C.COMMENTS,P.ORDER_NO,
		POINT,POINT_HISTORY_CONTENTS,CURRENT_TIME
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY POINT_HISTORY_NO DESC) AS RNUM,POINT_HISTORY_NO,ID,REVIEW_NO,COMMENTS_NO,ORDER_NO,
		POINT,POINT_HISTORY_CONTENTS,CURRENT_TIME FROM POINT_HISTORY WHERE ID='java') P, REVIEW R, COMMENTS C
		WHERE 
		if(P.REVIEW_NO!=NULL)
		P.REVIEW_NO=R.REVIEW_NO or P.COMMENTS_NO=C.COMMENTS_NO

select C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
 		CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
		from (select row_number() over(order by CONTENTS_DATE) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
		CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents where CONTENTS_TYPE LIKE '%영화%') C, 
		GENRE G where C.GENRE_CODE=G.GENRE_CODE

delete from genre
select * from genre

select C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
 		CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
		from (select row_number() over(order by CONTENTS_DATE DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
		CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents where CONTENTS_TYPE LIKE '%영화%') C, 
		GENRE G
		where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN #{startNumber} AND #{endNumber} 


SELECT (SELECT FROM CONTENTS_LIKE WHERE ID = #{id}) as CONTENTS_LIKE_STATUS,C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,
G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
from (select row_number() over(order by CONTENTS_LIKES DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,
CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents) C, GENRE G
where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN 1 AND 10

SELECT (SELECT CONTENTS_NO FROM CONTENTS_LIKE WHERE ID = 'spring') AS CONTENTS_LIKE_STATUS,C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,
G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,
C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
from (select row_number() over(order by CONTENTS_LIKES DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,
CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents) C,
GENRE G
where CONTENTS_LIKE_STATUS IN(SELECT CONTENTS_NO FROM CONTENTS WHERE CONTENTS)C.GENRE_CODE=G.GENRE_CODE AND rnum BETWEEN 1 AND 10


SELECT (SELECT COUNT(*) FROM REVIEW_LIKE WHERE REVIEW_NO = #{reviewNo} AND ID = #{id}) AS REVIEW_LIKE_STATUS,R.REVIEW_NO,R.REVIEW_TITLE,R.REVIEW_LIKES,C.CONTENTS_NO,TO_CHAR(R.REVIEW_POSTED_TIME, 'YYYY.MM.DD HH24:MI:SS') 
AS REVIEW_POSTED_TIME,M.ID,R.REVIEW_HITS,R.REVIEW_CONTENTS 
FROM REVIEW R, MEMBER M, CONTENTS C 
WHERE R.ID = M.ID AND R.REVIEW_NO = #{reviewNo} AND R.CONTENTS_NO=C.CONTENTS_NO

SELECT CONTENTS_NO FROM CONTENTS_LIKE WHERE ID = 'spring'
SELECT CONTENTS_NO FROM CONTENTS
SELECT COUNT(*) FROM CONTENTS_LIKE WHERE ID = 'spring'
SELECT COUNT(CONTENTS_NO) FROM CONTENTS_LIKE WHERE ID = 'spring'

SELECT * FROM CONTENTS_LIKE

SELECT C.CONTENTS_NO FROM CONTENTS C, CONTENTS_LIKE L WHERE C.CONTENTS_NO = L.CONTENTS_NO AND CONTENTS_NO = '60004480'

select count(*) from CONTENTS_LIKE WHERE ID='java' and CONTENTS_NO = '60004480'

select * from contents_like where id='spring'

SELECT (SELECT COUNT(*) FROM CONTENTS_LIKE WHERE ID = 'spring' and C.CONTENTS_NO=CONTENTS_NO) AS CONTENTS_LIKE_STATUS,
C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,
G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
from (select row_number() over(order by CONTENTS_LIKES DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,
CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents) C, GENRE G
where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN 1 AND 10

SELECT (SELECT COUNT(*) FROM CONTENTS_LIKE WHERE ID = 'java' AND C.CONTENTS_NO=CONTENTS_NO) AS CONTENTS_LIKE_STATUS,
C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,
G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
FROM (SELECT row_number() over(ORDER BY CONTENTS_LIKES DESC) AS rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,
CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents) C, GENRE G
WHERE C.GENRE_CODE=G.GENRE_CODE AND rnum BETWEEN 1 AND 10

select C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,
C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
from (select row_number() over(order by CONTENTS_LIKES DESC) as rnum,CONTENTS_NO,CONTENTS_TITLE,CONTENTS_TYPE,GENRE_CODE,
CONTENTS_SUMMARY,CONTENTS_SMALL_THUMBNAIL,CONTENTS_BIG_THUMBNAIL,
CONTENTS_AVG_STARS,CONTENTS_LIKES,CONTENTS_HITS,CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE from contents) C, GENRE G
where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN 1 AND 10


select point from member where id = 'java14'


SELECT P.POINT_HISTORY_NO,P.ID,P.REVIEW_NO,(select REVIEW_TITLE from REVIEW where P.REVIEW_no=REVIEW_no) AS REVIEW_TITLE,P.COMMENTS_NO,
		(select COMMENTS from COMMENTS where P.COMMENTS_no=COMMENTS_no) as COMMENTS,P.ORDER_NO,
		POINT,POINT_HISTORY_CONTENTS,CURRENT_TIME
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY POINT_HISTORY_NO DESC) AS RNUM,POINT_HISTORY_NO,ID,REVIEW_NO,COMMENTS_NO,ORDER_NO,
		POINT,POINT_HISTORY_CONTENTS,CURRENT_TIME FROM POINT_HISTORY WHERE ID='java') P, REVIEW R, COMMENTS C
		
		select * from point_history
select * from member
SELECT P.POINT_HISTORY_NO,P.ID,P.REVIEW_NO,(select REVIEW_TITLE from REVIEW where P.REVIEW_no=REVIEW_no) AS REVIEW_TITLE,
      P.COMMENTS_NO,P.POINT,P.POINT_HISTORY_CONTENTS,P.CURRENT_TIME,P.ORDER_NO,
      (select COMMENTS from COMMENTS where P.COMMENTS_no=COMMENTS_no) as COMMENTS
      FROM (SELECT ROW_NUMBER() OVER(ORDER BY POINT_HISTORY_NO DESC) AS RNUM,
      POINT_HISTORY_NO,ID,REVIEW_NO,COMMENTS_NO,ORDER_NO,
      POINT,POINT_HISTORY_CONTENTS,CURRENT_TIME FROM POINT_HISTORY WHERE ID='java') P where
      RNUM BETWEEN #{pagingBean.startRowNumber} AND #{pagingBean.endRowNumber}

select * from genre
select * from all_tables where owner = 'WATFLIX';
select * from member;
select * from acc_status;
select * from contents;
select * from review;
select * from review_like;
select * from contents_like;
select * from 
select * from 
select * from 
select * from 
select * from 
select * from 

<<<<<<< HEAD
<<<<<<< HEAD
select c.ea, C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,G.GENRE_CODE,G.GENRE_NAME,
C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,
C.CONTENTS_LIKES,C.CONTENTS_HITS,
		CONTENTS_DATE,CONTENTS_RUNNINGTIME,CONTENTS_ACTOR,CONTENTS_PRODUCER,CONTENTS_AGE
		from (select row_number() over(order by ea DESC) as rnum,c.ea,
		C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,C.GENRE_CODE,
		C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,C.CONTENTS_BIG_THUMBNAIL,
		C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
		C.CONTENTS_DATE,C.CONTENTS_RUNNINGTIME,C.CONTENTS_ACTOR,
		C.CONTENTS_PRODUCER,C.CONTENTS_AGE from 
		(select distinct (select count(*) from comments where contents_no=c.contents_no) 
		as ea,C.CONTENTS_NO,C.CONTENTS_TITLE,C.CONTENTS_TYPE,C.GENRE_CODE,C.CONTENTS_SUMMARY,C.CONTENTS_SMALL_THUMBNAIL,
		C.CONTENTS_BIG_THUMBNAIL,C.CONTENTS_AVG_STARS,C.CONTENTS_LIKES,C.CONTENTS_HITS,
		C.CONTENTS_DATE,C.CONTENTS_RUNNINGTIME,C.CONTENTS_ACTOR,C.CONTENTS_PRODUCER,
		C.CONTENTS_AGE from contents c) C)
		C, GENRE G
		where C.GENRE_CODE=G.GENRE_CODE and rnum BETWEEN 1 AND 10 
		select * from comments
=======


SELECT qna_answer_no, qna_answer_contents, qna_answer_posted_time, qna_no, id
		FROM qna_answer WHERE qna_no=1
		
		SELECT rnum, qna_answer_no, qna_answer_contents, qna_answer_posted_time, qna_no, id
		FROM(SELECT ROW_NUMBER() OVER(ORDER BY qna_answer_no DESC) AS rnum, qna_answer_no, qna_answer_contents, qna_answer_posted_time, qna_no, id FROM qna_answer WHERE qna_no=1)
		WHERE rnum BETWEEN 1 AND 5


>>>>>>> branch 'master' of https://github.com/Minikanko/-Kosta-FinalProject-Dev6m.git
