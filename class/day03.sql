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

/*
    �� �μ��� �ּұ޿�����
    ����̸�, �μ���ȣ, �޿�, �μ��ּұ޿��� ��ȸ�ϼ���.
*/

/*
    ����� �ּұ��ڰ� ���� �μ��� �������
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

/*
    �μ��� Ŀ�̼� �޴� ������� ��ȸ�ϼ���.
*/

/*  
    �� ���޺��� �޿��հ�, ��ձ޿��� ��ȸ�ϼ���.
*/


/*
    �Ի�⵵���� ��ձ޿��� �޿��հ踦 ��ȸ�ϼ���.
*/

/*
    �� �⵵�� �Ի�� ���� ��ȸ�ϼ���.
*/

/*
    ����̸��� ���ڼ��� 4���� �Ǵ� 5������ ����� ���� ��ȸ�ϼ���.
*/

/*
    1981�⵵�� �Ի��� ������� 
        ����, �����
*/

/*
    �̸����̰� 4 �Ǵ� 5 ������ ������� �μ����� ���� ��ȸ�ϼ���.
    ��, ������� �ѻ���� �μ��� �����ϰ� ��ȸ�ϼ���.
*/

/*
    81�⵵ �Ի��� ������� ���޺� �޿��հ踦 ��ȸ�ϼ���.
    ��, ���޺� ��ձ޿��� 1000 �̸��� ������ ��ȸ���� �����ϼ���.
*/

/*
    81�⵵ �Ի��� ������� �̸����̺� �޿��հ踦 ��ȸ�ϼ���.
    ��, �հ谡 2000 �̸��� ���� ��ȸ�ϰ�
    �հ谡 ���� ������ �������� �����ؼ� ��ȸ�ϼ���.
*/

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
