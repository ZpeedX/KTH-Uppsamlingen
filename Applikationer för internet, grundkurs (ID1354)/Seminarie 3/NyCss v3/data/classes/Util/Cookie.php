<?php
namespace Util;

/*Store information about the userand their visits on their local PC. 
 * Checking if remember me functions, generating hashes, and storing cookies.
 * 
 */ 

class Cookie {
    
    public static function exists($name){
        return (isset($_COOKIE[$name])) ? true : false;
    }
    
    public static function get($name){
        return $_COOKIE[$name];
    }
    
    public static function put($name, $value, $expiry){
        if(setcookie($name, $value, time() + $expiry, '/')){
            return true;
        }
        return false;
    }
    
    public static function delete($name){
        self::put($name, '', time() - 1);
   }
}

