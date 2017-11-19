<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/Config.php';
require_once URL . '/data/core/init.php';
 // Includes a saved page which is the previous page.
use Util\Token;
include $_SESSION['currentPage'];

?>
<!doctype html>
<html>
<head>
<body>
 <!--A simple edit form which contains the correct comment taken from the database to be edited by the user-->
<form action ="/data/update.php?id=<?php echo $_GET['id']; ?>" method="POST">
        <table>
            <tr><td colspan="2">Comment: </td></tr>
            <tr><td colspan="2"><textarea name ="edit"><?php  echo$editComment; ?></textarea></td></tr>
            <tr><td colspan="2"><input type="submit" name="submit" value="Edit"/></td></tr>
             <input type="hidden" name="token" value="<?php echo Token::generate();?>">
        </table>
    </form>
 
</body>
</head>
</html>