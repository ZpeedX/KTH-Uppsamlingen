<?php
session_start();
 // Includes a saved page which is the previous page.
include $_SESSION['currentPage'];

?>
<!doctype html>
<html>
<head>
<body>
 <!--A simple edit form which contains the correct comment taken from the database to be edited by the user-->
<form action ="../../php/php/Edit.php?id=<?php echo$_GET['id'] ?>" method="POST">
        <table>
            <tr><td colspan="2">Comment: </td></tr>
            <tr><td colspan="2"><textarea name ="edit"><?php  echo$editComment ?></textarea></td></tr>
            <tr><td colspan="2"><input type="submit" name="submit" value="Edit"/></td></tr>
        </table>
    </form>
 
</body>
</head>
</html>