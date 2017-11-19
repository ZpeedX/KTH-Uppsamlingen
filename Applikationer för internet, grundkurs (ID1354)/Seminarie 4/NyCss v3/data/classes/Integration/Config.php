<?php

namespace Integration;
/*This class is to help us draw any desired option from the config created in init.php.
 * A config is defined in init.php. Helps in the ease of accessing the global array in init.php.
 */


/*We begin by defining a $Path set to null to check if it has been passed to this method.
 * Next, we define a variable $config to define where the config is coming from.
 * Path will be the typed passed in.
 * Explode helps return an array.
 * We then loop through the pieces
 * Checking if MySQL is inside config and then return it.
 * Then check Whether host is inside config.
 */
class Config{
    public static function get($path = null){
        if($path){
            $config = $GLOBALS['config'];
            $path = explode('/', $path);
            
            foreach($path as $bit){
               if(isset($config[$bit])){
                   $config = $config[$bit]; 
               } 
            }
            return $config; // 
        }
        return false;
    }
}

