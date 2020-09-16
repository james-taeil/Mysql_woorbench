use madang;
delimiter //
CREATE PROCEDURE BookInsertOrUpdate(
	mybookid INT,
    mybookname VARCHAR(40),
    mypublisher VARCHAR(40),
    myprice INT)
BEGIN
	DECLARE mycount INT;
    SELECT count(*) INTO mycount 
    FROM book
    WHERE bookname LIKE mybookname;
    
    IF mycount != 0 THEN
		SET SQL_SAFE_UPDATES = 0;
		UPDATE book 
		SET price = myprice
		WHERE bookname LIKE mybookname;
    
    ELSE
		INSERT INTO book(bookid, bookname, publisher, price)
		VALUES(mybookid, mybookname, mypublisher, myprice);
    
    END IF;
END;
//
delimiter ;
    
CALL bookinsertorupdate(15, '스포츠 즐거움', '마당과학서적', 25000);
SELECT *
FROM book;

CALL bookinsertorupdate(15,'스포츠 즐거움', '마당과학서적', 20000);