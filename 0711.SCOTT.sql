//Q1-1.EMP ���̺�� ���� ������ �����͸� �����ϴ� EMPIDX ���̺��� ��������.
CREATE TABLE EMPIDX
AS SELECT * FROM EMP;

//Q1-2.������ EMPIDX ���̺��� EMPNO ���� IDX_EMPIDX_EMPNO �ε����� ��������.
CREATE INDEX IDX_EMPIDX_EMPNO
    ON EMPIDX (EMPNO);
    
//Q1-3.���������� �ε����� �� �����Ǿ����� ������ ������ ���� �並 ���� Ȯ���� ������.
SELECT * FROM USER_INDEXES
WHERE INDEX_NAME='IDX_EMPIDX_EMPNO';

//Q2.���� 1������ ������ EMPIDX ���̺��� ������ �� �޿��� 1500�ʰ��� ����鸸 ����ϴ�
//EMPIDX_OVER15K �並 ������ ������. EMPIDX_OVER15K ��� �����ȣ,��� �̸�,��å,
//�μ���ȣ,�޿�,�߰� ���� ���� ������ �ִ�. �߰� ������ ��쿡 �߰� ������ �����ϸ� O,
//�������� ������ X�� ���
CREATE OR REPLACE VIEW EMPIDX_OVER15K
AS (SELECT EMPNO, ENAME, JOB, DEPTNO,
        SAL, NVL2(COMM,'O','X')AS COMM
        FROM EMPIDX
        WHERE SAL>1500);
        
//Q3-1.DEPT ���̺�� ���� ���� �� ������ ������ DEPTSEQ ���̺��� �ۼ��� ������
CREATE TABLE DEPTSEQ
    AS SELECT * FROM DEPT;
    
//Q3-2. ������ DEPTSEQ ���̺��� DEPTNO ���� ����� �������� ������ Ư���� �°� ������ ������
CREATE SEQUENCE SEQ_DEPTSEQ
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 99
    MINVALUE 1
    NOCYCLE NOCACHE;

//Q3-3. ���������� ������ DEPTSEQ�� ����Ͽ� �����ʰ� ���� �� �� �μ��� ���ʴ�� �߰��� ������
INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC) 
VALUES (SEQ_DEPTSEQ.NEXTVAL, 'DATABASE', 'SEOUL');

INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC) 
VALUES (SEQ_DEPTSEQ.NEXTVAL, 'WEB', 'BUSAN');

INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC) 
VALUES (SEQ_DEPTSEQ.NEXTVAL, 'MOBILE', 'ILSAN');

SELECT * FROM DEPTSEQ;
