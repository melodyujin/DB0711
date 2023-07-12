//Q.�������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
SELECT name FROM Customer, Orders, Book 
	WHERE Customer.custid=Orders.custid
	AND Orders.bookid=Book.bookid AND name NOT LIKE '������' 
	AND publisher IN (SELECT publisher FROM Customer, Orders, Book 
                    WHERE Customer.custid=Orders.custid
                    AND Orders.bookid=Book.bookid
                    AND name LIKE '������');
                    
//Q.�� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
SELECT name FROM Customer c1
	WHERE 2 >=
		(SELECT COUNT(DISTINCT publisher) FROM Customer, Orders, Book 
		 WHERE Customer.custid=Orders.custid
         AND Orders.bookid=Book.bookid AND (name LIKE c1.name));

//Q.���ο� ���� (11, �������� ���衯, �����ѹ̵�, 10000��)�� ���缭���� �������̺� �߰��Ͻÿ�.
INSERT INTO BOOK VALUES(11, '������ ����', '���ѹ̵��', 10000);

SELECT * FROM BOOK;

//Q.���ǻ� �����ѹ̵��� ���������ǻ硯�� �̸��� �ٲٽÿ�.
UPDATE Book SET publisher='�������ǻ�' WHERE publisher LIKE '���ѹ̵��';




