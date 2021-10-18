
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


INSERT INTO student VALUES(20153075, '���Ѻ�','���',1,'C','M',177,80);
INSERT INTO student VALUES(20153088, '���¿�','���',1,'C','F',162,50);
INSERT INTO student VALUES(20143054, '������','���',2,'C','F',154,47);
INSERT INTO student VALUES(20152088, '���ο�','��������',1,'C','M',188,90);
INSERT INTO student VALUES(20142021, '�ɼ���','��������',2,'A','F',168,45);
INSERT INTO student VALUES(20132003, '����ö','��������',3,'B','M',null,63);
INSERT INTO student VALUES(20151062, '������','��ǻ������',1,'B','M',166,67);
INSERT INTO student VALUES(20141007, '������','��ǻ������',2,'A','M',174,64);
INSERT INTO student VALUES(20131001, '������','��ǻ������',3,'C','M',null,72);
INSERT INTO student VALUES(20131025, '������','��ǻ������',3,'A','F',172,63);


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

INSERT INTO subject VALUES('111', '�����ͺ��̽�','���翵',2,'��ǻ������');
INSERT INTO subject VALUES('110', '�ڵ�����','������',2,'��������');
INSERT INTO subject VALUES('109', '�ڵ�ȭ����','�ڹο�',3,'���');
INSERT INTO subject VALUES('101', '��ǻ�Ͱ���','������',3,'��ǻ������');
INSERT INTO subject VALUES('102', '�����۹�','���¿�',1,'���');
INSERT INTO subject VALUES('103', '�������ڽ���','������',1,'��������');
INSERT INTO subject VALUES('104', '�ý��ۺм�����','������',3,'��ǻ������');
INSERT INTO subject VALUES('105', '����Ҽ���','�����',1,'���');
INSERT INTO subject VALUES('106', '����ȸ�ν���','�ֿ���',3,'��������');
INSERT INTO subject VALUES('107', 'CAD����ǽ�','������',2,'���');
INSERT INTO subject VALUES('108', '����Ʈ�������','�ǹμ�',1,'��ǻ������');

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
