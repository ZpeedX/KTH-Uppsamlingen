<!--A simple login form used in login page-->
<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/Config.php';
require_once URL . '/data/core/init.php';

use Util\Token;

?>

  <div id="loginDesign">
      <form action="/data/login.php" method="post">
  
    <div class="field">
        <label for="username">Username</label>
        <input type="text" name="username" id="username" autocomplete="off">
    </div>

    <div class="field">
        <label for="password">Password</label>
        <input type="password" name="password" id="password" autocomplete="off">
    </div>
    
    <div class="field">
        <label for="remember">
        <input type="checkbox" name="remember" id="remember"> Remember me
        </label>
    </div>

        <input type="hidden" name="token" value="<?php echo Token::generate();?>">
         <input type="submit" value="Log in">
         
</form>
      </div>



            