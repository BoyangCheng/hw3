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
	$SSN = $_POST['SSN'];
	$password = $_POST['Password'];
	$midterm = $_POST['Midterm'];
  // This says that the $ID variable should be assigned a value obtained as an
  // input to the PHP code. In this case, the input is called 'ID'.

  mysqli_select_db($db,"cs41517_boyangcheng_db");
  // ********* Remember to use the name of your database here ********* //

  mysqli_multi_query($db,"CALL changeMidterm('$password','$SSN','$midterm')");
  $result=mysqli_store_result($db);
  // a simple query on the Student table

  if (!$result) {

    echo "Query failed!\n";
    print mysqli_error($db);

  } else {

	
        echo "<table border=1>\n";
		echo "<tr><td>message</td><</tr>\n";

		while ($myrow = mysqli_fetch_array($result)) 
		{
			printf("<tr><td>%s</td></tr>\n",$myrow["RESULT"]);
		}
		echo "</table>\n";
 		
		} 
			
	}
   

 



// PHP code about to end

 ?>



 </body>