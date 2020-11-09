-- SUM : 합계
SELECT SUM(sal), SUM(DISTINCT sal), SUM(ALL sal) FROM emp;

-- COUNT : 개수
SELECT COUNT(*) FROM emp;

--부서 번호가 30번인 직원 수 구하기
SELECT COUNT(*) FROM emp WHERE deptno=30;

SELECT COUNT(sal), COUNT(DISTINCT sal), COUNT(ALL sal) FROM emp;

-- MAX(최대값), MIN(최소값)
SELECT MAX(SAL), MIN(SAL) FROM emp;

-- 부서번호가 20인 사원의 입사일 중 가장 최근 입사일 구하기
SELECT MAX(hiredate) FROM emp WHERE deptno=20;

-- AVERAGE : 평균
SELECT ROUND(AVG(sal),-1) FROM emp;
SELECT ROUND(AVG(sal),-1) FROM emp WHERE deptno=30;
SELECT AVG(DISTINCT sal) FROM emp;


-- GROUP BY : 결과값을 원하는 열로 묶어 출력 
-- 부서별 월급의 평균
SELECT deptno,AVG(sal) FROM emp GROUP BY deptno;

-- 부서 번호별 추가수당 평균 구하기
SELECT deptno, AVG(comm) FROM emp GROUP BY deptno;

-- 부서번호, 직책별 급여의 평균
SELECT deptno,AVG(sal),job FROM emp GROUP BY deptno,job ORDER BY deptno,job;

-- GROUP BY 절에 포함 안되는 열을 SELECT에 포함해선 안된다(ename)
SELECT ename, deptno, AVG(sal)
FROM emp 
GROUP BY deptno;

-- HAVING : GROUP BY 절에 조건을 줄 때 사용
-- 각 부서의 직책별 평균 급여를 구하되 그 평균 급여가 2000이상인 그룹만 출력
SELECT deptno, job, AVG(sal)
FROM emp 
GROUP BY deptno, job
HAVING AVG(sal) >=2000
ORDER BY deptno, job;


-- 조인JOIN
-- 나올 수 있는 모든 조합 조회
SELECT * FROM emp, dept ORDER BY empno; --56행

SELECT * FROM dept; --4행
SELECT * FROM emp; -- 14행

-- 1) 내부조인(등가조인) 조건과 만족되는 행 조인
SELECT * 
FROM emp,dept
WHERE emp.deptno = dept.deptno --조인의 기준
ORDER BY empno;

SELECT * 
FROM emp e,dept d
WHERE e.deptno = d.deptno --조인의 기준
ORDER BY empno;

SELECT * 
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno --조인기준
ORDER BY empno;

-- 두 테이블에 같은 이름의 필드가 존재하는 경우
-- 어느 테이블에 있는 필드를 가지고 올 것인지 정확히 명시해야 함
SELECT empno, ename, job, d.deptno, dname
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno --조인기준
ORDER BY empno;


-- emp 테이블과 dept 테이블을 조인하여 empno, ename, sal, deptno, dname, loc를 조회.
-- 단, 급여가 3000 이상인 사원만 출력
SELECT e.empno, e.ename, e.sal, e.deptno, d.dname, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno AND sal>=3000;

-- emp 테이블의 별칭을 e로, dept 테이블 별칭을 d로 하여
-- 급여가 2500이하이고 사원번호가 9999 이하인 사원의 정보를 출력
SELECT e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, d.deptno,d.dname,d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno AND sal<=2500 AND empno<=9999;

SELECT *
FROM emp e, dept d
WHERE e.deptno = d.deptno AND sal<=2500 AND empno<=9999;


-- emp 테이블의 별칭을 e로, salgrade 테이블 별칭을 s로 하여
-- 각 사원의 정보와 더불어 사원의 등급 정보를 출력
SELECT *
FROM emp e, salgrade s
WHERE e.sal between s.losal AND s.hisal;

-- 2) 셀프조인(자체조인) : 조인 테이블이 자기 자신 테이블일 때
SELECT e1.empno, e1.ename, e1.mgr, e2.empno AS mgr_empno, e2.ename AS MGR_ENAME
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno;

-- OUTER JOIN(외부조인) : 조건을 만족하지 않는 데이터도 추출
-- mgr이 없는 king까지 출력됨
-- 1) LEFT OUTER JOIN
SELECT e1.empno, e1.ename, e1.mgr, e2.empno AS mgr_empno, e2.ename AS MGR_ENAME
FROM emp e1 LEFT OUTER JOIN emp e2
ON e1.mgr = e2.empno;

SELECT e1.empno, e1.ename, e1.mgr, e2.empno AS mgr_empno, e2.ename AS MGR_ENAME
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno(+);

-- 2) RIGHT OUTER JOIN
SELECT e1.empno, e1.ename, e1.mgr, e2.empno AS mgr_empno, e2.ename AS MGR_ENAME
FROM emp e1 RIGHT OUTER JOIN emp e2
ON e1.mgr = e2.empno;

SELECT e1.empno, e1.ename, e1.mgr, e2.empno AS mgr_empno, e2.ename AS MGR_ENAME
FROM emp e1, emp e2
WHERE e1.mgr(+) = e2.empno;




[실습 1]Oracle_05 슬라이드 11
SELECT e.deptno, d.dname, e.empno, e.ename, e.sal
FROM emp e, dept d
WHERE e.deptno = d.deptno AND e.sal>2000 ORDER BY e.deptno;

SELECT e.deptno, d.dname, e.empno, e.ename, e.sal
FROM emp e INNER JOIN dept d ON e.deptno = d.deptno 
WHERE e.sal>2000 ORDER BY e.deptno;

[실습 2]Oracle_05 슬라이드 11
SELECT e.deptno, d.dname, FLOOR(AVG(e.sal)), MAX(e.sal), MIN(e.sal), COUNT(dname)
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY e.DEPTNO, D.DNAME
ORDER BY e.deptno;

SELECT e.deptno, d.dname, FLOOR(AVG(e.sal)), MAX(e.sal), MIN(e.sal), COUNT(dname)
FROM emp e INNER JOIN dept d ON e.deptno = d.deptno
GROUP BY e.DEPTNO, D.DNAME
ORDER BY e.deptno;

[실습 3]Oracle_05 슬라이드 12
SELECT d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
FROM emp e, RIGHT OUTER JOIN dept d ON E.DEPTNO = D.DEPTNO
ORDER BY d.deptno, e.empno;

[실습 4]Oracle_05 슬라이드 13
SELECT d1.deptno, d1.dname, e1.empno, e1.ename, e1.mgr, e1.sal, e1.deptno,
       s.losal, s.hisal,s.grade, e2.empno as mgr_empno, e2.ename AS MGR_ENAME
FROM EMP E1
RIGHT OUTER JOIN DEPT D1 ON E1.DEPTNO = D1.DEPTNO
LEFT OUTER JOIN SALGRADE S ON E1.SAL BETWEEN S.LOSAL AND S.HISAL
LEFT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO
ORDER BY E1.DEPTNO, E1.EMPNO;

SELECT d1.deptno, d1.dname, e1.empno, e1.ename, e1.mgr, e1.sal, e1.deptno,
       s.losal, s.hisal,s.grade, e2.empno as mgr_empno, e2.ename AS MGR_ENAME
FROM emp E1, DEPT D1, SALGRADE S, EMP E2
WHERE E1.DEPTNO(+) = D1.DEPTNO AND E1.SAL BETWEEN S.LOSAL(+) AND
      S.HISAL(+) AND E1.MGR = E2.EMPNO(+)
ORDER BY E1.DEPTNO;
