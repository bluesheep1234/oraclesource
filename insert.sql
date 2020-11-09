-- INSERT 
-- 회원가입, 게시글 등록, 입금 등

-- 기존의 dept 테이블을 복사해서 dept_temp 테이블 생성
CREATE TABLE dept_temp AS SELECT * FROM dept;

-- Table DEPT_TEMP이(가) 생성되었습니다.

-- 현재 테이블 조회
SELECT * FROM dept_temp;

-- 데이터 추가하기(방법 1) : 필드명 주기.
INSERT INTO dept_temp(deptno, dname, loc)
VALUES(50,'DATABASE','SEOUL');

-- 데이터 추가하기(방법 2) : 필드명 안주기. 값은 순서에 맞춰서 넣어야 함
INSERT INTO dept_temp VALUES(60,'NETWORK','BUSAN');

-- 에러 발생
INSERT INTO dept_temp(deptno, dname, loc)
VALUES(50,'DATABASE');
-- SQL 오류: ORA-00947: 값의 수가 충분하지 않습니다

INSERT INTO dept_temp(deptno, dname, loc)
VALUES(500,'DATABASE','SEOUL');
-- ORA-01438: 이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다.

-- NULL 삽입하기 
-- 명시적으로 NULL 삽입
INSERT INTO dept_temp(deptno, dname, loc)
VALUES(70,'DATABASE',NULL);

INSERT INTO dept_temp(deptno, dname, loc)
VALUES(80,'MOBILE','');

-- 묵시적으로 NULL 삽입
INSERT INTO dept_temp(deptno, loc) VALUES(90, 'INCHEON');

-- EMP테이블을 복사하여 EMP_TEMP 테이블 생성
CREATE TABLE emp_temp AS SELECT * FROM emp;

-- 테이블 삭제
DROP TABLE emp_temp;

-- EMP테이블을 복사하여 EMP_TEMP 테이블 생성하되, 구조만 복사하기 
CREATE TABLE emp_temp AS SELECT * FROM emp WHERE 1<>1;
SELECT * FROM emp_temp;

DESC emp_temp

INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(9999, '홍길동', 'PRESIDENT', NULL, '2020-11-09', 4000, NULL, 10);

INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(8888, '성춘향', 'MANAGER', NULL, '2020-11-08', 3000, NULL, 10);

--커밋(INSERT,UPDATE,DELETE 후 DB에 최종반영)
COMMIT;
-- 커밋 완료.
-- ROLLBACK(다시 되돌리기)
-- 트랜잭션 : 커밋과 롤백

INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(7777, '유승호', 'MANAGER', NULL, '07/01/2010', 4000, NULL, 20);
--ORA-01830: 날짜 형식의 지정에 불필요한 데이터가 포함되어 있습니다
INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(7777, '유승호', 'MANAGER', NULL, TO_DATE('07/01/2010', 'DD/MM/YYYY'), 4000, NULL, 20);

INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(6666, '이순신', 'MANAGER', NULL, SYSDATE, 4000, NULL, 20);

-- EMP 테이블에서 SALGRADE 테이블을 참조하여 급여 등급이 1등급인 사원만을 EMP_TEMP테이블에
-- 추가하고 싶다면?
-- 서브쿼리로 작성하기(데이터가 추가되는 테이블의 열 개수와 서브쿼리의 열 개수가 일치해야 함)
INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno) 
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp e, salgrade s
WHERE e.sal between s.losal AND s.hisal AND s.grade = 1; 





















