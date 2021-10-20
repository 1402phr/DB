-- �׷� �Լ�

SELECT
    count(comm) �����
    -- , CONCAT('Mr.', ename) ����̸�  -- ���ϱ׷��� �ƴϱ� ������...
FROM
    emp
;

-- 10�� �μ� ������ ������ ������ ���� ������� ��� ��ȸ�ϼ���.(�̸�, ����, �μ���ȣ)
SELECT
    ename, deptno, job
FROM
    emp
WHERE
    job IN (
        SELECT
            DISTINCT job
        FROM
            emp
        WHERE
            DEPTNO = 20
    )
;

/*
    ������� ��ձ޿�, �ִ�޿�, �ּұ޿�, �޿��հ�, �����
    �� ��ȸ�ϼ���.
*/
SELECT
    ROUND(AVG(sal), 2) ��ձ޿�, MAX(sal) �ִ�޿�, MIN(sal) �ּұ޿�, SUM(sal) �޿��հ�, COUNT(*) �����
FROM
    emp
;

-- ������� �̸�, �޿�, ȸ����ձ޿� �� ��ȸ�ϼ���.
SELECT
    ename, sal, 
    (
        SELECT
         ROUND(AVG(sal), 2), MAX(sal), MIN(sal)
        FROM
            emp
    )
FROM
    emp
;

SELECT
    ename, sal, a
FROM
    emp,
    (
        SELECT
            ROUND(AVG(sal), 2) a
        FROM
            emp
    )
;

-- ������� ����̸�, �޿�, ȸ����ձ޿�, �ִ�޿�, �ּұ޿� �� ��ȸ�ϼ���.
SELECT
    ename, sal, avg ��ձ޿�, max �ִ�޿�, min �ּұ޿�
FROM
    emp,
    (
        SELECT
            ROUND(AVG(sal), 2) avg, MAX(sal) max, MIN(sal) min
        FROM
            emp
    )
;
/*
    ���� ]
        �Լ��̸�B()
        �� �������� �Ǿ��ִ� �Լ��� ����Ʈ�� �����ϴ� �Լ��̴�.
*/


SELECT
    ENAME, LENGTHB(ename) ����Ʈ��
FROM
    emp
;
SELECT LENGTHB('ȫ�浿'), LENGTHB('ȣ'), LENGTHB('ȫ') FROM dual;

-- �μ��� �μ��̸�, �μ��ִ�޿�, �μ��ּұ޿�, �μ���ձ޿��� ��ȸ�ϼ���.

-- �μ��� ���
SELECT
    deptno dno, MAX(sal) max, MIN(sal) min, ROUND(AVG(sal), 2) avg, COUNT(*) cnt 
FROM
    emp
GROUP BY
    deptno
;

SELECT
    dname, max �μ��ִ�޿�, min �μ��ּұ޿�, avg �μ���ձ޿�, cnt �μ�����
FROM
    dept,
    (
        SELECT
            deptno dno, MAX(sal) max, MIN(sal) min, ROUND(AVG(sal), 2) avg, COUNT(*) cnt 
        FROM
            emp
        GROUP BY
            deptno
    )
WHERE
    deptno = dno
;

/*
    �μ����� ���� ���� �μ��� ���� ������� 
        ����̸�, ����, �μ���ȣ, �޿�
    �� ��ȸ�ϼ���.
*/

SELECT
    ename, job, deptno, sal
FROM
    emp
WHERE
    deptno = (
                select
                    dno
                from
                    (SELECT
                        deptno dno, count(*) cnt
                    FROM
                        emp
                    GROUP BY
                        deptno
                    )
                where
                    cnt = (
                        SELECT
                            min(cnt)
                        FROM
                            (
                                SELECT
                                    count(*) cnt
                                FROM
                                    emp
                                GROUP BY
                                    deptno
                            )
                    )
)
;

SELECT
    ename, job, deptno, sal
FROM
    emp
WHERE
    deptno = (
                    SELECT
                        deptno
                    FROM
                        emp
                    GROUP BY
                        deptno
                    HAVING
                        COUNT(*) = (
                                        SELECT
                                            min(cnt)
                                        FROM
                                            (
                                                SELECT
                                                    COUNT(*) cnt
                                                FROM
                                                    emp
                                                GROUP BY
                                                    deptno
                                            )
                                    )
                )
;

/*
    �μ� ��ձ޿����� ���� �޴� �������
    �����ȣ, ����̸�, �μ���ȣ, �޿�, �μ���ձ޿�
    �� ��ȸ�ϼ���.
*/
SELECT
    empno �����ȣ, ename ����̸�, deptno �μ���ȣ, sal �޿�, 
    (
        SELECT
            ROUND(AVG(sal), 2)
        FROM
            emp
        WHERE
            deptno = e.deptno
    ) �μ���ձ޿�
FROM
    emp e
WHERE
    sal < (
                SELECT
                    AVG(sal)
                FROM
                    emp
                WHERE
                    deptno = e.deptno
            )
;

SELECT
    empno �����ȣ, ename ����̸�, deptno �μ���ȣ, sal �޿�, ROUND(avg, 2) ��ձ޿�
FROM
    emp,
    (
    -- �μ���ȣ�� �μ��� ��ձ޿��� ����ϴ� ������ ���̺��� ������.
        SELECT
            deptno dno, AVG(sal) avg
        FROM
            emp
        GROUP BY
            deptno
    )
WHERE
    deptno = dno    -- ��������
    AND sal < avg
;
/*
    �� �μ��� �ּұ޿�����
    ����̸�, �μ���ȣ, �޿�, �μ��ּұ޿��� ��ȸ�ϼ���.
*/
SELECT
    ename, deptno, sal, min_sal
FROM
    emp,
    (
        SELECT
            deptno dno, MIN(sal) min_sal
        FROM
            emp
        GROUP BY
            deptno
    )
WHERE
    deptno = dno
    and sal = min_sal
;
/*
    ����� �ּұ޿��ڰ� ���� �μ��� �������
    ����̸�, �μ��̸�, �μ��޿��հ�, �μ��ִ�޿�, �μ��ּұ޿�, �μ���ձ޿�
    �� ��ȸ�ϼ���.
*/

/*
    ����� �ּұ޿��ڰ� ���� �μ��� ����� �� �μ� ��ձ޿����� �޿��� ���� ������� 
    ����̸�, �μ��̸�, �μ��޿��հ�, �μ��ִ�޿�, �μ��ּұ޿�, �μ���ձ޿�
    �� ��ȸ�ϼ���.
*/

/*
    �μ��� �޿��հ谡 ���� ���� �μ��� ���� �������
    ����̸�, �޿�, �μ���ȣ�� ��ȸ�ϼ���.
*/

--------------------------------------------------------------------------------
/*
    �� �μ����� ���� ���� �޿��� ������ ��ȸ�ϼ���.
        �μ���ȣ, �ּұ޿�
*/
SELECT
    deptno �μ���ȣ, MIN(sal) �μ��ּұ޿�
FROM
    emp
GROUP BY
    deptno
;
/*
    �μ��� Ŀ�̼� �޴� ������� ��ȸ�ϼ���.
*/
SELECT deptno, COUNT(comm) FROM emp GROUP BY deptno;
/*  
    �� ���޺��� �޿��հ�, ��ձ޿��� ��ȸ�ϼ���.
*/
SELECT deptno, SUM(sal), ROUND(AVG(sal), 2) AVG FROM emp GROUP BY deptno; 

/*
    �Ի�⵵���� ��ձ޿��� �޿��հ踦 ��ȸ�ϼ���.
*/
SELECT
    TO_CHAR(hiredate, 'YYYY') �Ի�⵵, AVG(sal) ��ձ޿�, SUM(sal) �޿��հ�
FROM
    emp
GROUP BY
    TO_CHAR(hiredate, 'YYYY')
ORDER BY
    TO_CHAR(hiredate, 'YYYY')
;
/*
    �� �⵵�� �Ի�� ���� ��ȸ�ϛ��. 
*/
SELECT
    TO_CHAR(hiredate, 'YYYY') �Ի�⵵, COUNT(*) �Ի����
FROM
    emp
GROUP BY
    TO_CHAR(hiredate, 'YYYY')
;
/*
    ����̸��� ���ڼ��� 4���� �Ǵ� 5������ ����� ���� ��ȸ�ϼ���.
*/
SELECT
    count(*)
FROM
    emp
WHERE
    LENGTH(ename) IN (4, 5)
;
/*
    1981�⵵�� �Ի��� ������� 
        ���޺� �����
*/
SELECT
    count(*)
FROM
    emp
GROUP BY
    TO_CHAR(hiredate, 'YYYY')
HAVING
    TO_CHAR(hiredate, 'YYYY') = '1981'
;
/*
    �̸����̰� 4 �Ǵ� 5 ������ ������� �μ����� ���� ��ȸ�ϼ���.
    ��, ������� �λ���� �μ��� �����ϰ� ��ȸ�ϼ���.
*/
SELECT
    deptno, COUNT(*)
FROM
    emp
WHERE
    LENGTH(ename) IN (4, 5)
GROUP BY
    deptno
HAVING
    COUNT(*) <> 1
;
/*
    81�⵵ �Ի��� ������� ���޺� �޿��հ踦 ��ȸ�ϼ���.
    ��, ���޺� ��ձ޿��� 1000 �̸��� ������ ��ȸ���� �����ϼ���.
*/
SELECT
    job ����, sum(sal) �޿��հ�
FROM
    emp
WHERE
    TO_CHAR(hiredate, 'YY') = '81'
GROUP BY
    job
HAVING
    NOT avg(sal) < 1000
;
/*
    81�⵵ �Ի��� ������� �̸����̺� �޿��հ踦 ��ȸ�ϼ���.
    ��, �հ谡 2000 �̸��� ���� �����ϰ�
    �հ谡 ���� ������ �������� �����ؼ� ��ȸ�ϼ���.
*/
SELECT
    LENGTH(ename) �̸�����, SUM(sal) �޿��հ�
FROM
    emp
WHERE
    TO_CHAR(hiredate, 'YY') = '81'
GROUP BY
    LENGTH(ename)
HAVING
    SUM(sal) >= 2000
;
----------------------------------------------------------------------------
/*
    ���ڿ� ó���Լ�
        1) REPLACE() - ���ڿ��� Ư�� �κ��� �ٸ� ���ڿ��� ��ü�ϴ� �Լ�
*/
SELECT REPLACE('HongD Gil Dong', 'D', 'TT') �̸� FROM dual;
/*
        ***
        2) TRIM()   ==> ���ڿ� �߿��� �� �Ǵ� �ڿ� �ִ� ������ ���ڸ� �������ִ� �Լ�
            A) LTRIM()
            B) RTRIM()
*/
select TRIM('         HONG    GIL DONG       ') FROM dual;
select LTRIM('@@@@@@@@@@@@HONG   @ GIL DONG@@@@@@@@@@@@@@@@', '@') FROM dual;
/*
        3) ASCII() - ���ڿ� �ش��ϴ� �ƽ�Ű�ڵ带 �˷��ش�.
*/
SELECT ASCII('A') A�ڵ�, ASCII('a') a�ڵ� FROM dual;
/*
        4) CHR() - �ƽ�Ű�ڵ尪�� ���ڷ� ��ȯ���ִ� �Լ�
*/
SELECT ASCII('a') a�ڵ�, CHR(97) a FROM dual;
/*
        5) TRANSLATE() - REPLACE�� ����� �Լ�
                        ������ ]
                            REPLACE()�� �ٲ� ���ڸ� ��ü�� �ٲٴµ�
                            �� �Լ��� ���ڴ����� ��ü�Ѵ�.
*/
SELECT
    TRANSLATE('ABCDABCDABCAD', 'ABCD', '1234') TR,
    REPLACE('ABCDABCDABCAD', 'ABCD', '1234') REPLC
FROM
    dual
;

