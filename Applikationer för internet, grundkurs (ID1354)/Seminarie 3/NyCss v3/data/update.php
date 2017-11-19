<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/Config.php';
require_once URL . '/data/core/init.php';

use Model\User;
use Util\Input;
use Util\Token;
use Util\Redirect;
use Integration\DB;
use Util\Session;
use Util\Validate;

$user = new User();

if(!$user->isLoggedIn()){
    include $_SESSION['currentPage'];
}

if(Input::exists()){
    if(Token::check(Input::get('token'))){
        
        $validate = new Validate();
        $validation = $validate->check($_POST, array(
            'edit' => array(
                'required'=> true,
            )
        ));
        
        if($validation->passed()){ 
            try {
                DB::getInstance()-> update('comments', $_GET['id'] ,array(
                    'comment' => Input::get('edit')));
                
                
                include $_SESSION['currentPage'];
                Session::flash('home', 'Your comment have been updated!');
            } catch (Exception $e) {
               die($e->getMessage());
            }
            
        } else {
            foreach($validation->errors() as $error){
                echo $error, '<br>';
            }
        }
    }
}
else
    include $_SESSION['currentPage'];
?>
