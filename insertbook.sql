USE madang;
delimiter //
CREATE PROCEDURE InsertBook(
	IN mybookid INT,
    IN mybookname VARCHAR(40),
    IN mypublisher VARCHAR(40),
    IN myprice INT)
BEGIN
	INSERT INTO book(bookid, bookname, publisher, price)
    VALUES(mybookid, mybookname, mypublisher, myprice);
END;
//
delimiter ;

CALL insertbook(13, '스포츠과학', '마당과학서적', 25000);
SELECT * FROM book;

DROP PROCEDURE insertbook;


