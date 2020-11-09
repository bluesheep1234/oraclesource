-- SUM : �հ�
SELECT SUM(sal), SUM(DISTINCT sal), SUM(ALL sal) FROM emp;

-- COUNT : ����
SELECT COUNT(*) FROM emp;

--�μ� ��ȣ�� 30���� ���� �� ���ϱ�
SELECT COUNT(*) FROM emp WHERE deptno=30;

SELECT COUNT(sal), COUNT(DISTINCT sal), COUNT(ALL sal) FROM emp;

-- MAX(�ִ밪), MIN(�ּҰ�)
SELECT MAX(SAL), MIN(SAL) FROM emp;

-- �μ���ȣ�� 20�� ����� �Ի��� �� ���� �ֱ� �Ի��� ���ϱ�
SELECT MAX(hiredate) FROM emp WHERE deptno=20;

-- AVERAGE : ���
SELECT ROUND(AVG(sal),-1) FROM emp;
SELECT ROUND(AVG(sal),-1) FROM emp WHERE deptno=30;
SELECT AVG(DISTINCT sal) FROM emp;


-- GROUP BY : ������� ���ϴ� ���� ���� ��� 
-- �μ��� ������ ���
SELECT deptno,AVG(sal) FROM emp GROUP BY deptno;

-- �μ� ��ȣ�� �߰����� ��� ���ϱ�
SELECT deptno, AVG(comm) FROM emp GROUP BY deptno;

-- �μ���ȣ, ��å�� �޿��� ���
SELECT deptno,AVG(sal),job FROM emp GROUP BY deptno,job ORDER BY deptno,job;

-- GROUP BY ���� ���� �ȵǴ� ���� SELECT�� �����ؼ� �ȵȴ�(ename)
SELECT ename, deptno, AVG(sal)
FROM emp 
GROUP BY deptno;

-- HAVING : GROUP BY ���� ������ �� �� ���
-- �� �μ��� ��å�� ��� �޿��� ���ϵ� �� ��� �޿��� 2000�̻��� �׷츸 ���
SELECT deptno, job, AVG(sal)
FROM emp 
GROUP BY deptno, job
HAVING AVG(sal) >=2000
ORDER BY deptno, job;


-- ����JOIN
-- ���� �� �ִ� ��� ���� ��ȸ
SELECT * FROM emp, dept ORDER BY empno; --56��

SELECT * FROM dept; --4��
SELECT * FROM emp; -- 14��

-- 1) ��������(�����) ���ǰ� �����Ǵ� �� ����
SELECT * 
FROM emp,dept
WHERE emp.deptno = dept.deptno --������ ����
ORDER BY empno;

SELECT * 
FROM emp e,dept d
WHERE e.deptno = d.deptno --������ ����
ORDER BY empno;

SELECT * 
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno --���α���
ORDER BY empno;

-- �� ���̺� ���� �̸��� �ʵ尡 �����ϴ� ���
-- ��� ���̺� �ִ� �ʵ带 ������ �� ������ ��Ȯ�� ����ؾ� ��
SELECT empno, ename, job, d.deptno, dname
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno --���α���
ORDER BY empno;


-- emp ���̺�� dept ���̺��� �����Ͽ� empno, ename, sal, deptno, dname, loc�� ��ȸ.
-- ��, �޿��� 3000 �̻��� ����� ���
SELECT e.empno, e.ename, e.sal, e.deptno, d.dname, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno AND sal>=3000;

-- emp ���̺��� ��Ī�� e��, dept ���̺� ��Ī�� d�� �Ͽ�
-- �޿��� 2500�����̰� �����ȣ�� 9999 ������ ����� ������ ���
SELECT e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, d.deptno,d.dname,d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno AND sal<=2500 AND empno<=9999;

SELECT *
FROM emp e, dept d
WHERE e.deptno = d.deptno AND sal<=2500 AND empno<=9999;


-- emp ���̺��� ��Ī�� e��, salgrade ���̺� ��Ī�� s�� �Ͽ�
-- �� ����� ������ ���Ҿ� ����� ��� ������ ���
SELECT *
FROM emp e, salgrade s
WHERE e.sal between s.losal AND s.hisal;

-- 2) ��������(��ü����) : ���� ���̺��� �ڱ� �ڽ� ���̺��� ��
SELECT e1.empno, e1.ename, e1.mgr, e2.empno AS mgr_empno, e2.ename AS MGR_ENAME
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno;

-- OUTER JOIN(�ܺ�����) : ������ �������� �ʴ� �����͵� ����
-- mgr�� ���� king���� ��µ�
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




[�ǽ� 1]Oracle_05 �����̵� 11
SELECT e.deptno, d.dname, e.empno, e.ename, e.sal
FROM emp e, dept d
WHERE e.deptno = d.deptno AND e.sal>2000 ORDER BY e.deptno;

SELECT e.deptno, d.dname, e.empno, e.ename, e.sal
FROM emp e INNER JOIN dept d ON e.deptno = d.deptno 
WHERE e.sal>2000 ORDER BY e.deptno;

[�ǽ� 2]Oracle_05 �����̵� 11
SELECT e.deptno, d.dname, FLOOR(AVG(e.sal)), MAX(e.sal), MIN(e.sal), COUNT(dname)
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY e.DEPTNO, D.DNAME
ORDER BY e.deptno;

SELECT e.deptno, d.dname, FLOOR(AVG(e.sal)), MAX(e.sal), MIN(e.sal), COUNT(dname)
FROM emp e INNER JOIN dept d ON e.deptno = d.deptno
GROUP BY e.DEPTNO, D.DNAME
ORDER BY e.deptno;

[�ǽ� 3]Oracle_05 �����̵� 12
SELECT d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
FROM emp e, RIGHT OUTER JOIN dept d ON E.DEPTNO = D.DEPTNO
ORDER BY d.deptno, e.empno;

[�ǽ� 4]Oracle_05 �����̵� 13
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
