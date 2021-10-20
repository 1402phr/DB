-- �ߺ� ��� �ϳ��� ǥ���ϱ�
-- ������� �μ���ȣ�� ��ȸ�ϼ���. �� �� �μ����� �ѹ��� ��µǰ� �ϼ���.
select
    DISTINCT deptno, ename
from
    emp
ORDER BY
    deptno
;


/*
    quiz ]
        �޿��� 800, 950 �ƴ� ������� 
        ����̸�, �޿��� ��ȸ�ϼ���.
        ���߰� �񱳿����ڸ� ����ϼ���.
*/

SELECT
    ename ����̸�, sal �޿�
FROM
    emp
WHERE
--    sal != 800
--    AND sal <> 950
--    NOT sal IN (800, 950)
    sal NOT IN (800, 950)
;

/*
    NULL ������ ó���Լ�
        NVL(�÷��̸�, ��ü��)
        NVL2(�÷��̸�, �����, ��ü��)
*/

/*
    ���� ]
        ���տ�����
            ==> �Ϻ��� �ΰ� �̻��� SELECT ���� ����� �̿��ؼ�
                �� ����� �ٽ� ������ ���
                
            ���� ]
                SELECT
                    ....
                UNION : �ߺ���� �ѹ��� ǥ�� ( | UNION ALL : �ߺ���� ǥ�� | INTERSECT | MINUS )
                SELECT
                    .....
*/
insert into 
    emp(empno, ename, job, mgr, sal, deptno)
VALUES(8000, 'CLERK', 'CLERK', 2450, 2450, 10)
;


SELECT
    ename ����̸�, sal �޿�
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    job, mgr
FROM
    emp
WHERE
    deptno = 10
;



/*
    ex 1]
        Ŀ�̼��� ���� ������� 
            ����̸�, ����, �Ի����� ��ȸ�ϼ���
*/
SELECT
    ename ����̸�, job ����, hiredate �Ի���
FROM
    emp
WHERE
    comm IS NULL
;
/*
    ������� ����̸�, ����, �Ի����� ��ȸ�ϴµ�
    �޿��� ���� ����� ���� ��µǵ����ϰ� �޿��� ������
    �̸����� �������� �����ؼ� ����ϼ���..
*/
SELECT
    ename ����̸�, job ����, hiredate �Ի���, sal �޿�
FROM
    emp
ORDER BY
    sal DESC, ename ASC
;

/*
    20�� �μ��� ����� �� 
    �޿��� 3000 �Ǵ� 800�� �������
    ����̸�, �μ���ȣ, �޿��� ��ȸ�ϼ���.
*/

SELECT
    ename ����̸�, deptno �μ���ȣ, sal �޿�
FROM
    emp
WHERE
    deptno = 20
    AND 
    (
        sal = 3000
        OR
        sal = 800
    )
    -- sal IN (3000, 800)
;

-- ���̺� �߰�
@C:\db\script\educationmanagement.sql
@C:\db\script\personmanagement.sql
@C:\db\script\salesmanagement.sql
@C:\db\script\videoshop.sql

SELECT
    empno, ename, sal * 1.15 �޿�
FROM
    emp
ORDER BY
    �޿�
;


select stu_no, stu_name, stu_dept, stu_weight-5 as target
from student
order by stu_dept, target;

select
    power(3, 2) "3�� 2����"
from
    dual
;

SELECT
    UPPER('aBcdEf gH') �빮��,
    LOWER('aBcdEf gH') �ҹ���,
    999
FROM 
    dual
;

-- ������� �̸��� ������ ��ȸ�ϴµ� '�̸� - ����'�� �������� ��ȸ�ϰ� ���ܾ��� ù���ڸ� �빮�ڷ�..
-- ���� ] '�̸� - ����' ��� �����ʹ� 3���� �����͸� �����ؼ� ������ �Ѵ�.
SELECT
    CONCAT(
        CONCAT(ename, ' - '), 
        job
    ) ���
FROM
    emp
;

SELECT
    SUBSTR('abcd efg hij', 5, 5) "�߶� ���ڿ�"
FROM
    dual
;

SELECT
    ename, LENGTH(ename) �̸����ڼ�
FROM
    emp
;

SELECT
    INSTR('abcd ab ab', 'a', 2, 2) a��ġ
    -- INSTR(���ڵ�����, ã������[, �˻�������ġ, �󵵼�])
FROM
    dual
;

-- ������� �̸��� ��ȸ�ؼ� 10���ڷ� ǥ���ϴµ� ���� ������ '*'�� ǥ���ϼ���.
SELECT
    LPAD(ename, 10, '*') ����, RPAD(ename, 10, '#') ������
    -- LPAD(������, ����, ä�﹮��)
FROM
    emp
;

SELECT
    SYSDATE ����ð�
FROM
    DUAL
;

SELECT
    SYSDATE - 10  -- ����.�ð�
FROM
    dual
;

-- �泲���б� �������� ����� �������� ��ȸ�ϼ���.
SELECT
    FLOOR(MONTHS_BETWEEN(SYSDATE, TO_DATE('1952/05/25', 'YYYY/MM/DD'))) �������İ�����
FROM
    dual
;

SELECT
    NEXT_DAY('2021/10/19', 2) ���ֿ�����
FROM
    dual
;

-- ���ÿ��� 3���� ���� ��¥
SELECT ADD_MONTHS(SYSDATE, 3) FROM dual;

-- ���� 2���� ������ �� ��ȸ
SELECT LAST_DAY('2022/02/01') FROM dual;

SELECT ROUND(SYSDATE, 'HH') �ݿø�, TRUNC(SYSDATE, 'HH') ���� FROM DUAL;

/*
    ��¥ ������ ǥ������
        ���й����� /, -, , ���� ����Ŭ�� �ڵ����� �ν��ؼ� ����ȯ���ش�.
        
        �⵵ - YYYY
        �� - MM
        �� - DD
        �� - HH | HH24
        �� - MI
        �� - SS
*/

-- ����ȯ�Լ�
-- ������� �Ի����� '0000�� 00�� 00��' �� �������� ��ȸ�ϼ���.
SELECT
    ename, TO_CHAR(hiredate, 'YYYY') || '�� ' || TO_CHAR(hiredate, 'MM') || '�� '  
    || TO_CHAR(hiredate, 'dd') || '��' �Ի���
FROM
    emp
;

-- �޿��� 15% �λ��ؼ� �Ҽ� ��°�ڸ����� ��ȸ�ϼ���. �� ] 123.10

/*
    ���ڸ� ���ڷ� ǥ���Ҷ� ���Ǵ� ����
        0   - ��ȿ���ڴ� ǥ��
        9   - ��ȿ���ڵ� ǥ������ �ʴ´�.
        ,
        .
*/
SELECT
    ename ����̸�, sal ���޿�, 
    TO_CHAR(sal * 1.15, '99,999,999.99') �λ�޿�1,
    TO_CHAR(sal * 1.15, '00,000,000.00') �λ�޿�2
FROM
    emp
;


SELECT
    NVL(NULLIF('A', 'a'), 'B')
FROM
    DUAL
;

/*
    DECODE
        ���� ó���Լ�
        ���� ]
            DECODE(�÷��̸�, ������1, ���๮1,
                            ������2, ���๮2,
                            ������3, ���๮3,
                            ....
                            ������N, ���๮N
                    ���๮)
*/


/*
    ������ 'SALESMAN' �̸� �޿��� 10%
            'CLERK'�̸� �޿��� 15%
            'MANAGER'�� �޿��� 1%
            �λ��ϰ� �̿��� ���� ���� �޿��� ��ȸ�ϼ���.
*/

SELECT
    ename ����̸�, job ����, sal ���޿�,
    DECODE(job, 'SALESMAN', sal * 1.1,
                'CLERK', sal * 1.15,
                'MANAGER', sal * 1.01,
            sal
    ) �����ı޿�
FROM
    emp
;

SELECT
    ename ����̸�, job ����, sal ���޿�,
    CASE WHEN job = 'SALESMAN' THEN sal * 1.1
         WHEN job = 'CLERK' THEN sal * 1.15
         WHEN job = 'MANAGER' THEN sal * 1.01
        ELSE sal
    END �����ı޿�1,
    CASE job WHEN'SALESMAN' THEN sal * 1.1
         WHEN 'CLERK' THEN sal * 1.15
         WHEN 'MANAGER' THEN sal * 1.01
        ELSE sal
    END �����ı޿�2
FROM
    emp
;

SELECT
    ename �̸�, 
    CASE when ename > 'S' THEN CONCAT('Mr.',ename) 
        ELSE '--- ' || ename || ' ---'
    END �������̸�
FROM
    emp
;

-- �޿��� 10% �λ��� 1200 ���� ���� ����� ��ȸ
SELECT
    ENAME, SAL* 1.1
FROM
    EMP
WHERE
--  SAL * 1.1 < 1200
    TO_CHAR(sal) LIKE '1%'
;

SELECT
    *
FROM
    EMP
WHERE
    1 = 2
;


--------------------------------------------------------------------------------
/*
    EX 1]
        ����� �̸��� 'M' ������ ���ڷ� �����ϴ� �������
            �̸�, ����, �޿��� ��ȸ�ϼ���.
        ���� - M���� �����ϴ� ��� ���� ����
*/
SELECT
    ename ����̸�, job ����, sal �޿�
FROM
    emp
WHERE
--    SUBSTR(ename, 1, 1) < 'M'
    ename < 'M'
;
/*
    EX 2]
        �Ի����� 1981�� 9�� 8�� �� �����
            �̸�, ����, �Ի����� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, TO_CHAR(hiredate, 'YYYY-MM-DD') �Ի���
FROM
    emp
WHERE
    TO_CHAR(hiredate, 'YYYY/MM/DD') = '1981/09/08'
;
/*
    EX 3]
        ������� �̸��� 'M'������ ���ڷ� �����ϴ� ����� ��
        �޿��� 1000 �̻��� �������
            ����̸�, ����, �޿�
        �� ��ȸ�ϼ���. 
*/
SELECT
    ename ����̸�, job ����, sal �޿�
FROM
    emp
WHERE
    ename >= 'M'
    AND sal >= 1000
;
/*
    EX 4]
        ������ 'MANAGER'�� �ƴ� �������
            ����̸�, ����, �Ի����� ��ȸ�ϼ���.
        �����ڷ� ó���ϼ���.
*/
SELECT
    ename ����̸�, job ����, hiredate �Ի���
FROM
    emp
WHERE
--    NOT job = 'MANAGER'
--    job NOT IN ('MANAGER')
    -- job <> 'MANAGER'
    -- job != 'MANAGER'
    -- job ^= 'MANAGER'
    job IN (
        SELECT
            DISTINCT job
        FROM
            emp
        WHERE
            job <> 'MANAGER'
    )
;
/*
    EX 5]
        ����� �̸��� 'C' ������ ���ڷ� �����ϰ� 'M' ������ ���ڷ� �����ϴ� �������
        ����̸�, ����, �Ի����� ��ȸ�ϼ���.
        
        BETWEEN ������ ���
*/
SELECT
    ename ����̸�, job ����, hiredate �Ի���
FROM
    emp
WHERE
    ename BETWEEN 'C' AND 'Mz'
;

/*
    EX 6]
        ����� �̸��� 'S' �� �����ϰ�
        �̸��� ���ڼ��� 5������ �������
            ����̸�, ����
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����
FROM
    emp
WHERE
--    ename BETWEEN 'S' AND 'T' AND LENGTH(ename) = 5
    SUBSTR(ename, 1, 1) = 'S' AND LENGTH(ename) = 5
--    ename LIKE 'S____'
;
/*
    EX 7]
        �Ի����� 3���� �������
            ����̸�, �Ի����� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, hiredate �Ի���
FROM
    emp
WHERE
    TO_CHAR(hiredate, 'DD') = '03'
;
/*
    EX 8]
        ����̸��� ���ڼ��� 4 �Ǵ� 5 ������ �������
        ����̸�, �Ի����� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, hiredate �Ի���
FROM
    emp
WHERE
    LENGTH(ename) IN (4, 5)
;
/*
    EX 9]
        �Ի�⵵�� 81�� 82���� ������� 
        ����̸�, �Ի���, �޿��� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, hiredate �Ի���, sal �޿�
FROM
    emp
WHERE
    TO_CHAR(hiredate, 'yy') IN ('81', '82')
;
/*
    EX 10]
        �̸��� 'S'�� ������ �������
            �̸�, �޿�, Ŀ�̼�
        �� ��ȸ�ϼ���.
        ��, Ŀ�̼��� 100�� ���ϰ� ���� ����� 100 �� �����ϼ���.
*/
SELECT
    ename ����̸�, sal �޿�, NVL(comm + 100, 100) Ŀ�̼�, COMM
FROM
    emp
WHERE
    SUBSTR(ename, -1, 1) = 'S'
;
/*
    BONUS 1]
        ������� �̸��� ��ȸ�ϴµ�
        ����� �ι�° ���ڸ� �����ְ� 
        ������ ���ڴ� '*' ��µǰ� ��ȸ�ϼ���.
        
        �� ]
            ����̸� | ����̸�
            SMITH   | *M***
            KING    | *I**
*/
SELECT 
    RPAD(
        LPAD(
            SUBSTR(ENAME, 2, 1), 
            2, 
            '*'
        ), 
        LENGTH(ENAME), 
        '*'
    ) AS "����̸�"
FROM EMP;

SELECT
    RPAD(
        CONCAT('*', SUBSTR(ename, 2, 1)), 
        LENGTH(ename),
        '*'
    )
FROM
    emp
;

SELECT
    '*' || SUBSTR(ename, 2, 1) || RPAD('*', LENGTH(ename) - 2, '*')
FROM
    emp
;
/*
    BONUS 2]
        �Էµ� �̸����� �����ַ��� �Ѵ�.
        ������������ ���������� �ϼ���.
        
        �Է¸���            |   ��¸���
        abcde@naver.com    |    *****@*****.com
        efgh@danawa.co.kr  |    ****@******.co.kr
        
        
        abcde@naver.com    |    a****@*a***.com
*/
-- 2-1
SELECT
    'abcde@naver.com' mail,
    INSTR('abcde@naver.com', '@') - 1 ����,
    LPAD('*', INSTR('abcde@naver.com', '@') - 1, '*') || '@' ||
    RPAD('*', INSTR('abcde@naver.com', '.') - 1 - INSTR('abcde@naver.com', '@'), '*') ||
    SUBSTR('abcde@naver.com', INSTR('abcde@naver.com', '.')) ��ȯ����
FROM
    dual
;

SELECT
    'abcde@naver.com' ����,
    CONCAT(
        RPAD(
            CONCAT(
                CONCAT(
                    RPAD(
                        SUBSTR('abcde@naver.com', 1, 1), 
                        INSTR('abcde@naver.com','@') - 1, 
                        '*'
                    ),
                    '@'
                ),
                LPAD( SUBSTR('abcde@naver.com', INSTR('abcde@naver.com', '@') + 2, 1), 2, '*')
            ),
            INSTR('abcde@naver.com', '.') - 1,
            '*'
        ),
        SUBSTR('abcde@naver.com', INSTR('abcde@naver.com', '.'))
    ) ��ȯ����
FROM
    DUAL
;

/*
    DECODE() �Ǵ� CASE �������� �ذ��ϼ���.
    
    ���� 1]
        ������� 
            ����̸�, ����, �μ��̸�
        �� ��ȸ�ϼ���.
            10�� �μ��� ������
            20�� �μ��� ���ߺ�
            30�� �μ��� �ѹ���
            ���ܴ̿� ���
        �� ǥ���ϼ���.
*/
SELECT
    ename ����̸�, job ����, deptno �μ���ȣ,
    DECODE(deptno, 10, '������',
                    20, '���ߺ�',
                    30, '�ѹ���',
                    '���'
    ) �μ��̸�
FROM
    emp
ORDER BY
    deptno
;

SELECT
    ename ����̸�, job ����, deptno �μ���ȣ,
    CASE deptno WHEN 10 THEN '������'
                WHEN 20 THEN '���ߺ�'
                WHEN 30 THEN '�ѹ���'
                ELSE '���'
    END �μ��̸�
FROM
    emp
ORDER BY
    deptno
;

SELECT
    ename ����̸�, job ����, deptno �μ���ȣ,
    CASE WHEN 10 = 10 THEN '������'
                WHEN deptno = 20 THEN '���ߺ�'
                WHEN deptno = 30 THEN '�ѹ���'
                ELSE '���'
    END �μ��̸�
FROM
    emp
ORDER BY
    deptno
;

/*
    ���� 2]
        ������� 
            ����̸�, �޿�, Ŀ�̼��� ��ȸ�ϼ���.
            ��, Ŀ�̼��� ���� ����� 'Ŀ�̼� ����' ���� ǥ���ϼ���.
*/
SELECT
    ename, sal, 
    DECODE(comm, NULL, 'Ŀ�̼� ����',
                COMM
                --TO_CHAR(comm)
    ) Ŀ�̼�
FROM
    emp
;

