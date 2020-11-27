delete from genre
select * from genre
select * from CONTENTS

select * from member
select * from acc_status
drop table acc_status cascade constraint
drop table member cascade constraint
drop table grade

SELECT * FROM ALL_CONSTRAINTS 
select m.id,m.password,m.name,m.tel,m.birth,m.sex,m.email,m.address,m.login_time,
 		m.login_fail,m.point,m.signup_date,m.agreement,m.acc_status_no,a.acc_status_info
 		from member m, (select * from acc_status) a
 		where a.acc_status_no=m.acc_status_no and m.id='java'

