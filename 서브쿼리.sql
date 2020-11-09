-- 존스의 급여보다 높은 급여를 받는 사원들 출력하기

-- 존스의 급여 알아내기 
SELECT sal FROM emp WHERE ename='JONES';

-- 높은 급여 사원 출력하기
SELECT * FROM emp WHERE sal > 2975; 

-- 서브쿼리 : 쿼리문 안에 다른 쿼리문을 포함하고 있는 상태
-- 단일행 서브쿼리 : 서브쿼리의 결과가 하나임(JONES는 한 명 뿐임)
--                 >,<,=,<=,>=            같지 않음 :<>,^=,!=

SELECT * FROM emp WHERE sal > (SELECT sal FROM emp WHERE ename='JONES');

-- 사원이름이 ALLEN인 사원의 추가수당보다 많이 받는 사원을 출력
SELECT * FROM emp WHERE comm > (SELECT comm FROM emp WHERE ename='ALLEN');

-- 사원이름이 WARD인 사원의 입사일보다 빨리 입사한 사원을 출력
SELECT * FROM emp WHERE hiredate < (SELECT hiredate FROM emp WHERE ename='WARD');

-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원 출력
SELECT * FROM emp WHERE deptno = 20 AND sal > (SELECT AVG(sal) FROM emp);

-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원의 정보 출력
-- 부서명, 지역 위치 출력하도록 한다. 
SELECT e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc
FROM emp e, dept d 
WHERE e.deptno=d.deptno AND d.deptno = 20 AND sal > (SELECT AVG(sal) FROM emp);





-- 다중행 서브쿼리
-- 다중행 연산자 : IN,ANY,ALL,EXISTS

-- 서브쿼리 결과가 2개 이상 나오는 경우라면 단일행 서브쿼리의 연산자는 사용 불가
-- 단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.
SELECT * FROM emp WHERE sal >= (SELECT MAX(sal) FROM emp GROUP BY deptno); 

-- IN 
SELECT * FROM emp WHERE sal IN (SELECT MAX(sal) FROM emp GROUP BY deptno); 

-- ANY(SOME)
-- = ANY(SOME) : IN의 수행결과와 같게 나옴, 단 IN을 더 많이 사용한다
-- ANY는 서브쿼리에 굳이 단일행 작업을 하지 않아도 된다.
SELECT * FROM emp WHERE sal = ANY (SELECT MAX(sal) FROM emp GROUP BY deptno); 
SELECT * FROM emp WHERE sal = SOME (SELECT MAX(sal) FROM emp GROUP BY deptno); 

-- 30번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원을 출력
SELECT MAX(sal) FROM emp WHERE deptno=30;
SELECT * FROM emp WHERE sal < ANY (SELECT MAX(sal) FROM emp WHERE deptno=30); 
SELECT * FROM emp WHERE sal < ANY (SELECT sal FROM emp WHERE deptno=30); 

-- 30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원을 출력
SELECT * FROM emp WHERE sal > ANY (SELECT sal FROM emp WHERE deptno=30); 

-- ALL : 서브쿼리의 결과를 모두 만족하는 메인쿼리를 추출할 때 사용
-- 부서번호가 30번인 사원들의 최소 급여보다 더 적은 급여를 받는 사원 출력
SELECT * FROM emp WHERE sal < ALL (SELECT sal FROM emp WHERE deptno=30);

-- EXISTS : IN과 비슷한 개념. 단, IN보다 성능이 우수함
-- 서브쿼리 결과가 존재하면 메인쿼리 결과도 출력
-- 서브쿼리의 WHERE절이 메인절의 출력을 결정함
SELECT * FROM emp WHERE EXISTS (SELECT dname FROM dept WHERE deptno=20);
SELECT * FROM emp WHERE NOT EXISTS (SELECT dname FROM dept WHERE deptno=20);

SELECT empno, deptno
FROM emp 
WHERE EXISTS (SELECT deptno 
              FROM dept 
              WHERE deptno IN (20,30) AND emp.deptno=dept.deptno);


SELECT empno, deptno
FROM emp 
WHERE EXISTS (SELECT 1
              FROM dept 
              WHERE deptno IN (20,30) AND emp.deptno=dept.deptno);
              
SELECT empno, deptno
FROM emp 
WHERE NOT EXISTS (SELECT 1
              FROM dept 
              WHERE deptno IN (20,30) AND emp.deptno=dept.deptno); 
              
              
              
-- 다중 열 서브쿼리 : 서브쿼리의 SELECT 문에 비교할 컬럼이 여러개 나오는 방식
SELECT * FROM emp WHERE (deptno, sal) IN 
            (SELECT deptno, MAX(sal) FROM emp GROUP BY deptno);

-- FROM 절에 사용하는 서브쿼리(인라인 뷰)
SELECT e.empno, e.ename, d.deptno, d.dname, d.loc
FROM (SELECT * FROM emp WHERE deptno=10) e, (SELECT * FROM dept) d
WHERE e.deptno = d.deptno;

-- SELECT 절에 사용하는 서브쿼리 (스칼라 서브쿼리)










