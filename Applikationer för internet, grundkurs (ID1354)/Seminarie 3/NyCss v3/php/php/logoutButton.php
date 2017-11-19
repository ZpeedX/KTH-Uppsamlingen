<!--login button with welcome text to the current user-->    
<div id="login">          
        <nav>
           
  <ul>
      <?php echo 'Welcome '. $_SESSION['CurrentUser']; ?>
      <li><a href="../../php/php/logout.php">Logout</a></li>
            

</ul>
</nav>
          </div>

