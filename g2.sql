delimiter //
DROP PROCEDURE IF EXISTS AllRawScores //
CREATE procedure AllRawScores(IN this_password varchar(15)
)

BEGIN
 if exists(select * from Passwords where CurPasswords=this_password)
then 
   select * from Rawscores Where ssn!='0001' AND ssn!='0002' order by Section,Lname,Fname ;
else
	select 'ACCESS DENIED' as 'RESULT';
end if;

END//
delimiter ;