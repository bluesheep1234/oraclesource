-- INSERT 
-- ȸ������, �Խñ� ���, �Ա� ��

-- ������ dept ���̺��� �����ؼ� dept_temp ���̺� ����
CREATE TABLE dept_temp AS SELECT * FROM dept;

-- Table DEPT_TEMP��(��) �����Ǿ����ϴ�.

-- ���� ���̺� ��ȸ
SELECT * FROM dept_temp;

-- ������ �߰��ϱ�(��� 1) : �ʵ�� �ֱ�.
INSERT INTO dept_temp(deptno, dname, loc)
VALUES(50,'DATABASE','SEOUL');

-- ������ �߰��ϱ�(��� 2) : �ʵ�� ���ֱ�. ���� ������ ���缭 �־�� ��
INSERT INTO dept_temp VALUES(60,'NETWORK','BUSAN');

-- ���� �߻�
INSERT INTO dept_temp(deptno, dname, loc)
VALUES(50,'DATABASE');
-- SQL ����: ORA-00947: ���� ���� ������� �ʽ��ϴ�

INSERT INTO dept_temp(deptno, dname, loc)
VALUES(500,'DATABASE','SEOUL');
-- ORA-01438: �� ���� ���� ������ ��ü �ڸ������� ū ���� ���˴ϴ�.

-- NULL �����ϱ� 
-- ��������� NULL ����
INSERT INTO dept_temp(deptno, dname, loc)
VALUES(70,'DATABASE',NULL);

INSERT INTO dept_temp(deptno, dname, loc)
VALUES(80,'MOBILE','');

-- ���������� NULL ����
INSERT INTO dept_temp(deptno, loc) VALUES(90, 'INCHEON');

-- EMP���̺��� �����Ͽ� EMP_TEMP ���̺� ����
CREATE TABLE emp_temp AS SELECT * FROM emp;

-- ���̺� ����
DROP TABLE emp_temp;

-- EMP���̺��� �����Ͽ� EMP_TEMP ���̺� �����ϵ�, ������ �����ϱ� 
CREATE TABLE emp_temp AS SELECT * FROM emp WHERE 1<>1;
SELECT * FROM emp_temp;

DESC emp_temp

INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(9999, 'ȫ�浿', 'PRESIDENT', NULL, '2020-11-09', 4000, NULL, 10);

INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(8888, '������', 'MANAGER', NULL, '2020-11-08', 3000, NULL, 10);

--Ŀ��(INSERT,UPDATE,DELETE �� DB�� �����ݿ�)
COMMIT;
-- Ŀ�� �Ϸ�.
-- ROLLBACK(�ٽ� �ǵ�����)
-- Ʈ����� : Ŀ�԰� �ѹ�

INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(7777, '����ȣ', 'MANAGER', NULL, '07/01/2010', 4000, NULL, 20);
--ORA-01830: ��¥ ������ ������ ���ʿ��� �����Ͱ� ���ԵǾ� �ֽ��ϴ�
INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(7777, '����ȣ', 'MANAGER', NULL, TO_DATE('07/01/2010', 'DD/MM/YYYY'), 4000, NULL, 20);

INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(6666, '�̼���', 'MANAGER', NULL, SYSDATE, 4000, NULL, 20);

-- EMP ���̺��� SALGRADE ���̺��� �����Ͽ� �޿� ����� 1����� ������� EMP_TEMP���̺�
-- �߰��ϰ� �ʹٸ�?
-- ���������� �ۼ��ϱ�(�����Ͱ� �߰��Ǵ� ���̺��� �� ������ ���������� �� ������ ��ġ�ؾ� ��)
INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno) 
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp e, salgrade s
WHERE e.sal between s.losal AND s.hisal AND s.grade = 1; 





















