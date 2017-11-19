<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/Config.php';
require_once URL . '/data/core/init.php';
use Model\User;
use Util\Input;



$user=new User;
$username=  Input::get('username');
if(!$username==''){
     if(strlen($username) < 2)
    echo 'Too Short!';
    else if(strlen($username) > 51)
    echo 'Too Long!';
    else{
$check = $user->available($username);

if($check == true)
    echo 'Username is not available';

else
    echo 'Username is available';
    }
}

else
     echo "Choose a username";

 ?>


