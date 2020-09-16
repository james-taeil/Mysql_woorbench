delimiter //
CREATE PROCEDURE interest()
BEGIN
	DECLARE myinterest INT DEFAULT 0.0;
	DECLARE price INT;
    DECLARE endofrow BOOLEAN DEFAULT FALSE;
    DECLARE interestcursor CURSOR FOR -- cursor 변수로 선언
		SELECT saleprice
        FROM orders;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET endofrow = TRUE;
    
    OPEN interestcursor; -- cursor 시작 알림
    cursor_loop : LOOP
		FETCH interestcursor INTO price;
        IF endofrow THEN LEAVE cursor_loop;
        END IF;
        IF price >= 30000 THEN
			SET myinterest = myinterest + price * 0.1;
		ELSE
			SET myinterest = myinterest + price * 0.05;
		END IF;
	END LOOP cursor_loop;
	CLOSE interestcursor;
	SELECT concat('전체 이익 금액 =', myinterest);
END;
//
delimiter ;

CALL interest();