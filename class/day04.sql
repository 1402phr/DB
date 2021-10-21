
-- 영문칼라테이블
CREATE TABLE color(
    cno NUMBER(3)
        CONSTRAINT CLR_NO_PK PRIMARY KEY,
    /*
        cno 라는 컬럼을 숫자타입으로 3자리까지 입력할수 있도록 하고
        제약조건은 기본키 제약조건을 주고 그 이름은 CLR_NO_PK 를 사용하겠습니다.
        
        제약조건은 데이터베이스 사전에 등록이 된다.
        따라서 동일한 이름은 존재하지 않는다.
        만약 제약조건이름을 기술하지 않으면 오라클이 자동으로 만들어서 부여한다.
    */
    cname VARCHAR2(50 CHAR)
        CONSTRAINT CLR_NAME_NN NOT NULL
        CONSTRAINT CLR_NAME_UK UNIQUE,
    ccode VARCHAR2(7 CHAR) DEFAULT '#000000'
        CONSTRAINT CLR_CODE_UK UNIQUE
);

-- 한글 칼라테이블
CREATE TABLE kcolor(
    kcno NUMBER(3)
        CONSTRAINT KCLR_NO_PK PRIMARY KEY,
    /*
        cno 라는 컬럼을 숫자타입으로 3자리까지 입력할수 있도록 하고
        제약조건은 기본키 제약조건을 주고 그 이름은 CLR_NO_PK 를 사용하겠습니다.
        
        제약조건은 데이터베이스 사전에 등록이 된다.
        따라서 동일한 이름은 존재하지 않는다.
        만약 제약조건이름을 기술하지 않으면 오라클이 자동으로 만들어서 부여한다.
    */
    kcname VARCHAR2(50 CHAR)
        CONSTRAINT KCLR_NAME_NN NOT NULL
        CONSTRAINT KCLR_NAME_UK UNIQUE,
    ccode VARCHAR2(7 CHAR) DEFAULT '#000000'
        CONSTRAINT KCLR_CODE_UK UNIQUE
);
/*
    테이블 만들기
    형식 ]
        CREATE TABLE 테이블이름(
            컬럼이름 데이터타입[(길이)] [ DEFAULT 데이터 ]
                [
                CONSTRAINT 제약조건이름 제약조건
                CONSTRAINT 제약조건이름 제약조건
                CONSTRAINT 제약조건이름 제약조건
                .....
                ],
            컬럼이름 데이터타입[(길이)] [ DEFAULT 데이터 ]
                [제약조건추가]
            ,
            ....
        );
        
    데이터 추가하기
        INSERT 명령
            
            형식 1]
                
                INSERT INTO
                    테이블이름
                VALUES(
                    데이터들 모두...
                );
                
            형식 2 ]
                
                INSERT INTO
                    테이블이름(컬럼이름1, 컬럼이름2, ... , 컬럼이름N)
                VALUES(
                    데이터1, 데이터2, ... , 데이터N
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
    '검정'
);

INSERT INTO
    kcolor
VALUES(
    (SELECT NVL(MAX(kcno) + 1, 1) FROM kcolor),
    '빨강', '#FF0000'
);

INSERT INTO
    kcolor
VALUES(
    (SELECT NVL(MAX(kcno) + 1, 1) FROM kcolor),
    '초록', '#00FF00'
);

INSERT INTO
    kcolor
VALUES(
    (SELECT NVL(MAX(kcno) + 1, 1) FROM kcolor),
    '파랑', '#0000FF'
);


-- 테이블을 설계할 때는 한행의 데이터만 선택할 수 있도록 조치를 해야하는데
-- 그 방법이 기본키를 주는 방법이다.


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
    JOIN : 두개이상의 테이블에서 원하는 데이터를 꺼내오는 명령
*/

SELECT * FROM  color;

SELECT * FROM color, kcolor;



-- 사원들의 사원이름, 상사번호, 상사이름을 조회하세요.
SELECT
    *--e.ename 사원이름, e.mgr 상사번호, s.ename 상사이름
FROM
    emp e, emp s
WHERE
    e.mgr = s.empno(+)
;

-- Non Equi Join
-- : 동등비교연산자로 사용하지않고 조인하는 방법

-- 사원들의 사원번호, 사원이름, 급여, 급여등급을 조회하세요.
SELECT
    empno 사원번호, ename 사원이름, sal 급여, grade 급여등급--, losal, hisal
FROM
    emp, salgrade
WHERE
    sal BETWEEN losal AND hisal
;

select * FROM EMP;

/*
    참고 ]
        조인조건과 일반조건은 같이 나열해도 무방하다.
*/

-- 사원들중 10번 부서사원들의 사원번호, 사원이름, 급여, 급여등급을 조회하세요.
SELECT
    empno 사원번호, ename 사원이름, deptno 부서번호, sal 급여, grade 급여등급
FROM
    emp, salgrade
WHERE
    sal BETWEEN losal AND hisal
    AND deptno = 10
;

/*
    직급이 'MANAGER' 인 사원들의
        사원이름, 직급, 입사일, 급여, 부서이름을 조회하세요.
*/

/*
    급여가 가장 낮은 사원의
        사원이름, 직급, 입사일, 급여, 부서이름, 부서위치를 조회하세요.
*/

/*
    사원이름이 5글자인 사원들의
        사원이름, 직급, 입사일, 급여, 급여등급
    를 조회하세요.
*/

/*
    입사년도가 81년이고 직급이 'MANAGER' 인 사원들의
        사원이름, 직급, 입사일, 급여, 급여등급, 부서이름, 부서위치를 조회하세요.
*/

/*
    사원들의
        사원이름, 직급, 급여, 상사이름, 급여등급을 조회하세요.
*/

/*
    사원들의
        사원이름, 직급, 급여, 상사이름, 급여등급, 부서위치를 조회하세요.
    단, 회사 평균급여보다 많은 사원들만 조회하세요.
*/


/*
    사원들중 상사의 급여가 3000 이상인 사원들의
        사원이름, 상사번호, 상사이름, 상사급여를 조회하세요.
    단, 상사가 없는 직원은 상사의 정보에 '상사없음'으로 표시하세요.
*/

---------------------------------------------------------------------
-- student 테이블에서 '진현무' 학생의 
--  학번, 이름, 학년, 수강가능과목이름 을 조회하세요.

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
    e.ename 사원이름, e.mgr 상사번호, NVL(s.ename, '내가 대빵!') 상사이름
FROM
    emp e LEFT OUTER JOIN emp s
ON
    e.mgr = s.empno
;


SELECT
    ename 사원이름, deptno 부서번호, dname 부서이름
FROM
    emp e NATURAL JOIN dept d
;


SELECT
    ename 사원이름, deptno 부서번호, dname 부서이름
FROM
    emp JOIN dept USING(deptno)
;

/*
    SUB QUERY(부질의, 서브질의)
        질의명령안에 완벽한 조회질의명령이 포함되는 경우
        포함되는 이 질의명령을 서브질의라 한다.
        
        조회되는 결과로 구분
            단일행 서브질의
                조회되는 결과가 한행으로 조회되는 경우
            다중행 서브질의
                결과가 여러행으로 조회되는 경우
                
                다중행 단일컬럼으로 조회되는 경우
                다음연산자를 사용해서 처리할 수 있다.
                    
                    IN
                    ----------------------
                    ANY | SOME
                    ALL
                    ----------------------
                    EXISTS
*/


-- 40번 부서 소속 사원이 없는 경우 모든 사원들의 사원이름을 조회하세요.
SELECT
    ename 사원이름
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

-- 직급이 'SALESMAN' 인 사원들의 부서이름을 조회하세요.
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
    DML : 메모리 상에서만 작업을 한다.
            따라서 데이터베이스에 적용을 시킬려면 별도의 명령을 실행해야 한다.
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

-- 테이블 복사하는 명령
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




