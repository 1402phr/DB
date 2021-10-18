create table saleman
  (empno number not null,
   ename varchar2(10),
   hiredate date,
   firedate date,
   firekind varchar2(5));

create table sale
  (empno number not null,
   saledate date,
   salecount number);

create table totsale
  (empno number not null,
   totsalecount number);

insert into saleman values (1,'김송희',to_date('06?02?01', 'yy?mm?dd') ,null ,'근무');
insert into saleman values (2,'박영우',to_date('02/04/07', 'yy?mm?dd') ,null,'근무');
insert into saleman values (3,'이대원',to_date('08/10/14', 'yy?mm?dd') ,
to_date('11/10/14', 'yy?mm?dd'),'퇴사');
insert into saleman values (4,'최항석',to_date('07/12/11', 'yy?mm?dd') ,null,'근무');
insert into saleman values (5,'강종민',to_date('08/09/09', 'yy?mm?dd') ,null,'근무');

insert into sale values (1, to_date('16/10/8', 'yy?mm?dd') , 9);
insert into sale values (1, to_date('16/10/15', 'yy?mm?dd') , 1);
insert into sale values (1, to_date('16/10/17', 'yy?mm?dd') , 5);
insert into sale values (1, to_date('16/11/2', 'yy?mm?dd') , 2);
insert into sale values (1, to_date('16/11/10', 'yy?mm?dd') , 4);
insert into sale values (1, to_date('16/11/27', 'yy?mm?dd') , 3);
insert into sale values (2, to_date('16/10/14', 'yy?mm?dd') , 2);
insert into sale values (2, to_date('16/10/19', 'yy?mm?dd') , 6);
insert into sale values (2, to_date('16/10/20', 'yy?mm?dd') , 4);
insert into sale values (2, to_date('16/11/21', 'yy?mm?dd') , 7);
insert into sale values (3, to_date('16/10/5', 'yy?mm?dd') , 12);
insert into sale values (3, to_date('16/10/6', 'yy?mm?dd') , 2);
insert into sale values (3, to_date('16/10/16', 'yy?mm?dd') , 4);
insert into sale values (3, to_date('16/11/10', 'yy?mm?dd') , 14);
insert into sale values (3, to_date('16/11/18', 'yy?mm?dd') , 9);
insert into sale values (4, to_date('16/10/7', 'yy?mm?dd') , 1);
insert into sale values (4, to_date('16/10/27', 'yy?mm?dd') , 2);
insert into sale values (4, to_date('16/11/4', 'yy?mm?dd') , 8);
insert into sale values (4, to_date('16/11/8', 'yy?mm?dd') , 4);
insert into sale values (4, to_date('16/11/28', 'yy?mm?dd') , 7);
insert into sale values (5, to_date('16/10/4', 'yy?mm?dd') , 9);
insert into sale values (5, to_date('16/10/5', 'yy?mm?dd') , 7);
insert into sale values (5, to_date('16/10/7', 'yy?mm?dd') , 14);
insert into sale values (5, to_date('16/11/5', 'yy?mm?dd') , 11);
insert into sale values (5, to_date('16/11/8', 'yy?mm?dd') , 4);
insert into sale values (5, to_date('16/11/10', 'yy?mm?dd') , 8);

insert into totsale
  select empno, sum(salecount)
    from sale
    group by empno;

alter table trade
add t_dc number;