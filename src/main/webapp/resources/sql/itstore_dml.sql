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

/*---------------------------------------------------------------------------------------*/

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

/*------------------------------------------------------------------*/


delete from specifications;
select * from specifications;
drop procedure insertPhone1;
alter table specifications auto_increment = 1;

call insertProducts();
call insertModels();
call insertPhone1();

call insertPhone2();
call insertPhone21();
call insertPhone22();
call insertPhone23();

commit;