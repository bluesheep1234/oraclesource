CREATE TABLE emp_temp2 AS SELECT * FROM emp;

SELECT * FROM emp_temp2;

-- JOB�� MANAGER�� ������ �����ϱ�
DELETE FROM emp_temp2 WHERE job='MANAGER';
--3�� �� ��(��) �����Ǿ����ϴ�.

ROLLBACK;

DELETE emp_temp2; 
-- 14���� ����. FROM, WHERE���� �ʼ��� �ƴϴ�.

-- emp_temp2 ���̺��� ��� �߿��� �޿��� 5000�̻��� ��� ����
DELETE FROM emp_temp2 WHERE sal>=5000;

COMMIT;


-- [�ǽ� 1] Oracle_05 �����̵�31
CREATE TABLE EXAM_EMP AS SELECT * FROM emp;
CREATE TABLE EXAM_DEPT AS SELECT * FROM DEPT;
CREATE TABLE EXAM_SALGRADE AS SELECT * FROM SALGRADE;

DESC EXAM_EMP;

SELECT * FROM exam_emp;
-- [�ǽ� 2]
INSERT INTO exam_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (7201,'TEST_USER1','MANAGER',7788,'2016-01-02',4500, NULL, 50);
INSERT INTO exam_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (7202,'TEST_USER2','CLERK',7201,'2016-02-21',1800, NULL, 50);
INSERT INTO exam_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (7203,'TEST_USER3','ANALYST',7201,'2016-04-11',3400, NULL, 60);
INSERT INTO exam_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (7204,'TEST_USER4','SALESMAN',7201,'2016-05-31',2700, 300, 60);
INSERT INTO exam_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (7205,'TEST_USER5','CLERK',7201,'2016-07-20',2600, NULL, 70);
INSERT INTO exam_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (7206,'TEST_USER6','CLERK',7201,'2016-09-08',2600, NULL, 70);
INSERT INTO exam_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (7207,'TEST_USER7','LECTURER',7201,'2016-10-28',2300, NULL, 80);
INSERT INTO exam_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (7208,'TEST_USER8','STUDENT',7201,'2018-03-09',1200, NULL, 80);

-- [�ǽ� 3]
UPDATE exam_emp
SET deptno = 70
WHERE sal > (SELECT AVG(sal)FROM EXAM_EMP WHERE deptno=50);  

-- [�ǽ� 4]
UPDATE EXAM_EMP
SET SAL = SAL*1.1, DEPTNO = 80
WHERE HIREDATE > (SELECT MIN(HIREDATE) FROM EXAM_EMP WHERE DEPTNO = 60);

-- [�ǽ� 5]
DELETE FROM EXAM_EMP WHERE EMPNO IN (SELECT EMPNO
                                     FROM EXAM_EMP, SALGRADE
                                     WHERE SAL BETWEEN LOSAL AND HISAL AND GRADE=5);


-- �޿� ����� 3��� ���̿� �ִ� 30�� �μ��� ����鸸 ����
DELETE FROM emp_temp2 WHERE empno IN(SELECT e.empno
                                   FROM emp_temp2 e, salgrade s
                                   WHERE e.sal BETWEEN s.losal AND s.hisal
                                   AND s.grade=3 AND deptno=30);

-- DELETE FROM EMP_TEMP2 WHERE EMPNO IN (7001,7002,7003);




