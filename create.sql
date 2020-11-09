CREATE TABLE TEST(
    ID NUMBER(4),
    NAME VARCHAR2(3));
    
DESC TEST;
--한글은 글자 하나당 2BYTE로 처리
INSERT INTO TEST VALUES(1000,'홍길동');
-- 영어는 글자 하나당 1BYTE로 처리
INSERT INTO TEST VALUES(1000,'ABC');

-- 언어마다 서로 다른 BYTE 처리를 보완하기 위해 nchar, nvarchar2가 나옴


CREATE TABLE TEST2(
    ID NCHAR(4),
    NAME NVARCHAR2(3));
-- NCHAR, NVARCHAR2 차이 : 고정된 길이를 항상 가지고 있느냐 아니냐 차이
-- NCHAR(비가변), NVARCHAR2(가변)의 4,3은 BYTE수가 아닌 글자 수이다.
-- NCHAR의 경우에는 글자가 1만 입력이 돼도 4자리를 항상 유지 

INSERT INTO TEST2 VALUES('황보강성', '홍길동');

CREATE TABLE TEST3(
    ID NVARCHAR2(4),
    NAME NVARCHAR2(4),
    REG_DATE DATE);
    
INSERT INTO TEST3 VALUES('황보강성', '홍길동',SYSDATE);
INSERT INTO TEST3 VALUES('황보강성', '홍길동','2020-11-09');


-- 테이블 생성하기 
-- CREATE TABLE 테이블명(열이름 타입...);
-- CREATE TABLE 테이블명 AS SELECT * FROM EMP;
-- CREATE TABLE 테이블명 AS SELECT * FROM EMP WHERE DEPTNO=20;
-- CREATE TABLE 테이블명 AS SELECT * FROM EMP WHERE 1<>1;

DESC EMP;

CREATE TABLE EMP_DDL(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2), -- 전체 자릿수는 7자리(소수점 2자리를 포함할 수 있음)
    COMM NUMBER(7,2), --12345.78 (자연수 다섯자리까지)
    DEPTNO NUMBER(2));

-- ALTER : 테이블 변경

-- 컬럼 추가
ALTER TABLE EMP_DDL ADD HP VARCHAR2(20);

-- 기존 컬럼명 변경
ALTER TABLE EMP_DDL RENAME COLUMN HP TO TEL;

-- 기존 타입 변경
ALTER TABLE EMP_DDL MODIFY EMPNO NUMBER(5);

-- 기존 컬럼 삭제
ALTER TABLE EMP_DDL DROP COLUMN TEL;

-- 테이블명 변경
RENAME EMP_DDL TO EMP_RENAME;

DESC EMP_RENAME;


CREATE TABLE member(
    id CHAR(8),
    name NVARCHAR2(10),
    addr NVARCHAR2(50),
    nation NCHAR(4),
    email VARCHAR2(50),
    age NUMBER(7,2));
    
DESC member;

ALTER TABLE member ADD BIGO NVARCHAR2(20);

ALTER TABLE member MODIFY BIGO NVARCHAR2(30);

ALTER TABLE member RENAME COLUMN BIGO TO REMARK;

DROP TABLE member;






























