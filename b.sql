
delimiter //
DROP PROCEDURE IF EXISTS ShowPercentage //
CREATE procedure ShowPercentage (IN this_SSN INT)

BEGIN
 if(this_SSN!=0001 and this_SSN!=0002 AND exists(select * from Rawscores where ssn=this_ssn))
then 
   SELECT Fname,Lname,Rawscores.HW1/C.HW1*100 as hw1,Rawscores.HW2a/C.HW2a*100 as hw2a,Rawscores.HW2b/C.HW2b*100 as hw2b,
   Rawscores.midterm/C.midterm*100 as midterm,Rawscores.HW3/C.HW3*100 as hw3,Rawscores.Fexam/C.Fexam*100 as fexam
   FROM Rawscores,
   (
   SELECT hw1,hw2a,hw2b,midterm,hw3,fexam
   from Rawscores
   WHERE ssn='0001'
   ) as C
   WHERE SSN=this_SSN
   ;
   
   SELECT CONCAT('The cumulative course average for ',fname,' ',lname,' is ',A.hw1*B.hw1+A.hw2a*B.hw2a+A.hw2b*B.hw2b+A.hw3*B.hw3
   +A.midterm*B.midterm+A.fexam*B.fexam)as cumavg
   FROM 
   (
   SELECT hw1,hw2a,hw2b,midterm,hw3,fexam
   from Rawscores
   WHERE ssn='0002'
   ) as B,
   (
   SELECT Fname,Lname,Rawscores.HW1/C.HW1*100 as hw1,Rawscores.HW2a/C.HW2a*100 as hw2a,Rawscores.HW2b/C.HW2b*100 as hw2b,
   Rawscores.midterm/C.midterm*100 as midterm,Rawscores.HW3/C.HW3*100 as hw3,Rawscores.Fexam/C.Fexam*100 as fexam
   FROM Rawscores,
   (
   SELECT hw1,hw2a,hw2b,midterm,hw3,fexam
   from Rawscores
   WHERE ssn='0001'
   ) as C
   WHERE SSN=this_SSN
   ) as A;
  else
	select 'error' as 'error' ;
  end if;
END//
delimiter ;