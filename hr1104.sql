--hr ������ ������ �ִ� ��� ���̺� ����
select * from tab;
SELECT * FROM employees;
-- �����ȣ�� 176�� ����� LAST_NAME�� �μ���ȣ ��ȸ
SELECT last_name, department_id FROM employees WHERE employee_id=176;
-- ������ 12000 �̻�(>=) �Ǵ� �������� LAST_NAME �� ���� ��ȸ
SELECT last_name, salary FROM employees WHERE salary >= 12000;
-- ������ 5000���� 12000�� ���� �̿��� ������� LAST_NAME �� ���� ��ȸ
SELECT last_name, salary FROM employees WHERE salary < 5000 OR salary >= 12000; 

-- 20�� �� 50�� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� �μ���ȣ�� ���ĺ���
-- ���� ��ȸ�Ѵ�. 
SELECT last_name, department_id FROM employees WHERE department_id IN(20,50) ORDER BY last_name ASC, department_id ASC;


-- Ŀ�̼��� ���� ��� ������� ��� ������� LAST_NAME, ����, Ŀ�̼� ��ȸ�ϱ�. ��, ������ ���� �� Ŀ�̼� �������� ��� ���
SELECT last_name, salary, commission_pct FROM employees ORDER BY salary DESC, commission_pct DESC;

-- ������ 2500, 3500, 7000�� �ƴϸ�, ������ SA_REP�̳� ST_CLERK�� ����� ��ȸ
SELECT * FROM employees WHERE salary NOT IN(2500, 3500, 7000) AND job_id IN('SA_REP', 'ST_CLERK');

-- 2008/02/20 ~ 2008/05/01 ���̿� ���� ������� LAST_NAME, �����ȣ, ������� ��ȸ
--��, ������� ������������ �����Ͽ� ���
SELECT last_name, employee_id, hire_date FROM employees WHERE hire_date>='08/02/20' AND hire_date<='08/05/01'
ORDER BY hire_date DESC;
-- 2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� �������� �������� �����Ͽ� ���
SELECT last_name, hire_date FROM employees WHERE hire_date>='04/01/01' AND hire_date<='04/12/31' ORDER BY hire_date;

