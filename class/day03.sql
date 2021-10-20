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