<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"       
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">       
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">       
  <head>       
    <title>Today&rsquo;s Date</title>       
    <meta http-equiv="content-type"       
        content="text/html; charset=utf-8"/>       
  </head>       
  <body>       
    <p>Today&rsquo;s date (according to this web server) is       
      <?php       
       
      echo date('l, F dS Y.');       
       
      ?>       
    </p> 
    <p>
        TESTING PHP TO MYSQL <br>

        <?php
        echo "TESTING CONNECTION: ";
        $conn = pg_connect("host=babar.elephantsql.com port=5432 dbname=kkpuzfit user=kkpuzfit password=vBKe6iIQadSuja87JjfjbED43aevUEHE") or die('------could not connect!!------' . pg_last_error());
        echo "SUCCESS";

        // $query = "SELECT * FROM PUBLIC.EMPLOYEE;";
        // $result = pg_query($conn, $query);
        echo "<br/>";
        $result = pg_exec($conn, "SELECT * FROM PUBLIC.EMPLOYEE");
        $numrows = pg_numrows($result);
        echo "<p>conn = $conn<br> result = $result<br> numrows = $numrows</p>";
        ?>

        <table border="1">
        <tr>
         <th>First name</th>
         <th>Last name</th>
         <th>ID</th>
        </tr>

        <?php
         for($ri = 0; $ri < $numrows; $ri++) {
          echo "<tr>\n";
          $row = pg_fetch_array($result, $ri);
          echo " <td>", $row["f_name"], "</td>
         <td>", $row["l_name"], "</td>
         <td>", $row["uuid"], "</td>
        </tr>";
         }
         pg_close($conn);
        ?>
    </p>      
  </body>       
</html>