
<?php
if(!isset($_SESSION['CurrentUser'])){
    session_start();
}
$_SESSION['currentPage'] = __FILE__;


?>
<!doctype html>
<html>
<head>
    <title>Mango Smoothie</title>
	
	<meta charset="utf-8" />
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="../../index/mobile.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 0px) and (max-width: 320px)">
	<link href="../../index/pad.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 321px) and (max-width: 768px)">
	<link href="../../index/screen.css" rel="stylesheet" type="text/css" media="only screen and (min-width:769px)">

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
		<h1>Mango Smoothie</h1>
		</div>
                  <div id="login">   
           <?php
           
		   if(isset($_SESSION['CurrentUser']))
		   {
			   include "../../php/php/logoutButton.php";
                           
		   }
		   else
		   {
			   include "../../php/php/loginButton.php";
		   }

			?>
                    
                     
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
	
	<div id="globalImg">
	<div id="right">
	<h2>Ingredients for 1 bootle</h2>
		<ul>
			<li>1 cup chopped ripe mango</li>
			<li>1⁄2 cup low-fat milk</li>
			<li>1⁄2 cup ice</li>
			<li>1 cup plain low-fat yogurt</li>

		</ul>  
	</div>
	<div id="left">
	<h3>Mango Smoothie Recipe</h3>
	
 <img src="../../Images/breakfast/mangosmoothie.jpg" alt="Mango Smoothie"/>
	</div>
	<div id="undertext">
	<h4>Instructions</h4>
	<p> 1. Place the mango, milk, ice, yogurt, and honey in a blender.</p>
	<p> 2. Blend until smooth and frothy.</p>

	</div>
	
	<div id="comments">
         <div id="comments">
	<h4>Comments</h4>
	<hr>
	<div id="box">
            
            <?php
            include '../../php/php/commentFunction.php';
                    
             ?>
        </div>
	</div>
	</div>
	</div>
	</body>
	
	</html>