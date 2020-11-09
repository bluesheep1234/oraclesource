-- ������ �޿����� ���� �޿��� �޴� ����� ����ϱ�

-- ������ �޿� �˾Ƴ��� 
SELECT sal FROM emp WHERE ename='JONES';

-- ���� �޿� ��� ����ϱ�
SELECT * FROM emp WHERE sal > 2975; 

-- �������� : ������ �ȿ� �ٸ� �������� �����ϰ� �ִ� ����
-- ������ �������� : ���������� ����� �ϳ���(JONES�� �� �� ����)
--                 >,<,=,<=,>=            ���� ���� :<>,^=,!=

SELECT * FROM emp WHERE sal > (SELECT sal FROM emp WHERE ename='JONES');

-- ����̸��� ALLEN�� ����� �߰����纸�� ���� �޴� ����� ���
SELECT * FROM emp WHERE comm > (SELECT comm FROM emp WHERE ename='ALLEN');

-- ����̸��� WARD�� ����� �Ի��Ϻ��� ���� �Ի��� ����� ���
SELECT * FROM emp WHERE hiredate < (SELECT hiredate FROM emp WHERE ename='WARD');

-- 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ��� ���
SELECT * FROM emp WHERE deptno = 20 AND sal > (SELECT AVG(sal) FROM emp);

-- 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ����� ���� ���
-- �μ���, ���� ��ġ ����ϵ��� �Ѵ�. 
SELECT e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc
FROM emp e, dept d 
WHERE e.deptno=d.deptno AND d.deptno = 20 AND sal > (SELECT AVG(sal) FROM emp);





-- ������ ��������
-- ������ ������ : IN,ANY,ALL,EXISTS

-- �������� ����� 2�� �̻� ������ ����� ������ ���������� �����ڴ� ��� �Ұ�
-- ���� �� ���� ���ǿ� 2�� �̻��� ���� ���ϵǾ����ϴ�.
SELECT * FROM emp WHERE sal >= (SELECT MAX(sal) FROM emp GROUP BY deptno); 

-- IN 
SELECT * FROM emp WHERE sal IN (SELECT MAX(sal) FROM emp GROUP BY deptno); 

-- ANY(SOME)
-- = ANY(SOME) : IN�� �������� ���� ����, �� IN�� �� ���� ����Ѵ�
-- ANY�� ���������� ���� ������ �۾��� ���� �ʾƵ� �ȴ�.
SELECT * FROM emp WHERE sal = ANY (SELECT MAX(sal) FROM emp GROUP BY deptno); 
SELECT * FROM emp WHERE sal = SOME (SELECT MAX(sal) FROM emp GROUP BY deptno); 

-- 30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ����� ���
SELECT MAX(sal) FROM emp WHERE deptno=30;
SELECT * FROM emp WHERE sal < ANY (SELECT MAX(sal) FROM emp WHERE deptno=30); 
SELECT * FROM emp WHERE sal < ANY (SELECT sal FROM emp WHERE deptno=30); 

-- 30�� �μ� ������� �ּ� �޿����� ���� �޿��� �޴� ����� ���
SELECT * FROM emp WHERE sal > ANY (SELECT sal FROM emp WHERE deptno=30); 

-- ALL : ���������� ����� ��� �����ϴ� ���������� ������ �� ���
-- �μ���ȣ�� 30���� ������� �ּ� �޿����� �� ���� �޿��� �޴� ��� ���
SELECT * FROM emp WHERE sal < ALL (SELECT sal FROM emp WHERE deptno=30);

-- EXISTS : IN�� ����� ����. ��, IN���� ������ �����
-- �������� ����� �����ϸ� �������� ����� ���
-- ���������� WHERE���� �������� ����� ������
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
              
              
              
-- ���� �� �������� : ���������� SELECT ���� ���� �÷��� ������ ������ ���
SELECT * FROM emp WHERE (deptno, sal) IN 
            (SELECT deptno, MAX(sal) FROM emp GROUP BY deptno);

-- FROM ���� ����ϴ� ��������(�ζ��� ��)
SELECT e.empno, e.ename, d.deptno, d.dname, d.loc
FROM (SELECT * FROM emp WHERE deptno=10) e, (SELECT * FROM dept) d
WHERE e.deptno = d.deptno;

-- SELECT ���� ����ϴ� �������� (��Į�� ��������)










