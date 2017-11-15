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
  // This says that the $ID variable should be assigned a value obtained as an
  // input to the PHP code. In this case, the input is called 'ID'.

  mysqli_select_db($db,"cs41517_boyangcheng_db");
  // ********* Remember to use the name of your database here ********* //

  $result = mysqli_query($db,"CALL ShowPercentage('$SSN')");
  // a simple query on the Student table

  if (!$result) {

    echo "Query failed!\n";
    print mysqli_error($db);

  } else {

    echo "<table border=1>\n";
    echo "<tr><td>FName</td><td>LName</td><td>hw1</td><td>hw2a</td><td>hw2b</td><td>midterm</td><td>hw3</td><td>fexam</td><td>cumavg</td></tr>\n";

    while ($myrow = mysqli_fetch_array($result)) {
      printf("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>\n",$myrow["Fname"], $myrow["Lname"],$myrow["hw1"],$myrow["hw2a"],$myrow["hw2b"],$myrow["midterm"],$myrow["hw3"],$myrow["fexam"],$myrow["cumavg"]);
	  if($myrow["cumavg"])
	  printf("<tr><td>%s</td></tr>\n",$myrow["cumavg"]);
    }

    echo "</table>\n";

  }

}

// PHP code about to end

 ?>



 </body>