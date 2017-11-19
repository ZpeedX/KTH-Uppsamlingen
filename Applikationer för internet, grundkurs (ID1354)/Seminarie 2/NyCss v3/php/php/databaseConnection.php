
<?php
//Connects to MySQL database with given name and password.
    $connection = mysql_connect("localhost","root","","happytilapia") or die(mysql_error());
     mysql_select_db("happytilapia", $connection);
    ?>