<?php
    require_once $_SERVER['DOCUMENT_ROOT'] . '/Config.php';
    require_once URL . '/data/core/init.php';
    
use Model\User;
use Util\Validate;
use Util\Token;
use Util\Input;
use Util\Hash;

$user = new User;

if(Input::exists()){
    if(Token::check(Input::get('token'))){
        $validate = new Validate();
        $validation = $validate->check($_POST, array(
            'username' => array(
                'required' => true,
                'min' => 2,
                'max' => 20,
                'unique' => 'users',
                'string' => true
            ),
            'password' => array(
                'required' => true,
                'min' => 6
            ),
            'password_again' => array(
                'matches' => 'password'
            ),
            'name' => array(
                'required' => true,
                'min' => 2,
                'max' => 50
            )
        ));
        if ($validation->passed()) {
            $user = new User();
            $salt = Hash::salt(32);
            try{
                $user->create(array(
                    'username'  => Input::get('username'),
                    'password'  => Hash::make(Input::get('password'), $salt),
                    'salt'      => $salt,
                    'name'      => Input::get('name'),
                    'joined'    => date('Y-m-d H:i:s'),
                    'groups'    => 1
                ));
                
                
                include_once $_SESSION['currentPage'];
                
            }catch (Exception $e){
                die($e->getMessage());
            }
    } else{
        include $DIR . '/data/View/registerPage.php';
      foreach($validation->errors() as $error){
         echo $error, '<br>';
      }  
   } 
   } 
}
else 
    Redirect::to(404);





