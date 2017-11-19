 
       <?php
//End session when logout button is clicked and include(go to) previous page. 
       session_start();
       $save=$_SESSION['currentPage'];
       session_unset();
       session_destroy();
       unset($_SESSION);
       include $save;
          ?>
