-- scott ������ �������ִ� ��� ���̺� ����
select * from tab;

-- emp ���̺��� ����
DESC emp; 

--emp ���̺��� ��� ���� ��ȸ
SELECT *FROM emp; 

-- emp ���̺��� Ư�� �ʵ常 ��ȸ
SELECT ename, job, sal FROM emp;

-- �ߺ� ���ڵ� ������ �� ��ȸ : DISTINCT
SELECT DISTINCT deptno FROM emp;

-- alais (��Ī) : AS empno�� �����ȣ�� �̸�����(������ �ٲ�� ���� �ƴ�, ���̴� �͸� �ٲ�)
SELECT empno AS �����ȣ FROM emp;

SELECT ename AS "�� ��", sal AS "�� ��", sal*12+comm AS "�� ��", comm AS "�� �� ��" FROM emp;

-- ORDER BY : �����Ͽ� ��ȸ

-- �ϳ��� ���� ������ �־� �������� ��ȸ : ASC(����)
SELECT ename,sal FROM emp ORDER BY sal;

-- �ϳ��� ���� ������ �־� �������� ��ȸ : DESC
SELECT ename,sal FROM emp ORDER BY sal DESC;

-- ��ü �����͸� ��ȸ(�����ȣ ��������)
SELECT * FROM emp ORDER BY empno; 

-- �μ� ��ȣ�� ���������̰�, �μ� ��ȣ�� �����ϴٸ� �޿��� ��������
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;

-- ��ȸ�� ���̺��� emp���̺��̸� ��� ���� ����Ѵ�

SELECT empno AS EMPLOYEE_NO, ename AS EMPLOYEE_NAME, job, mgr AS MANAGER,
       hiredate, sal AS SALARY, comm AS COMMISSION, deptno AS DEPARTMENT_NO
FROM emp ORDER BY deptno DESC, ename ASC;

-- WHERE : ��ȸ�� �� �� ���� �ֱ�

-- �μ���ȣ�� 30���� ��� ��ȸ
SELECT * FROM emp WHERE deptno = 30;

-- �����ȣ�� 7782�� ��� ��ȸ
SELECT * FROM emp WHERE empno=7782;

-- �μ���ȣ�� 30�̰�, �����å�� SALESMAN ���� ��ȸ
SELECT * FROM emp WHERE deptno=30 AND job='SALESMAN';

-- �����ȣ�� 7499�̰�, �μ���ȣ�� 30�� ���� ��ȸ
SELECT * FROM emp WHERE empno=7499 AND deptno=30;

-- �μ���ȣ�� 30�̰ų�, �����å�� CLERK ���� ��ȸ
SELECT * FROM emp WHERE deptno=30 OR job='CLERK';

-- �μ���ȣ�� 20�̰ų�, �����å�� SALESMAN ���� ��ȸ
SELECT * FROM emp WHERE deptno=20 OR job='SALESMAN';

-- �����ڸ� �̿��� ��ȸ

-- sal*12�� �ݾ��� 36000�� ������ ��ȸ
SELECT * FROM emp WHERE sal*12=36000;

-- ���迬���� : >, <, >=, <=
SELECT * FROM emp WHERE sal > 3000;
SELECT * FROM emp WHERE sal >= 3000;
SELECT * FROM emp WHERE ename >= 'F';

-- �������� : AND, OR 
-- �޿��� 2500�̻��̰� ������ ANALYST�� ������� ��ȸ
SELECT * FROM emp WHERE sal >= 2500 AND job='ANALYST';

-- ������ MANAGER, SALESMAN, CLERK �� ������� ��ȸ
SELECT * FROM emp WHERE job='MANAGER' OR job='SALESMAN' OR job='CLERK';

-- ������� : ���� �׸��� ������ �˻�
-- SAL�� 3000�� �ƴ� ������� ���
SELECT * FROM emp WHERE sal!=3000;
SELECT * FROM emp WHERE sal<>3000;
SELECT * FROM emp WHERE sal^=3000; 

-- IN �� NOT IN ������
-- ������ MANAGER, SALESMAN, CLERK �� ������� ��ȸ
SELECT * FROM emp WHERE job IN('MANAGER','SALESMAN','CLERK');

SELECT * FROM emp WHERE job!='MANAGER' AND job!='SALESMAN' AND job!='CLERK';
SELECT * FROM emp WHERE job NOT IN('MANAGER','SALESMAN','CLERK');

-- IN�� ����Ͽ� �μ� ��ȣ�� 10�� 20���� ��� ������ ��ȸ
SELECT * FROM emp WHERE deptno IN('10','20');

