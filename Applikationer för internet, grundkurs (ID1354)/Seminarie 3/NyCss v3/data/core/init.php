<?php
//Requires Config.php which contains a global url.
require_once $_SERVER['DOCUMENT_ROOT'] . '/Config.php';
session_start();
//include alla namespaces i this file
use Model\User;
use Integration\Config;
use Util\Cookie;
use Util\Session;
use Integration\DB;
use Util\Hash;
use Util\Input;
use Util\Validate;
use Util\Token;
use Util\Redirect;


$GLOBALS['config'] = array(
    'mysql' => array(
        'host' => 'localhost',
        'username' => 'user',
        'password' => 'test',
        'db' => 'happytilapia'
    ),
    'remember' => array(
        'cookie_name' => 'hash',
        'cookie_expiry' => 604800
    ),
    'session' => array(
        'session_name' => 'user',
        'token_name' => 'token'
    )
);

spl_autoload_register(function ($class) {
            require_once URL .'/data/classes/' . \str_replace('\\', '/', $class) . '.php';
        });

        require_once URL . '/data/functions/sanitize.php';

if(Cookie::exists(Config::get('remember/cookie_name')) && !Session::exists(Config::get('session/session_name'))){
  $hash = Cookie::get(Config::get('remember/cookie_name'));
  $hashCheck = DB::getInstance()->get('users_session', array('hash', '=', $hash));
  
  if($hashCheck->count()){
      $user = new User($hashCheck->first()->user_id);
      $user->login();
  }
}

