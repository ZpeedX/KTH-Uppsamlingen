 <!--A simple comment form-->
<?php
use Util\Token;
?>
 <form action ="/data/commentBox.php" method="POST">
 

    <div class="field">         
 <textarea name ="comment" rows="8" cols="100"></textarea>
    </div>
        <div class="field"> 
            <div id="login">
<input type="submit" name="submit" value="comment"/>
            </div>
 <input type="hidden" name="token" value="<?php echo Token::generate();?>">
        </div>
  
    
    </form>
