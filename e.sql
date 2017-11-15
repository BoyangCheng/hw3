
delimiter //
DROP PROCEDURE IF EXISTS changeScore //
CREATE procedure changeScore(IN this_password varchar(15),IN this_SSN INT,IN assignmentName varchar(15),IN newScore INT)

BEGIN
 if this_SSN!=0001 and this_SSN!=0002 AND exists(select * from Rawscores where ssn=this_ssn) AND exists(select * from Passwords where this_password=CurPasswords)
then
  if assignmentName='HW1'
  then
   UPDATE Rawscores
   SET hw1=newScore
   WHERE SSN=this_SSN;
   elseif assignmentName='HW2a'
   then
    UPDATE Rawscores
    SET hw2a=newScore
    WHERE SSN=this_SSN;
    elseif assignmentName='HW2b'
    then
     UPDATE Rawscores
     SET hw2b=newScore
     WHERE SSN=this_SSN;
     elseif assignmentName='HW3'
     then
      UPDATE Rawscores
      SET hw3=newScore
      WHERE SSN=this_SSN;
      else select 'UPDATE FAILED' as 'RESULT';
      end if;
      else
	     select 'UPDATE FAILED' as 'RESULT';

end if;

END//
delimiter ;
