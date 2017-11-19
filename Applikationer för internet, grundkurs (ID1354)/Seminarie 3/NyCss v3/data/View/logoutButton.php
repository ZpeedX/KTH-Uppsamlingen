<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/Config.php';
require_once URL . '/data/core/init.php';
 use Model\User;
$user = new User();
?>

<!--login button with welcome text to the current user-->    
<div id="login">          
        <nav>
           
  <ul>
      <?php echo 'Welcome '. escape($user->data()->username); ?>
      <li><a href="/data/logout.php">Logout</a></li>
            

</ul>
</nav>
          </div>

