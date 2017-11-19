<?php
//Start a session if a session is not currently active.
require_once $_SERVER['DOCUMENT_ROOT'] . '/Config.php';
require_once URL . '/data/core/init.php';

?>
<!-- login page -->
<!doctype html>
<html>
<head>
    <title>Register</title>
	
	<meta charset="utf-8" />
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="/index/mobile.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 0px) and (max-width: 320px)">
	<link href="/index/pad.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 321px) and (max-width: 768px)">
	<link href="/index/screen.css" rel="stylesheet" type="text/css" media="only screen and (min-width:769px)">
        

	</head>
	<body>
	
	<div id="container">
			<div id="topbar">
			
		<!--Creating a fixed portion which adjusts to browser widow width-->
		<!--Making it a class so we can re use-->
				
			<div class="fixedwidth">
			<div id="logodiv">
			
				<a href="../../index.html"><img src="../../Images/logo.png" alt="Happy Tilapia"/></a>
                                
                            
 			</div>
			</div>
                
	
		<div id="topmenu">
		<h1>Register</h1>
                
		</div>   
                
	</div>
            
</div>
		
<header>
<nav>
  <ul>
	<li><a href="../../index.html">Recipes</a>
	<ul>
		<li><a href="../../breakfast.html">Breakfast</a></li>
		<li><a href="../../lunch.html">Lunch</a></li>
		<li><a href="../../dinner.html">Dinner</a></li>
		
	</ul>
	</li>
	<li><a href="../../calendar.html">Calendar</a></li>
    <li><a href="../../contact.html">Contact Us</a></li>
	
</ul>
</nav>
</header>
               <div id="loginForm">
                   <?php
                   include URL . '/data/View/registerForm.php';

                   ?>
              </div>
	</body>
	
	</html>