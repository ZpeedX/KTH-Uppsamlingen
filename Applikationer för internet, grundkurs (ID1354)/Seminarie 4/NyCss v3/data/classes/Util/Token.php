<?php
namespace Util;
use Integration\Config;
use Util\Session;

/*Helps prevent CSRF like ability to define parameters in the url. This class ensures that only data from forms
 * can be posted to the backend. Token is generated at the bottom of each form
 * A new token is generated with each refresh of the page which only that page knows.
 * This prevents another user from elsewhere will not be able to be directed at that page
 */

class Token{
 public static function generate(){
        return Session::put(Config::get('session/token_name'), md5(uniqid()));
    }
    
    public static function check($token){
        $tokenName = Config::get('session/token_name');
        
        if(Session::exists($tokenName) && $token === Session::get($tokenName)){
            Session::delete($tokenName);
            return true;
        }
        return false;
    }
}

