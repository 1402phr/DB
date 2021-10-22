/*
    서브질의중 특별히 FROM 절 내에 놓이는 서브질의를 
        '인라인 뷰' 라고 부른다.
        
    VIEW
        - 물리적으로 데이터베이스에 만들어져 있지는 않지만
            접근해서 테이블처럼 사용할 수 있는 개체 중 하나
            
        ==> 따라서 뷰를 만들때는 서브질의가 들어간다.
            
            
            단순뷰 - 뷰를 만들때 하나의 테이블을 이용해서 만드는 경우
                    - 수정가능
                    
            복합뷰 - 2개이상
                    - 수정불가
            
            
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
    제약조건
    - 입력되는 데이터가 틀린데이터가 입력되지 못하도록 막는 기능하는 것
    - 데이터베이스의 이상현상을 줄일목적으로 사용한다.
    
    종류 ]
        기본키제약조건 : PRIMARY KEY
                            UNIQUE + NOT NULL
        유일키제약조건 : 다른행의 데이터와 중복해서 입력할 수 없는 제약조건
        NOT NULL 제약조건 : 입력되는 데이터가 반드시 있어야하는 제약조건
        CHECK 제약조건 : 입력되는 데이터가 정의된 도메인중 하나여야만 하는 제약조건
        
        참고 ]
            DEFAULT : 데이터를 입력할 때 별도로 해당컬럼을 지정하지 않는 경우 
                        기본값으로 채워주는 컬럼 속성...
                        
        형식 ]
            
    
*/


--------------------------------------------------------------------------------
/*
    데이터베이스 모델링
        1. 요구사항분석에서 기술된 명사들만 도출해낸다.
        
        2. ER Model을 만든다.(정규화 - 제1 정규화, 제2 정규화, 제3 정규화)
        
        3. ER Diagram 작성
        
        4. 테이블 명세서
        
        
    
*/


/*
    요구사항 분석
        
        요구사항 :
        
            사원은 사원번호를 가진다.
            사원이 입사할 때는 입사일 0시 0분 0초를 입사시간으로 한다.
            사원 정보는
                사원의 이름, 직급, 상사, 입사일, 급여, 커미션, 소속부서를 입력한다.
            
            부서정보는 
                10번 부서는 부서이름이 .... 이고 부서위치는 ㅇㅇㅇㅇ 이다.
                20번 부서는 ....
                30번 부서는 ....
                40번 부서는 ....
            
            사원은 오직 하나의 부서에 반드시 소속되어야 한다.
            
            사원의 직급은 사장, 부장, 과장, 대리, 주임, 평사원 을 사용한다.
            
            급여등급은
                
                최소급여 700 이상 최대급여 1200 은 1등급
                .....
                        3001 이상 9999 이하는        5등급이다.
                        
            보너스 지급은 
                지급대상의 이름, 직급, 급여, 커미션 을 기록하기로 한다.
                
                
        
*/

/*
    데이터베이스 설계
        1. 개념적 설계
        2. 논리적 설계
        3. 물리적 설계
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

-- hisal UNIQUE 제약조건 추가
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
            CHECK(job IN('사장', '부장', '과장', 
                        '대리', '주임', '평사원')
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


-- 사원 정보 입력
INSERT INTO
    k_emp(empno, ename, job, hiredate, sal, comm, deptno)
VALUES(
    1001, '전은석', '사장', TRUNC(sysdate,'dd'), 2000001, 1, 10
)
;


/*
    Mission
        게시판 테이블을 설계하세요.
        요구사항 : 게시판테이블 + 회원테이블 [ + 추가테이블 ]
        
        순서 ]
            
            1. 요구사항 기술서
                ==> 요구사항 분석( Entity, Attribute 추출 )
            2. ER Model Diagram
            3. ER Diagram
            4. 테이블 명세서
            5. DDL 명령  (테이블 생성)
            6. DML 명령 (데이터 추가)
*/






