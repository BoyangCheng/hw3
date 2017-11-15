delimiter //
DROP PROCEDURE IF EXISTS AllPercentages //
CREATE procedure AllPercentages(IN this_password varchar(15))

BEGIN
Declare exit handler for 1318 Select "Please input the password" as "ErrorMessage";
BEGIN


 if exists(select * from Passwords where CurPasswords=this_password)
then
SELECT Fname,Lname,Section,Rawscores.HW1/C.HW1*100 as hw1,Rawscores.HW2a/C.HW2a*100 as hw2a,Rawscores.HW2b/C.HW2b*100 as hw2b,
Rawscores.midterm/C.midterm*100 as midterm,Rawscores.HW3/C.HW3*100 as hw3,Rawscores.Fexam/C.Fexam*100 as fexam
FROM Rawscores,
(
SELECT hw1,hw2a,hw2b,midterm,hw3,fexam
from Rawscores
WHERE ssn='0001'
) as C
WHERE SSN!='0001' and SSN!='0002'
order by section;

SELECT CONCAT('The cumulative course average for ',fname,' ',lname,' is ',A.hw1*B.hw1+A.hw2a*B.hw2a+A.hw2b*B.hw2b+A.hw3*B.hw3
+A.midterm*B.midterm+A.fexam*B.fexam)as cumavg
FROM
(
SELECT hw1,hw2a,hw2b,midterm,hw3,fexam
from Rawscores
WHERE ssn='0002'
) as B,
(
SELECT Fname,Lname,section,Rawscores.HW1/C.HW1*100 as hw1,Rawscores.HW2a/C.HW2a*100 as hw2a,Rawscores.HW2b/C.HW2b*100 as hw2b,
Rawscores.midterm/C.midterm*100 as midterm,Rawscores.HW3/C.HW3*100 as hw3,Rawscores.Fexam/C.Fexam*100 as fexam
FROM Rawscores,
(
SELECT hw1,hw2a,hw2b,midterm,hw3,fexam
from Rawscores
WHERE ssn='0001'
) as C
WHERE SSN!='0001' AND SSN!='0002'
order by section
) as A
;
else
	select 'ACCESS DENIED' as 'RESULT';
end if;
END;
END//
delimiter ;
