<?php
    $count_file = 'counter.txt';
    $ip_file = 'ip.txt';
    $cookie_name = 'chocolateChip';
    
    if(!file_exists($count_file)){ fopen($count_file, 'w'); }
    if(!file_exists($ip_file)){ fopen($ip_file, 'w'); }
    
    function count_views(){
        global $count_file, $ip_file, $cookie_name;
        $ip = $_SERVER['REMOTE_ADDR'];
        
        if(!in_array($ip, file($ip_file, FILE_IGNORE_NEW_LINES)) && !isset($_COOKIE[$cookie_name])){
            setcookie($cookie_name, "visited", time() + (86400 * 30), "/"); 
            $hit = (file_exists($count_file)) ? file_get_contents($count_file) : 0;
            
            file_put_contents($ip_file, $ip."\n", FILE_APPEND);
            file_put_contents($count_file, ++$hit);
        }
    };
    count_views();

    $myfile = fopen($count_file , "r") or die("Unable to open file!");
    echo fread($myfile,filesize($count_file));
    fclose($myfile);
?>