delimiter //
CREATE TRIGGER afterinsertbook
	AFTER INSERT ON book FOR EACH ROW
BEGIN
	DECLARE average INT;
    INSERT INTO book_log
    VALUES(new.bookid, new.bookname, new.publisher, new.price);
END;
//
delimiter ;   

DROP TRIGGER afterinsertbook;
