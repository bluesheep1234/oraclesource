CREATE TABLE dept_tcl AS SELECT * FROM dept;

INSERT INTO dept_tcl VALUES(50,'DATABASE','SEOUL');
COMMIT;

SELECT * FROM DEPT_TCL;

ROLLBACK;

-- 하나의 트랜잭션 생성
INSERT INTO dept_tcl VALUES(60,'NETWORK','BUSAK');
UPDATE dept_tcl SET loc='SEOUL' WHERE deptno=40;
DELETE FROM dept_tcl WHERE dname='RESERACH';
SELECT * FROM dept_tcl;

COMMIT;



















