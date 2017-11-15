 <head>
  <title>List All Students</title>
 </head>
 <body>



 <?php
// PHP code just started

ini_set('error_reporting', E_ALL);
ini_set('display_errors', true);
// display errors

$db = mysqli_connect("dbase.cs.jhu.edu", "boyangcheng", "zdnvhqmckx");
// ********* Remember to use your MySQL username and password here ********* //

if (!$db) {

  echo "Connection failed!";

} else {

	$password = $_POST['Password'];
	
  // This says that the $ID variable should be assigned a value obtained as an
  // input to the PHP code. In this case, the input is called 'ID'.

  mysqli_select_db($db,"cs41517_boyangcheng_db");
  // ********* Remember to use the name of your database here ********* //

  mysqli_multi_query($db,"CALL AllRawScores('$password')");
  $result=mysqli_store_result($db);
  // a simple query on the Student table

  if (!$result) {

    echo "Query failed!\n";
    print mysqli_error($db);

  } else {

		$myrow = mysqli_fetch_array($result);
		if(sizeof($myrow)!=2)
		{
        echo "<table border=1>\n";
		echo "<tr><td>SSN</td><td>FName</td><td>LName</td><td>Section</td><td>hw1</td><td>hw2a</td><td>hw2b</td><td>midterm</td><td>hw3</td><td>fexam</td></tr>\n";

		DO
		{
			
			printf("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>\n",$myrow["SSN"],$myrow["FName"],$myrow["LName"], $myrow["Section"],$myrow["HW1"],$myrow["HW2a"],$myrow["HW2b"],$myrow["Midterm"],$myrow["HW3"],$myrow["FExam"]);
		}while($myrow = mysqli_fetch_array($result)); 
		echo "</table>\n";
		}
		else
		{
			 echo "<table border=1>\n";
		echo "<tr><td>result</td></tr>\n";			
			printf("<tr><td>%s</td></tr>\n",$myrow["RESULT"]);
		echo "</table>\n";
		}
		} 
}
			
   

 



// PHP code about to end

 ?>



 </body>