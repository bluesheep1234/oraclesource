--hr ������ ������ �ִ� ��� ���̺� ����
select * from tab;
SELECT * FROM employees;
-- �����ȣ�� 176�� ����� LAST_NAME�� �μ���ȣ ��ȸ
SELECT last_name, department_id FROM employees WHERE employee_id=176;
-- ������ 12000 �̻�(>=) �Ǵ� �������� LAST_NAME �� ���� ��ȸ
SELECT last_name, salary FROM employees WHERE salary >= 12000;
-- ������ 5000���� 12000�� ���� �̿��� ������� LAST_NAME �� ���� ��ȸ
SELECT last_name, salary FROM employees WHERE salary < 5000 OR salary >= 12000; 

