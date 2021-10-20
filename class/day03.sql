-- 그룹 함수

SELECT
    count(comm) 사원수
    -- , CONCAT('Mr.', ename) 사원이름  -- 단일그룹이 아니기 때문에...
FROM
    emp
;

-- 10번 부서 사원들과 동일한 직급을 가진 사원들을 모두 조회하세요.(이름, 직급, 부서번호)
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
    사원들의 평균급여, 최대급여, 최소급여, 급여합계, 사원수
    를 조회하세요.
*/
SELECT
    ROUND(AVG(sal), 2) 평균급여, MAX(sal) 최대급여, MIN(sal) 최소급여, SUM(sal) 급여합계, COUNT(*) 사원수
FROM
    emp
;

-- 사원들의 이름, 급여, 회사평균급여 를 조회하세요.
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

-- 사원들의 사원이름, 급여, 회사평균급여, 최대급여, 최소급여 를 조회하세요.
SELECT
    ename, sal, avg 평균급여, max 최대급여, min 최소급여
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
    참고 ]
        함수이름B()
        의 형식으로 되어있는 함수는 바이트로 연산하는 함수이다.
*/


SELECT
    ENAME, LENGTHB(ename) 바이트수
FROM
    emp
;
SELECT LENGTHB('홍길동'), LENGTHB('호'), LENGTHB('홍') FROM dual;

-- 부서별 부서이름, 부서최대급여, 부서최소급여, 부서평균급여를 조회하세요.

-- 부서별 통계
SELECT
    deptno dno, MAX(sal) max, MIN(sal) min, ROUND(AVG(sal), 2) avg, COUNT(*) cnt 
FROM
    emp
GROUP BY
    deptno
;

SELECT
    dname, max 부서최대급여, min 부서최소급여, avg 부서평균급여, cnt 부서원수
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
    부서원이 제일 적은 부서에 속한 사원들의 
        사원이름, 직급, 부서번호, 급여
    를 조회하세요.
*/

/*
    부서 평균급여보다 적게 받는 사원들의
    사원번호, 사원이름, 부서번호, 급여, 부서평균급여
    를 조회하세요.
*/

/*
    각 부서별 최소급여자의
    사원이름, 부서번호, 급여, 부서최소급여를 조회하세요.
*/

/*
    사원중 최소급자가 속한 부서의 사원들의
    사원이름, 부서이름, 부서급여합계, 부서최대급여, 부서최소급여, 부서평균급여
    를 조회하세요.
*/

/*
    부서별 급여합계가 가장 높은 부서에 속한 사원들의
    사원이름, 급여, 부서번호를 조회하세요.
*/