//Q1-1.EMP 테이블과 같은 구조의 데이터를 저장하는 EMPIDX 테이블을 만들어보세요.
CREATE TABLE EMPIDX
AS SELECT * FROM EMP;

//Q1-2.생성한 EMPIDX 테이블의 EMPNO 열에 IDX_EMPIDX_EMPNO 인덱스를 만들어보세요.
CREATE INDEX IDX_EMPIDX_EMPNO
    ON EMPIDX (EMPNO);
    
//Q1-3.마지막으로 인덱스가 잘 생성되었는지 적절한 데이터 사전 뷰를 통해 확인해 보세요.
SELECT * FROM USER_INDEXES
WHERE INDEX_NAME='IDX_EMPIDX_EMPNO';

//Q2.문제 1번에서 생성한 EMPIDX 테이블의 데이터 중 급여가 1500초과인 사원들만 출력하는
//EMPIDX_OVER15K 뷰를 생성해 보세요. EMPIDX_OVER15K 뷰는 사원번호,사원 이름,직책,
//부서번호,급여,추가 수당 열을 가지고 있다. 추가 수당의 경우에 추가 수당이 존재하면 O,
//존재하지 않으면 X로 출력
CREATE OR REPLACE VIEW EMPIDX_OVER15K
AS (SELECT EMPNO, ENAME, JOB, DEPTNO,
        SAL, NVL2(COMM,'O','X')AS COMM
        FROM EMPIDX
        WHERE SAL>1500);
        
//Q3-1.DEPT 테이블과 같은 열과 행 구성을 가지는 DEPTSEQ 테이블을 작성해 보세요
CREATE TABLE DEPTSEQ
    AS SELECT * FROM DEPT;
    
//Q3-2. 생성한 DEPTSEQ 테이블의 DEPTNO 열에 사용할 시퀀스를 오른쪽 특성에 맞게 생성해 보세요
CREATE SEQUENCE SEQ_DEPTSEQ
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 99
    MINVALUE 1
    NOCYCLE NOCACHE;

//Q3-3. 마지막으로 생성한 DEPTSEQ를 사용하여 오른쪽과 같이 세 개 부서를 차례대로 추가해 보세요
INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC) 
VALUES (SEQ_DEPTSEQ.NEXTVAL, 'DATABASE', 'SEOUL');

INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC) 
VALUES (SEQ_DEPTSEQ.NEXTVAL, 'WEB', 'BUSAN');

INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC) 
VALUES (SEQ_DEPTSEQ.NEXTVAL, 'MOBILE', 'ILSAN');

SELECT * FROM DEPTSEQ;
