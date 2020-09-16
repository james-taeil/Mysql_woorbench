delimiter //
CREATE PROCEDURE AveragePrice(
	OUT AverageVal INT)
BEGIN
	SELECT AVG(price) INTO averageval
    FROM book
    WHERE price IS NOT NULL;
END;
//
delimiter ;

CALL averageprice(@myvalue);
SELECT @myvalue;