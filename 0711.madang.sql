//Q.박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
SELECT name FROM Customer, Orders, Book 
	WHERE Customer.custid=Orders.custid
	AND Orders.bookid=Book.bookid AND name NOT LIKE '박지성' 
	AND publisher IN (SELECT publisher FROM Customer, Orders, Book 
                    WHERE Customer.custid=Orders.custid
                    AND Orders.bookid=Book.bookid
                    AND name LIKE '박지성');
                    
//Q.두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
SELECT name FROM Customer c1
	WHERE 2 >=
		(SELECT COUNT(DISTINCT publisher) FROM Customer, Orders, Book 
		 WHERE Customer.custid=Orders.custid
         AND Orders.bookid=Book.bookid AND (name LIKE c1.name));

//Q.새로운 도서 (11, ‘스포츠 세계’, ‘대한미디어’, 10000원)이 마당서점에 도서테이블에 추가하시오.
INSERT INTO BOOK VALUES(11, '스포츠 세계', '대한미디어', 10000);

SELECT * FROM BOOK;

//Q.출판사 ‘대한미디어’를 ‘대한출판사’로 이름을 바꾸시오.
UPDATE Book SET publisher='대한출판사' WHERE publisher LIKE '대한미디어';




