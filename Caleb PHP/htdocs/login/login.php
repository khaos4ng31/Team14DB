<!--needs to be redesigned to include $_POST instead of $_GET for security! -->


<html>
<body>
<?php
$user = $_GET["uname"];
$psw = $_GET["psw"];

?>

Welcome: <?php echo $user; ?> <br>
Password Entered: <?php echo $psw; ?> <br>

<?php
        echo "TESTING CONNECTION TO DB: ";
        $conn = pg_connect("host=babar.elephantsql.com port=5432 dbname=kkpuzfit user=kkpuzfit password=vBKe6iIQadSuja87JjfjbED43aevUEHE") or die('------could not connect!!------' . pg_last_error());
        echo "SUCCESS";

        echo "<br/>";
        $result = pg_exec($conn, "SELECT * FROM PUBLIC.EMPLOYEE");
        $numrows = pg_numrows($result);
        //We will need to come up with a table with usernames/pw in order to validate
        //the logins, or we can simply hardcode the logins into the html files and
        //direct each user to the appropriate linked page for admins por users. 
        //This is exceptionally unsecure, but it will be functional for the purposes
        //of the project
        ?>

</body>
</html>