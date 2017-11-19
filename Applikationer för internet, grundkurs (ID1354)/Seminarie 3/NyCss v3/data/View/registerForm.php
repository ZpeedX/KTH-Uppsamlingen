<!--A simple login form used in login page-->
<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/Config.php';
require_once URL . '/data/core/init.php';

use Util\Input;
use Util\Token;
?>

 <div id="loginDesign">
<form action="/data/register.php" method="post">
    <div class="field">
        <label for="username">Username</label>
        <input type="text" name="username" id ="username" value="<?php echo escape(Input::get('username'));?>" autocomplete="off">
    </div>
    
    <div class="field">
        <label for="password">Choose a password</label>
        <input type="password" name="password" id="password">
    </div>
    
    <div class="field">
        <label for="password_again">Enter your password again</label>
        <input type="password" name="password_again" id="password_again">
    </div>
    
    <div class="field">
        <label for="name">Enter your name</label>
        <input type="text" name="name" value="<?php echo escape(Input::get('name'));?>" id="name">
    </div>
    <input type="hidden" name="token" value="<?php echo Token::generate(); ?>">
    <input type="submit" value="Register">
</form>
 </div>



            