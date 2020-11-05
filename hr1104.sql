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
SELECT last_name, salary, commission_pct FROM employees WHERE commission_pct>0 ORDER BY salary DESC, commission_pct DESC;

-- ������ 2500, 3500, 7000�� �ƴϸ�, ������ SA_REP�̳� ST_CLERK�� ����� ��ȸ
SELECT * FROM employees WHERE salary NOT IN(2500, 3500, 7000) AND job_id IN('SA_REP', 'ST_CLERK');

-- 2008/02/20 ~ 2008/05/01 ���̿� ���� ������� LAST_NAME, �����ȣ, ������� ��ȸ
--��, ������� ������������ �����Ͽ� ���
SELECT last_name, employee_id, hire_date FROM employees WHERE hire_date>='08/02/20' AND hire_date<='08/05/01'
ORDER BY hire_date DESC;
-- 2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� �������� �������� �����Ͽ� ���
SELECT last_name, hire_date FROM employees WHERE hire_date>='04/01/01' AND hire_date<='04/12/31' ORDER BY hire_date;


-- ������ 5000���� 12000�� ������ �ְ� 20 OR 50�� �μ��� 
-- �ٹ��ϴ� ������� ������ ��ȸ�Ͽ� ������������ �����ֱ�(LAST_NAME, SALARY)
SELECT last_name, salary
FROM employees
WHERE department_id IN (20,50) AND salary BETWEEN 5000 AND 12000 
ORDER BY salary;

-- 2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� �������� �������� �����Ͽ� ���
SELECT last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '2004/01/01' AND '2004/12/31'
ORDER BY hire_date;

-- ������ 5000~12000���� �̿��� ������� LAST_NAME, SALARY ��ȸ
SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;

-- LIKE ����

-- 2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� 
-- �Ի��� �������� �������� �����Ͽ� ���
SELECT last_name, hire_date 
FROM employees
WHERE hire_date LIKE '04%'
ORDER BY hire_date;

-- LAST_NAME�� u�� ���ԵǴ� ������� ��� �� laste_name ��ȸ
SELECT employee_id, last_name
FROM employees
WHERE last_name LIKE '%u%';

-- last_name�� �׹�° ���ڰ� a�� ������� last_name��ȸ
SELECT last_name
FROM employees
WHERE last_name LIKE '___a%';

-- last_name�� a Ȥ�� e ���ڰ� �ִ� ������� last_name�� ��ȸ�Ͽ� last_name ��������
-- �������� ����
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%' OR last_name LIKE '%e%'
ORDER BY last_name;

-- last_name�� a �� e ���ڰ� �ִ� ������� last_name�� ��ȸ�Ͽ� last_name ��������
-- �������� ����
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%e%' OR last_name LIKE '%e%a%'
ORDER BY last_name;

-- IS NULL ����
-- �Ŵ����� ���� ������� LAST_NAME, JOB_ID ��ȸ
SELECT last_name, job_id
FROM employees
WHERE manager_id IS null;

-- ST_CLERK�� JOB_ID�� ���� ����� ���� �μ� ID ��ȸ. �μ� ��ȣ�� NULL�� �� ����
SELECT DISTINCT department_id
FROM employees
WHERE job_id != 'st_clerk' AND department_id IS NOT null;

-- COMMISSION_PCT�� NULL�� �ƴ� ����� �߿��� COMMISSION = SALARY * COMMISSION_PCT��
-- ���Ͽ� EMPLOYEE_ID, FIRST_NAME, JOB_ID�� ���� ��ȸ
SELECT employee_id, first_name, job_id, salary*commission_pct AS COMMISSION
FROM employees
WHERE commission_pct IS NOT null;

-- [�ǽ�]���ڿ� �Լ�
-- 1. first_name�� Curtis�� ����� first_name, last_name, email, phone_number,
--    job_id�� ��ȸ�Ѵ�. ��, job_id�� ����� �ҹ��ڷ� ��µǵ��� �Ѵ�.
SELECT first_name, last_name, email, phone_number, LOWER(job_id)
FROM employees
WHERE first_name='Curtis';
-- 2. �μ���ȣ�� 60,70,80,90�� ������� employee_id, first_name, hire_datem, job_id��
--    ��ȸ�Ѵ�. ��, job_id�� it_prog�� ����� ��� ���α׷��ӷ� �����Ͽ� ����Ѵ�.
SELECT employee_id, first_name, hire_date, REPLACE(job_id,'IT_PROG','���α׷���')
FROM employees
WHERE department_id IN(60,70,80,90);

-- 3. job_id�� ad_pres, pu_clerk�� ������� employee_id, first_name, last_name,
--    department_id, job_id�� ��ȸ�Ͻÿ�. ��, ������� firtst_name�� last_name��
--    �����Ͽ� ����Ѵ�.
SELECT employee_id, first_name||' '||last_name,department_id, job_id
FROM employees
WHERE job_id IN('AD_PRES','PU_CLERK');

SELECT employee_id, CONCAT(first_name,CONCAT(' ',last_name)),department_id, job_id
FROM employees
WHERE job_id IN('AD_PRES','PU_CLERK');
