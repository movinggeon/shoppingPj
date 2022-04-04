DELIMITER $$ 
CREATE PROCEDURE insertProducts() 
BEGIN
    DECLARE i INT DEFAULT 1; 
    WHILE (i < 5) DO 
        insert into products
        values (
			null, (select SUBSTRING_INDEX(SUBSTRING_INDEX('sixPhone,sixTablet,sixBook,sixWatch', ',', i), ',', -1))
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;
/
DELIMITER $$ 
CREATE PROCEDURE insertModels() 
BEGIN
    DECLARE i INT DEFAULT 1;
    Declare s INT DEFAULT 1;
    WHILE (i <= 12) DO 
        insert into models
        values (
			null, s, (select SUBSTRING_INDEX(SUBSTRING_INDEX('3,2,1,PRO,Exp,light,PRO,Exp,light,Series 3,Series 2,Series 1', ',', i), ',', -1))
        );
        set s = if(i%3=0, s+1, s);
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;


/*------------------------------------------------------sixpohone3*/

DELIMITER $$ 
CREATE PROCEDURE insertPhone1() 
BEGIN
    DECLARE i INT DEFAULT 1; 
    DECLARE s INT DEFAULT 1;
    DECLARE p INT DEFAULT 180; 
    DECLARE m varchar(30) DEFAULT '128';
    WHILE (i <= 8) DO 
        insert into specifications
        values (
			null,1, 'S16', m, '6.1', '5G', 173, (select SUBSTRING_INDEX(SUBSTRING_INDEX('pink,blue,black,white', ',', s), ',', -1)), p, 10
        );
        
        set m = if(s=4, '256', m);
        set p = if(s=4, 190, p);
        set s = if(s=4, 0, s);
        Set s = s + 1;
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

/*-----------------------------------------------------------------------------sixphone2*/

DELIMITER $$ 
CREATE PROCEDURE insertPhone2() 
BEGIN
    DECLARE i INT DEFAULT 1; 
    WHILE (i <= 4) DO 
        insert into specifications
        values (
			null,2, 'S15', '64', '6.1', '3G', 162, (select SUBSTRING_INDEX(SUBSTRING_INDEX('black,white,green,blue', ',', i), ',', -1)), 150, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE insertPhone21() 
BEGIN
    DECLARE i INT DEFAULT 1; 
    WHILE (i <= 4) DO 
        insert into specifications
        values (
			null,2, 'S15', '64', '6.1', '4G', 162, (select SUBSTRING_INDEX(SUBSTRING_INDEX('black,white,green,blue', ',', i), ',', -1)), 150, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE insertPhone22() 
BEGIN
    DECLARE i INT DEFAULT 1; 
    WHILE (i <= 4) DO 
        insert into specifications
        values (
			null,2, 'S15', '128', '6.1', '3G', 162, (select SUBSTRING_INDEX(SUBSTRING_INDEX('black,white,green,blue', ',', i), ',', -1)), 160, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE insertPhone23() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 4) DO 
        insert into specifications
        values (
			null,2, 'S15', '128', '6.1', '4G', 162, (select SUBSTRING_INDEX(SUBSTRING_INDEX('black,white,green,blue', ',', i), ',', -1)), 160, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

/*------------------------------------------------------------------sixphone1*/

DELIMITER $$ 
CREATE PROCEDURE insertPhone3() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 4) DO 
        insert into specifications
        values (
			null, 3, 'S12', '64', '6.1', '3G', 184, (select SUBSTRING_INDEX(SUBSTRING_INDEX('black,white,yellow,purple', ',', i), ',', -1)), 120, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE insertPhone31() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 4) DO 
        insert into specifications
        values (
			null, 3, 'S12', '256', '6.1', '3G', 184, (select SUBSTRING_INDEX(SUBSTRING_INDEX('black,white,yellow,purple', ',', i), ',', -1)), 150, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;


/*------------------------------------------------------------------sixbook pro*/

DELIMITER $$ 
CREATE PROCEDURE insertBookPro() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 2) DO 
        insert into specifications
        values (
			null, 4, 'SW1', '256', '13.3', 'Wi-Fi', 1300, (select SUBSTRING_INDEX(SUBSTRING_INDEX('silver,gray', ',', i), ',', -1)), 200, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE insertBookPro2() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 2) DO 
        insert into specifications
        values (
			null, 4, 'SW1', '512', '13.3', 'Wi-Fi', 1300, (select SUBSTRING_INDEX(SUBSTRING_INDEX('silver,gray', ',', i), ',', -1)), 230, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

/*------------------------------------------------------------------sixbook exp*/

DELIMITER $$ 
CREATE PROCEDURE insertBookExp() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 3) DO 
        insert into specifications
        values (
			null, 5, 'Core I3', '256', '13.3', 'Wi-Fi', 1200, (select SUBSTRING_INDEX(SUBSTRING_INDEX('silver,gray,gold', ',', i), ',', -1)), 180, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;


DELIMITER $$ 
CREATE PROCEDURE insertBookExp1() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 3) DO 
        insert into specifications
        values (
			null, 5, 'Core I3', '512', '13.3', 'Wi-Fi', 1200, (select SUBSTRING_INDEX(SUBSTRING_INDEX('silver,gray,gold', ',', i), ',', -1)), 180, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;


DELIMITER $$ 
CREATE PROCEDURE insertBookExp2() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 3) DO 
        insert into specifications
        values (
			null, 5, 'Core I5', '256', '13.3', 'Wi-Fi', 1200, (select SUBSTRING_INDEX(SUBSTRING_INDEX('silver,gray,gold', ',', i), ',', -1)), 200, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE insertBookExp3() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 3) DO 
        insert into specifications
        values (
			null, 5, 'Core I5', '512', '13.3', 'Wi-Fi', 1200, (select SUBSTRING_INDEX(SUBSTRING_INDEX('silver,gray,gold', ',', i), ',', -1)), 210, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE insertBookExp4() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 3) DO 
        insert into specifications
        values (
			null, 5, 'Core I7', '256', '13.3', 'Wi-Fi', 1200, (select SUBSTRING_INDEX(SUBSTRING_INDEX('silver,gray,gold', ',', i), ',', -1)), 230, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE insertBookExp5() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 3) DO 
        insert into specifications
        values (
			null, 5, 'Core I7', '512', '13.3', 'Wi-Fi', 1200, (select SUBSTRING_INDEX(SUBSTRING_INDEX('silver,gray,gold', ',', i), ',', -1)), 240, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

/*------------------------------------------------------------------sixbook light*/

DELIMITER $$ 
CREATE PROCEDURE insertBooklight() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 3) DO 
        insert into specifications
        values (
			null, 6, (select SUBSTRING_INDEX(SUBSTRING_INDEX('Core I3,Core I5,Core I7', ',', i), ',', -1)), '256', '5.5', 'Wi-Fi', 1300,'white', 50, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;


/*------------------------------------------------------------------sixtablet pro*/

DELIMITER $$ 
CREATE PROCEDURE insertTablePro() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 3) DO 
        insert into specifications
        values (
			null, 7, 'S8A', '32', '12.9', 'Wi-Fi', 713, (select SUBSTRING_INDEX(SUBSTRING_INDEX('silver,gray,gold', ',', i), ',', -1)), 90, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE insertTablePro2() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 3) DO 
        insert into specifications
        values (
			null, 7, 'S8A', '32', '12.9', '4G', 713, (select SUBSTRING_INDEX(SUBSTRING_INDEX('silver,gray,gold', ',', i), ',', -1)), 90, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE insertTablePro3() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 3) DO 
        insert into specifications
        values (
			null, 7, 'S8A', '128', '12.9', 'Wi-Fi', 713, (select SUBSTRING_INDEX(SUBSTRING_INDEX('silver,gray,gold', ',', i), ',', -1)), 100, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE insertTablePro4() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 3) DO 
        insert into specifications
        values (
			null, 7, 'S8A', '128', '12.9', '4G', 713, (select SUBSTRING_INDEX(SUBSTRING_INDEX('silver,gray,gold', ',', i), ',', -1)), 120, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;


/*------------------------------------------------------------------sixtable exp*/

DELIMITER $$ 
CREATE PROCEDURE insertTableExp() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 2) DO 
        insert into specifications
        values (
			null, 8, 'S7A', '16', '9.7', 'Wi-Fi',450, (select SUBSTRING_INDEX(SUBSTRING_INDEX('silver,gray', ',', i), ',', -1)), 50, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE insertTableExp2() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 2) DO 
        insert into specifications
        values (
			null, 8, 'S7A', '32', '9.7', 'Wi-Fi',450, (select SUBSTRING_INDEX(SUBSTRING_INDEX('silver,gray', ',', i), ',', -1)), 60, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

/*------------------------------------------------------------------sixtable light*/

DELIMITER $$ 
CREATE PROCEDURE insertTablelt() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 3) DO 
        insert into specifications
        values (
			null, 9, 'S5A', '16', '7.9', 'Wi-Fi', 312,(select SUBSTRING_INDEX(SUBSTRING_INDEX('black,gray,white', ',', i), ',', -1)), 40, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;


DELIMITER $$ 
CREATE PROCEDURE insertTablelt2() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 3) DO 
        insert into specifications
        values (
			null, 9, 'S5A', '32', '7.9', 'Wi-Fi', 312,(select SUBSTRING_INDEX(SUBSTRING_INDEX('black,gray,white', ',', i), ',', -1)), 50, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;


/*------------------------------------------------------------------sixwatch ser 3*/

DELIMITER $$ 
CREATE PROCEDURE insertWatch3() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 3) DO 
        insert into specifications
        values (
			null, 10, 'S7w', '1', '1.71', 'Wi-Fi',40,(select SUBSTRING_INDEX(SUBSTRING_INDEX('black,gray,white', ',', i), ',', -1)), 30, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE insertWatch32() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 3) DO 
        insert into specifications
        values (
			null, 10, 'S7w', '1', '1.71', '4G',40,(select SUBSTRING_INDEX(SUBSTRING_INDEX('black,gray,white', ',', i), ',', -1)), 50, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

/*------------------------------------------------------------------sixwatch ser 2*/

DELIMITER $$ 
CREATE PROCEDURE insertWatch2() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 3) DO 
        insert into specifications
        values (
			null, 11, 'S6w', '1', '1.6', 'Wi-Fi', 30,(select SUBSTRING_INDEX(SUBSTRING_INDEX('midnight,white,gold', ',', i), ',', -1)), 30, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE insertWatch22() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 3) DO 
        insert into specifications
        values (
			null, 11, 'S6w', '1', '1.6', '3G', 30,(select SUBSTRING_INDEX(SUBSTRING_INDEX('midnight,white,gold', ',', i), ',', -1)), 40, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;


/*------------------------------------------------------------------sixwatch ser 1*/


DELIMITER $$ 
CREATE PROCEDURE insertWatch1() 
BEGIN
    DECLARE i INT DEFAULT 1;  
    WHILE (i <= 3) DO 
        insert into specifications
        values (
			null, 12, 'S5w', '1', '1.5', 'Wi-Fi', 30, (select SUBSTRING_INDEX(SUBSTRING_INDEX('gray,white,gold', ',', i), ',', -1)), 20, 10
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

/*--------------------------------------------------------------------*/

delete from specifications where spec_id >= 37;
select * from specifications;
select * from models;
select * from products;
drop procedure insertTableExp2;
alter table specifications auto_increment = 37;

call insertProducts();
call insertModels();

call insertPhone1();

call insertPhone2();
call insertPhone21();
call insertPhone22();
call insertPhone23();

call insertPhone3();
call insertPhone31();

call insertBookPro();
call insertBookPro2();

call insertBookExp();
call insertBookExp2();
call insertBookExp3();
call insertBookExp4();
call insertBookExp5();

call insertBooklight();

call insertTablePro();
call insertTablePro2();
call insertTablePro3();
call insertTablePro4();

call insertTableExp();
call insertTableExp2();

call insertTablelt();
call insertTablelt2();

call insertWatch3();
call insertWatch32();

call insertWatch2();
call insertWatch22();

call insertWatch1();
commit;