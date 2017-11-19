<?php
namespace Util;

/*This class is to provide stronger security for the site 
 * make - For making Hashes
 * salt - improves the security of a pasword hash. Salt provides a randomly generated secure string  
 *          of data unto the end of a password.  (password + salt = Hash) 
 * unique  - Generating unique Hashes
 */




class Hash{
    public static function make($string, $salt = ''){
        return hash('sha256', $string . $salt); //
    }
    
    public static function salt($length){
        return mcrypt_create_iv($length);// provinding a combination fo characters to strengthen password hash (stronger salt)
    }
    
    //generating unique Hashes
    public static function unique(){
      return self::make(uniqid());  
    }
}


