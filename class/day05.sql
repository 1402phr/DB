/*
    ���������� Ư���� FROM �� ���� ���̴� �������Ǹ� 
        '�ζ��� ��' ��� �θ���.
        
    VIEW
        - ���������� �����ͺ��̽��� ������� ������ ������
            �����ؼ� ���̺�ó�� ����� �� �ִ� ��ü �� �ϳ�
            
        ==> ���� �並 ���鶧�� �������ǰ� ����.
            
            
            �ܼ��� - �並 ���鶧 �ϳ��� ���̺��� �̿��ؼ� ����� ���
                    - ��������
                    
            ���պ� - 2���̻�
                    - �����Ұ�
            
            
*/

CREATE VIEW emp_view1
AS
    SELECT
        EMPNO, ENAME, DEPTNO
    FROM
        EMP1
;

SELECT
    *
FROM
    emp_view
;

CREATE OR REPLACE VIEW emp_view
AS
    SELECT
        deptno dno, COUNT(*) cnt, MAX(sal) max, MIN(sal) min, SUM(sal) sum, AVG(sal) avg
    FROM
        emp1
    GROUP BY
        deptno
;

select
    *
from
    emp_view1
;

UPDATE
    emp_view1
SET
    deptno = 40
WHERE
    empno = 7369
;

SELECT * FROM emp1;

UPDATE
    emp_view
SET
    avg = 10000
WHERE
    dno = 10
;

-------------------------------------------------------------------------------
/*
    ��������
    - �ԷµǴ� �����Ͱ� Ʋ�������Ͱ� �Էµ��� ���ϵ��� ���� ����ϴ� ��
    - �����ͺ��̽��� �̻������� ���ϸ������� ����Ѵ�.
    
    ���� ]
        �⺻Ű�������� : PRIMARY KEY
                            UNIQUE + NOT NULL
        ����Ű�������� : �ٸ����� �����Ϳ� �ߺ��ؼ� �Է��� �� ���� ��������
        NOT NULL �������� : �ԷµǴ� �����Ͱ� �ݵ�� �־���ϴ� ��������
        CHECK �������� : �ԷµǴ� �����Ͱ� ���ǵ� �������� �ϳ����߸� �ϴ� ��������
        
        ���� ]
            DEFAULT : �����͸� �Է��� �� ������ �ش��÷��� �������� �ʴ� ��� 
                        �⺻������ ä���ִ� �÷� �Ӽ�...
                        
        ���� ]
            
    
*/


--------------------------------------------------------------------------------
/*
    �����ͺ��̽� �𵨸�
        1. �䱸���׺м����� ����� ���鸸 �����س���.
        
        2. ER Model�� �����.(����ȭ - ��1 ����ȭ, ��2 ����ȭ, ��3 ����ȭ)
        
        3. ER Diagram �ۼ�
        
        4. ���̺� ����
        
        
    
*/


/*
    �䱸���� �м�
        
        �䱸���� :
        
            ����� �����ȣ�� ������.
            ����� �Ի��� ���� �Ի��� 0�� 0�� 0�ʸ� �Ի�ð����� �Ѵ�.
            ��� ������
                ����� �̸�, ����, ���, �Ի���, �޿�, Ŀ�̼�, �ҼӺμ��� �Է��Ѵ�.
            
            �μ������� 
                10�� �μ��� �μ��̸��� .... �̰� �μ���ġ�� �������� �̴�.
                20�� �μ��� ....
                30�� �μ��� ....
                40�� �μ��� ....
            
            ����� ���� �ϳ��� �μ��� �ݵ�� �ҼӵǾ�� �Ѵ�.
            
            ����� ������ ����, ����, ����, �븮, ����, ���� �� ����Ѵ�.
            
            �޿������
                
                �ּұ޿� 700 �̻� �ִ�޿� 1200 �� 1���
                .....
                        3001 �̻� 9999 ���ϴ�        5����̴�.
                        
            ���ʽ� ������ 
                ���޴���� �̸�, ����, �޿�, Ŀ�̼� �� ����ϱ�� �Ѵ�.
                
                
        
*/

/*
    �����ͺ��̽� ����
        1. ������ ����
        2. ���� ����
        3. ������ ����
*/


--------------------------------------------------------------------------------
-- create sal_grade table
CREATE TABLE sal_grade(
    grade NUMBER(2) 
        CONSTRAINT SALGRD_GRD_PK PRIMARY KEY,
    losal NUMBER(10),
    hisal NUMBER(10),
    CONSTRAINT SALGRD_LO_UK UNIQUE(losal)
);

-- losal not null 
ALTER TABLE sal_grade
MODIFY 
    losal CONSTRAINT SALGRD_LO_NN NOT NULL
;

-- hisal UNIQUE �������� �߰�
ALTER TABLE sal_grade
ADD
    CONSTRAINT SALGRD_HI_UK UNIQUE(hisal)
;


-- create k_dept table
CREATE TABLE k_dept(
    deptno NUMBER(2)
        CONSTRAINT KDEPT_NO_PK PRIMARY KEY,
    dname VARCHAR2(10 CHAR)
        CONSTRAINT KDEPT_NAME_NN NOT NULL,
    loc VARCHAR2(10 CHAR)
        CONSTRAINT KDEPT_LOC_NN NOT NULL
)
;

-- CREATE K_EMP TABLE
CREATE TABLE k_emp(
    empno NUMBER(4)
        CONSTRAINT KEMP_NO_PK PRIMARY KEY,
    ename VARCHAR2(10 CHAR)
        CONSTRAINT KEMP_NAME_NN NOT NULL,
    job VARCHAR2(10 CHAR)
        CONSTRAINT KEMP_JOB_NN NOT NULL
        CONSTRAINT KEMP_JOB_CK 
            CHECK(job IN('����', '����', '����', 
                        '�븮', '����', '����')
                ),
    mgr NUMBER(4)
        CONSTRAINT KEMP_MGR_FK REFERENCES k_emp(empno),
    hiredate DATE DEFAULT SYSDATE
        CONSTRAINT KEMP_HDATE_NN NOT NULL,
    sal NUMBER(10)
        CONSTRAINT KEMP_SAL_NN NOT NULL,
    comm NUMBER(10),
    deptno NUMBER(2)
--        CONSTRAINT KEMP_DNO_FK REFERENCES k_dept(deptno)
        CONSTRAINT KEMP_DNO_NN NOT NULL,
    CONSTRAINT KEMP_DNO_FK FOREIGN KEY(deptno) REFERENCES k_dept(deptno)
)
;

INSERT INTO
    k_dept
    SELECT
        *
    FROM
        dept
;

INSERT INTO
    sal_grade
VALUES(
    (SELECT NVL(MAX(grade) + 1, 1) FROM sal_grade),
    2000000, 3000000
);

INSERT INTO
    sal_grade
VALUES(
    (SELECT NVL(MAX(grade) + 1, 1) FROM sal_grade),
    3000001, 5000000
);

INSERT INTO
    sal_grade
VALUES(
    (SELECT NVL(MAX(grade) + 1, 1) FROM sal_grade),
    5000001, 7000000
);

INSERT INTO
    sal_grade
VALUES(
    (SELECT NVL(MAX(grade) + 1, 1) FROM sal_grade),
    7000001, 10000000
);


INSERT INTO
    sal_grade(grade, losal)
VALUES(
    (SELECT NVL(MAX(grade) + 1, 1) FROM sal_grade),
    10000001
);


-- ��� ���� �Է�
INSERT INTO
    k_emp(empno, ename, job, hiredate, sal, comm, deptno)
VALUES(
    1001, '������', '����', TRUNC(sysdate,'dd'), 2000001, 1, 10
)
;


/*
    Mission
        �Խ��� ���̺��� �����ϼ���.
        �䱸���� : �Խ������̺� + ȸ�����̺� [ + �߰����̺� ]
        
        ���� ]
            
            1. �䱸���� �����
                ==> �䱸���� �м�( Entity, Attribute ���� )
            2. ER Model Diagram
            3. ER Diagram
            4. ���̺� ����
            5. DDL ���  (���̺� ����)
            6. DML ��� (������ �߰�)
*/






