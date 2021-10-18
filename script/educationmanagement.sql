
CREATE TABLE student(
stu_no  number(9),
stu_name VARCHAR(12), 
stu_dept VARCHAR(20),  
stu_grade NUMBER(1),  
stu_class CHAR(1), 
stu_gender CHAR(1), 
stu_height NUMBER(5,2),
stu_weight NUMBER(5,2), 
  CONSTRAINT stu_no_pk PRIMARY KEY(stu_no));


INSERT INTO student VALUES(20153075, '옥한빛','기계',1,'C','M',177,80);
INSERT INTO student VALUES(20153088, '이태연','기계',1,'C','F',162,50);
INSERT INTO student VALUES(20143054, '유가인','기계',2,'C','F',154,47);
INSERT INTO student VALUES(20152088, '조민우','전기전자',1,'C','M',188,90);
INSERT INTO student VALUES(20142021, '심수정','전기전자',2,'A','F',168,45);
INSERT INTO student VALUES(20132003, '박희철','전기전자',3,'B','M',null,63);
INSERT INTO student VALUES(20151062, '김인중','컴퓨터정보',1,'B','M',166,67);
INSERT INTO student VALUES(20141007, '진현무','컴퓨터정보',2,'A','M',174,64);
INSERT INTO student VALUES(20131001, '김종헌','컴퓨터정보',3,'C','M',null,72);
INSERT INTO student VALUES(20131025, '옥성우','컴퓨터정보',3,'A','F',172,63);


CREATE TABLE subject(
sub_no  CHAR(3),
sub_name VARCHAR2(30)
  CONSTRAINT sub_name_nn NOT NULL,
sub_prof VARCHAR2(12)
  CONSTRAINT sub_prof_nn NOT NULL,
sub_grade NUMBER(1)
  CONSTRAINT sub_grade_nn NOT NULL,
sub_dept VARCHAR2(20)
  CONSTRAINT sub_dept_nn NOT NULL,
  CONSTRAINT sub_no_pk PRIMARY KEY(sub_no));

INSERT INTO subject VALUES('111', '데이터베이스','이재영',2,'컴퓨터정보');
INSERT INTO subject VALUES('110', '자동제어','정순정',2,'전기전자');
INSERT INTO subject VALUES('109', '자동화설계','박민영',3,'기계');
INSERT INTO subject VALUES('101', '컴퓨터개론','강종영',3,'컴퓨터정보');
INSERT INTO subject VALUES('102', '기계공작법','김태영',1,'기계');
INSERT INTO subject VALUES('103', '기초전자실험','김유석',1,'전기전자');
INSERT INTO subject VALUES('104', '시스템분석설계','강석현',3,'컴퓨터정보');
INSERT INTO subject VALUES('105', '기계요소설계','김명성',1,'기계');
INSERT INTO subject VALUES('106', '전자회로실험','최영민',3,'전기전자');
INSERT INTO subject VALUES('107', 'CAD응용실습','구봉규',2,'기계');
INSERT INTO subject VALUES('108', '소프트웨어공학','권민성',1,'컴퓨터정보');

CREATE TABLE enrol(
sub_no      CHAR(3)
CONSTRAINT enr_sub_no_fk REFERENCES subject(sub_no),
stu_no      number(9)
CONSTRAINT enr_stu_no_fk REFERENCES student(stu_no),
enr_grade  NUMBER(3),
  CONSTRAINT enr_pk PRIMARY KEY(sub_no,stu_no));


insert into enrol values('101',20131001,80);
insert into enrol values('104',20131001,56);
insert into enrol values('106',20132003,72);
insert into enrol values('103',20152088,45);
insert into enrol values('101',20131025,65);
insert into enrol values('104',20131025,65);
insert into enrol values('108',20151062,81);
insert into enrol values('107',20143054,41);
insert into enrol values('102',20153075,66);
insert into enrol values('105',20153075,56);
insert into enrol values('102',20153088,61);
insert into enrol values('105',20153088,78);

