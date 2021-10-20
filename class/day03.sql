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

--------------------------------------------------------------------------------
/*
    각 부서별로 가장 적은 급여가 얼마인지 조회하세요.
        부서번호, 최소급여
*/

/*
    부서별 커미션 받는 사람수를 조회하세요.
*/

/*  
    각 직급별로 급여합계, 평균급여를 조회하세요.
*/


/*
    입사년도별로 평균급여와 급여합계를 조회하세요.
*/

/*
    각 년도별 입사원 수를 조회하세요.
*/

/*
    사원이름의 글자수가 4글자 또는 5글자인 사원의 수를 조회하세요.
*/

/*
    1981년도에 입사한 사원들을 
        직급, 사원수
*/

/*
    이름길이가 4 또는 5 글자인 사원들을 부서별로 수를 조회하세요.
    단, 사원수가 한사람인 부서는 제외하고 조회하세요.
*/

/*
    81년도 입사한 사람들의 직급별 급여합계를 조회하세요.
    단, 직급별 평균급여가 1000 미만인 직급은 조회에서 제외하세요.
*/

/*
    81년도 입사한 사원들의 이름길이별 급여합계를 조회하세요.
    단, 합계가 2000 미만인 경우는 제회하고
    합계가 높은 순서로 내림차순 정렬해서 조회하세요.
*/

----------------------------------------------------------------------------
/*
    문자열 처리함수
        1) REPLACE() - 문자열의 특정 부분을 다른 문자열로 대체하는 함수
*/
SELECT REPLACE('HongD Gil Dong', 'D', 'TT') 이름 FROM dual;
/*
        ***
        2) TRIM()   ==> 문자열 중에서 앞 또는 뒤에 있는 지정한 문자를 삭제해주는 함수
            A) LTRIM()
            B) RTRIM()
*/
select TRIM('         HONG    GIL DONG       ') FROM dual;
select LTRIM('@@@@@@@@@@@@HONG   @ GIL DONG@@@@@@@@@@@@@@@@', '@') FROM dual;
/*
        3) ASCII() - 문자에 해당하는 아스키코드를 알려준다.
*/
SELECT ASCII('A') A코드, ASCII('a') a코드 FROM dual;
/*
        4) CHR() - 아스키코드값을 문자로 반환해주는 함수
*/
SELECT ASCII('a') a코드, CHR(97) a FROM dual;
/*
        5) TRANSLATE() - REPLACE와 비슷한 함수
                        차이점 ]
                            REPLACE()는 바꿀 문자를 전체를 바꾸는데
                            이 함수는 문자단위로 대체한다.
*/
SELECT
    TRANSLATE('ABCDABCDABCAD', 'ABCD', '1234') TR,
    REPLACE('ABCDABCDABCAD', 'ABCD', '1234') REPLC
FROM
    dual
;
