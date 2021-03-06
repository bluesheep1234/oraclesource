CREATE TABLE dept_temp2 AS SELECT * FROM dept;

-- dept_temp2에 있는 loc 모두 수정
UPDATE dept_temp2  --테이블 명
SET loc = 'SEOUL'; -- 수정할 내용
--4개 행 이(가) 업데이트되었습니다.

SELECT * FROM dept_temp2;

SELECT * FROM emp_temp;
ROLLBACK;

UPDATE dept_temp2  --테이블 명
SET loc = 'SEOUL' -- 수정할 내용
WHERE deptno=10; --업데이트 조건

-- emp_temp 테이블의 사원들 중에서 급여가 3000 이하인 사원만 추가수당을 50으로 수정
UPDATE emp_temp
SET comm=50
WHERE sal<=3000;

-- 서브쿼리를 이용한 데이터 수정 
--40번 부서의 부서명과 지역 수정 
UPDATE dept_temp2
SET (dname, loc) = (SELECT dname, loc FROM dept WHERE deptno=30)
WHERE deptno=40;


UPDATE dept_temp2
SET loc = 'SEOUL'
WHERE deptno=(SELECT deptno FROM dept WHERE dname='OPERATIONS');

COMMIT;



















