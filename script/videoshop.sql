
create table cust
  (c_no number not null,
   c_name varchar(10),
   c_flag number(1),
   c_addr varchar(30),
   c_phone varchar(13),
   constraint c_no_pk primary key(c_no));

create table video
  (v_no number not null,
   v_name varchar2(20),
   v_actor varchar2(30),
   v_group varchar2(10),
   constraint v_no_pk primary key(v_no));

create table rent
  (r_no number constraint pk_rent primary key,
   r_date date,
   r_rtdate date,
   c_no number constraint r_c_no_fk references cust(c_no),
   r_latefee number(5),
   r_rentfee number(5),
   v_no number(2) constraint r_v_no_fk references video(v_no));

insert into cust values (101,'김진수', 1 ,'서울 성북구 동암동','02?455?5544');
insert into cust values (102,'고병진', 2 ,'서울 강서구 풍납동','02?229?2565');
insert into cust values (103,'이인술', 3 ,'서울 서초구 서초동','02?555?5555');
insert into cust values (104,'박병진', 1 ,'서울 동대문구 제기동','02?444?4444');

insert into video values (1,'인천상륙작전','이정재','액션');
insert into video values (2,'부산행','공유','스릴러');
insert into video values (3,'제이슨 본','맷데이먼','액션');
insert into video values (4,'아가씨','김민희, 김태리, 하정우','스릴러');
insert into video values (5,'사랑해 매기','유지니오 델베즈','드라마');
insert into video values (6,'굿바이 싱글','김혜선, 마동석','드라마');
insert into video values (7,'태풍이 지나가고','아베 히로시','드라마');
insert into video values (8,'봉이 김선달','유승호','모험');
insert into video values (9,'언더 워터','블레이크 라이블리','스릴러');
insert into video values (10,'이레셔널 맨','호아킨 피닉스','드라마');
insert into video values (11,'도리를 찾아서','엘런 드제너러스','모험');

insert into rent values (1,'2016?09?30','2016?10?01',101 ,0,1000,1);
insert into rent values (2,'2016?09?30','2016?10?01',101 ,0,500, 2);
insert into rent values (3,'2016?10?02','2016?10?03',102 ,0,500, 5);
insert into rent values (4,'2016?10?02','2016?10?03',102 ,0,1000, 6);
insert into rent values (5,'2016?10?02','2016?10?03',102 ,0,1000, 8);
insert into rent values (6,'2016?10?03','2016?10?04',101 ,0,500, 2);
insert into rent values (7,'2016?09?29','2016?09?30',104 ,1500,2000, 7);
insert into rent values (8,'2016?09?29','2016?09?30',104 ,1000,1500, 10);
insert into rent values (9,'2016?09?27','2016?09?28',103 ,2000,2500, 9);
insert into rent values (10,'2016?09?27','2016?09?28',103 ,2500,3000, 10);
insert into rent values (11,'2016?10?02','2016?10?03',102 ,0,500, 4);