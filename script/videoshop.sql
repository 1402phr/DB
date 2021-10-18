
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

insert into cust values (101,'������', 1 ,'���� ���ϱ� ���ϵ�','02?455?5544');
insert into cust values (102,'����', 2 ,'���� ������ ǳ����','02?229?2565');
insert into cust values (103,'���μ�', 3 ,'���� ���ʱ� ���ʵ�','02?555?5555');
insert into cust values (104,'�ں���', 1 ,'���� ���빮�� ���⵿','02?444?4444');

insert into video values (1,'��õ�������','������','�׼�');
insert into video values (2,'�λ���','����','������');
insert into video values (3,'���̽� ��','�˵��̸�','�׼�');
insert into video values (4,'�ư���','�����, ���¸�, ������','������');
insert into video values (5,'����� �ű�','�����Ͽ� ������','���');
insert into video values (6,'�¹��� �̱�','������, ������','���');
insert into video values (7,'��ǳ�� ��������','�ƺ� ���ν�','���');
insert into video values (8,'���� �輱��','����ȣ','����');
insert into video values (9,'��� ����','����ũ ���̺�','������');
insert into video values (10,'�̷��ų� ��','ȣ��Ų �Ǵн�','���');
insert into video values (11,'������ ã�Ƽ�','���� �����ʷ���','����');

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