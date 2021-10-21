
-- ����Į�����̺�
CREATE TABLE color(
    cno NUMBER(3)
        CONSTRAINT CLR_NO_PK PRIMARY KEY,
    /*
        cno ��� �÷��� ����Ÿ������ 3�ڸ����� �Է��Ҽ� �ֵ��� �ϰ�
        ���������� �⺻Ű ���������� �ְ� �� �̸��� CLR_NO_PK �� ����ϰڽ��ϴ�.
        
        ���������� �����ͺ��̽� ������ ����� �ȴ�.
        ���� ������ �̸��� �������� �ʴ´�.
        ���� ���������̸��� ������� ������ ����Ŭ�� �ڵ����� ���� �ο��Ѵ�.
    */
    cname VARCHAR2(50 CHAR)
        CONSTRAINT CLR_NAME_NN NOT NULL
        CONSTRAINT CLR_NAME_UK UNIQUE,
    ccode VARCHAR2(7 CHAR) DEFAULT '#000000'
        CONSTRAINT CLR_CODE_UK UNIQUE
);

-- �ѱ� Į�����̺�
CREATE TABLE kcolor(
    kcno NUMBER(3)
        CONSTRAINT KCLR_NO_PK PRIMARY KEY,
    /*
        cno ��� �÷��� ����Ÿ������ 3�ڸ����� �Է��Ҽ� �ֵ��� �ϰ�
        ���������� �⺻Ű ���������� �ְ� �� �̸��� CLR_NO_PK �� ����ϰڽ��ϴ�.
        
        ���������� �����ͺ��̽� ������ ����� �ȴ�.
        ���� ������ �̸��� �������� �ʴ´�.
        ���� ���������̸��� ������� ������ ����Ŭ�� �ڵ����� ���� �ο��Ѵ�.
    */
    kcname VARCHAR2(50 CHAR)
        CONSTRAINT KCLR_NAME_NN NOT NULL
        CONSTRAINT KCLR_NAME_UK UNIQUE,
    ccode VARCHAR2(7 CHAR) DEFAULT '#000000'
        CONSTRAINT KCLR_CODE_UK UNIQUE
);
/*
    ���̺� �����
    ���� ]
        CREATE TABLE ���̺��̸�(
            �÷��̸� ������Ÿ��[(����)] [ DEFAULT ������ ]
                [
                CONSTRAINT ���������̸� ��������
                CONSTRAINT ���������̸� ��������
                CONSTRAINT ���������̸� ��������
                .....
                ],
            �÷��̸� ������Ÿ��[(����)] [ DEFAULT ������ ]
                [���������߰�]
            ,
            ....
        );
        
    ������ �߰��ϱ�
        INSERT ���
            
            ���� 1]
                
                INSERT INTO
                    ���̺��̸�
                VALUES(
                    �����͵� ���...
                );
                
            ���� 2 ]
                
                INSERT INTO
                    ���̺��̸�(�÷��̸�1, �÷��̸�2, ... , �÷��̸�N)
                VALUES(
                    ������1, ������2, ... , ������N
                );
*/


INSERT INTO
    color(cno, cname)
VALUES(
    (SELECT NVL(MAX(cno) + 1, 1) FROM color),
    'black'
);

INSERT INTO
    color
VALUES(
    (SELECT NVL(MAX(cno) + 1, 1) FROM color),
    'red', '#FF0000'
);

INSERT INTO
    color
VALUES(
    (SELECT NVL(MAX(cno) + 1, 1) FROM color),
    'green', '#00FF00'
);

INSERT INTO
    color
VALUES(
    (SELECT NVL(MAX(cno) + 1, 1) FROM color),
    'blue', '#0000FF'
);



DELETE FROM kcolor;

INSERT INTO
    kcolor(kcno, kcname)
VALUES(
    (SELECT NVL(MAX(kcno) + 1, 1) FROM kcolor),
    '����'
);

INSERT INTO
    kcolor
VALUES(
    (SELECT NVL(MAX(kcno) + 1, 1) FROM kcolor),
    '����', '#FF0000'
);

INSERT INTO
    kcolor
VALUES(
    (SELECT NVL(MAX(kcno) + 1, 1) FROM kcolor),
    '�ʷ�', '#00FF00'
);

INSERT INTO
    kcolor
VALUES(
    (SELECT NVL(MAX(kcno) + 1, 1) FROM kcolor),
    '�Ķ�', '#0000FF'
);


-- ���̺��� ������ ���� ������ �����͸� ������ �� �ֵ��� ��ġ�� �ؾ��ϴµ�
-- �� ����� �⺻Ű�� �ִ� ����̴�.


CREATE TABLE NO1(
    NO NUMBER primary key
);


ROLLBACK;
INSERT INTO
    NO1
VALUES(
    1
);

DROP TABLE NO1;

------------------------------------------------------------------------------------------------
/*
    JOIN : �ΰ��̻��� ���̺��� ���ϴ� �����͸� �������� ���
*/

SELECT * FROM  color;

SELECT * FROM color, kcolor;



-- ������� ����̸�, ����ȣ, ����̸��� ��ȸ�ϼ���.
SELECT
    *--e.ename ����̸�, e.mgr ����ȣ, s.ename ����̸�
FROM
    emp e, emp s
WHERE
    e.mgr = s.empno(+)
;

-- Non Equi Join
-- : ����񱳿����ڷ� ��������ʰ� �����ϴ� ���

-- ������� �����ȣ, ����̸�, �޿�, �޿������ ��ȸ�ϼ���.
SELECT
    empno �����ȣ, ename ����̸�, sal �޿�, grade �޿����--, losal, hisal
FROM
    emp, salgrade
WHERE
    sal BETWEEN losal AND hisal
;

select * FROM EMP;

/*
    ���� ]
        �������ǰ� �Ϲ������� ���� �����ص� �����ϴ�.
*/

-- ������� 10�� �μ�������� �����ȣ, ����̸�, �޿�, �޿������ ��ȸ�ϼ���.
SELECT
    empno �����ȣ, ename ����̸�, deptno �μ���ȣ, sal �޿�, grade �޿����
FROM
    emp, salgrade
WHERE
    sal BETWEEN losal AND hisal
    AND deptno = 10
;

/*
    ������ 'MANAGER' �� �������
        ����̸�, ����, �Ի���, �޿�, �μ��̸��� ��ȸ�ϼ���.
*/

/*
    �޿��� ���� ���� �����
        ����̸�, ����, �Ի���, �޿�, �μ��̸�, �μ���ġ�� ��ȸ�ϼ���.
*/

/*
    ����̸��� 5������ �������
        ����̸�, ����, �Ի���, �޿�, �޿����
    �� ��ȸ�ϼ���.
*/

/*
    �Ի�⵵�� 81���̰� ������ 'MANAGER' �� �������
        ����̸�, ����, �Ի���, �޿�, �޿����, �μ��̸�, �μ���ġ�� ��ȸ�ϼ���.
*/

/*
    �������
        ����̸�, ����, �޿�, ����̸�, �޿������ ��ȸ�ϼ���.
*/

/*
    �������
        ����̸�, ����, �޿�, ����̸�, �޿����, �μ���ġ�� ��ȸ�ϼ���.
    ��, ȸ�� ��ձ޿����� ���� ����鸸 ��ȸ�ϼ���.
*/


/*
    ������� ����� �޿��� 3000 �̻��� �������
        ����̸�, ����ȣ, ����̸�, ���޿��� ��ȸ�ϼ���.
    ��, ��簡 ���� ������ ����� ������ '������'���� ǥ���ϼ���.
*/

---------------------------------------------------------------------
-- student ���̺��� '������' �л��� 
--  �й�, �̸�, �г�, �������ɰ����̸� �� ��ȸ�ϼ���.

--------------------------------------------------------------------------------
/*
    ANSI JOIN
*/

SELECT
    *
FROM
    emp e INNER JOIN dept d
ON
    e.deptno = d.deptno
;

SELECT
    ename, sal, e.deptno, dname, grade
FROM
    emp e 
JOIN dept d
ON e.deptno = d.deptno
JOIN salgrade
ON sal BETWEEN losal AND hisal
;

SELECT
    e.ename ����̸�, e.mgr ����ȣ, NVL(s.ename, '���� �뻧!') ����̸�
FROM
    emp e LEFT OUTER JOIN emp s
ON
    e.mgr = s.empno
;


SELECT
    ename ����̸�, deptno �μ���ȣ, dname �μ��̸�
FROM
    emp e NATURAL JOIN dept d
;


SELECT
    ename ����̸�, deptno �μ���ȣ, dname �μ��̸�
FROM
    emp JOIN dept USING(deptno)
;

/*
    SUB QUERY(������, ��������)
        ���Ǹ�ɾȿ� �Ϻ��� ��ȸ���Ǹ���� ���ԵǴ� ���
        ���ԵǴ� �� ���Ǹ���� �������Ƕ� �Ѵ�.
        
        ��ȸ�Ǵ� ����� ����
            ������ ��������
                ��ȸ�Ǵ� ����� �������� ��ȸ�Ǵ� ���
            ������ ��������
                ����� ���������� ��ȸ�Ǵ� ���
                
                ������ �����÷����� ��ȸ�Ǵ� ���
                ���������ڸ� ����ؼ� ó���� �� �ִ�.
                    
                    IN
                    ----------------------
                    ANY | SOME
                    ALL
                    ----------------------
                    EXISTS
*/


-- 40�� �μ� �Ҽ� ����� ���� ��� ��� ������� ����̸��� ��ȸ�ϼ���.
SELECT
    ename ����̸�
FROM
    emp
WHERE
    NOT EXISTS (
                SELECT
                    empno
                FROM
                    emp
                WHERE
                    deptno = 40
            )
;

-- ������ 'SALESMAN' �� ������� �μ��̸��� ��ȸ�ϼ���.
SELECT
    dname
FROM
    dept
WHERE
    deptno IN (
                    SELECT
                        deptno
                    FROM
                        emp
                    WHERE
                        job = 'SALESMAN'
                )
;

SELECT
    dname
FROM
    dept
WHERE
    deptno = ANY (
                    SELECT
                        deptno
                    FROM
                        emp
                    WHERE
                        job = 'SALESMAN'
                )
;

SELECT
    empno, ename, sal
FROM
    emp
WHERE
    sal < ALL (
                SELECT
                    sal
                FROM
                    emp
                WHERE
                    deptno = 30
            )
;

--------------------------------------------------------------------------------

/*
    DML : �޸� �󿡼��� �۾��� �Ѵ�.
            ���� �����ͺ��̽��� ������ ��ų���� ������ ����� �����ؾ� �Ѵ�.
            COMMIT
            ROLLBACK
            
        SELECT
        ----------------------------------------------
        INSERT
        UPDATE
        DELETE
            
    ----------------------------------------------------------------------------
    DDL
    DCL
*/

--------------------------------------------------------------------------------

-- ���̺� �����ϴ� ���
CREATE TABLE EMP1
AS
    SELECT
        *
    FROM
        emp
;

CREATE TABLE emp2
AS
    SELECT
        *
    FROM
        emp
    WHERE
        1 = 2
;

INSERT INTO
    EMP2
    SELECT
        *
    FROM
        emp
    WHERE
        ename = 'SMITH'
;


UPDATE
    emp2
SET
    (sal, comm) = (
                    SELECT
                        sal, comm
                    FROM
                        emp
                    WHERE
                        ename = 'MARTIN'
                )
;




