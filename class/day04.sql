
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





