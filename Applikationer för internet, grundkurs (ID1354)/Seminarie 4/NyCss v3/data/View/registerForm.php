<!--A simple login form used in login page-->
<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/Config.php';
require_once URL . '/data/core/init.php';

use Util\Input;
use Util\Token;
?>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script  type="text/javascript">


$(document).ready(function() { //start function when doc. is ready
    $('#feedback').load('check.php').show();//using jquery to load content from check.php into div
    $('#username').keyup(function(){
        
        $.post('check.php', {username:form.username.value },//using post function in JQuery to post data to checK.php and give its results 
        function(result) {
            
            $('#feedback').html(result).show();
        });
        
    });
    
});

</script>
 <div id="loginDesign">
<form action="/data/register.php" method="post" name="form">
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

    <div id="feedback"></div>
    



            