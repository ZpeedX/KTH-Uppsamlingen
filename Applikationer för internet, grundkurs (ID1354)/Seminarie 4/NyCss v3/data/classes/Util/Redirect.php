<?php
namespace Util;

/* Redirecting the user to a desired page.  First, checks if location is found 
 * else user is redirected to  an error page
 */

class Redirect{
    public static function to($location = null){
        if($location){
            if(is_numeric($location)){
                switch($location){
                    case 404:
                        header('HTTP/1.0 404 Not Found');
                        include 'includes/error/404.php';
                        exit();
                        break;
                }
            }
            header('Location:' . $location);
            exit();
        }
    }
}

