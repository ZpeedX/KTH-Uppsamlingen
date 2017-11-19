<?php
namespace Util;

/*This class has two functions: 1) checks whether data/input exisits.
 *                                          2) Getting/Retrieving data
 */

class Input{
    public static function exists($type = 'post'){
        switch($type){
            case 'post':
                return(!empty($_POST)) ? true : false;
                break;
            case 'get':
                return(!empty($_GET)) ? true : false;
                break;
            default:
                return false;
                break;
        }
    }
    public static function get($item){
        $items = mysql_real_escape_string($item);
        if(isset($_POST[$items])){
            return $_POST[$items];
        } else if(isset($_GET[$items])){
            return $_GET[$items];
        }
        return '';
    }
}

