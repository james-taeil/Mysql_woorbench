delimiter //

CREATE FUNCTION fnc_interest(
	price INT)
    RETURNS INT
    
BEGIN
	DECLARE myinterest INT;
    
    if price > 30000 THEN 
    SET myinterest = price * 0.1;
    
    ELSE
    SET myinterest = price * 0.05;
    END IF;
    RETURN myinterest;
END;
//
delimiter ;