
delimiter //
DROP PROCEDURE IF EXISTS changeMidterm //
CREATE procedure changeMidterm(IN this_password varchar(15),IN this_SSN INT,IN this_midterm INT)

BEGIN
 if this_SSN!=0001 and this_SSN!=0002 AND exists(select * from Rawscores where ssn=this_ssn) AND exists(select * from Passwords where this_password=CurPasswords)
then 
   UPDATE Rawscores
   SET midterm=this_midterm
   WHERE SSN=this_SSN;
   SELECT 'UPDATE SUCCESSFUL' AS 'RESULT';
else
	select 'UPDATE FAILED' as 'RESULT';
end if;

END//
delimiter ;