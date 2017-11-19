
<?php
if(!isset($_SESSION['CurrentUser'])){
    session_start();
}
$_SESSION['currentPage'] = __FILE__;


?>

<!doctype html>
<html>
<head>
    <title>Meatballs and Potatoes</title>
	
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
		<h1>Meatballs and Potatoes</h1>
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
	<h2>Ingredients for 4 servings</h2>
		<ul>
			<li>2 cups refrigerated potato wedges (from 1 lb. 4-oz. pkg.)</li>
			<li>1 (10 3/4-oz.) can condensed cream of onion soup</li>
			<li>1⁄4 cup water</li>
			<li>2 cups Green Giant Select™ Frozen Broccoli Florets (from 1-lb. pkg.)</li>
			<li>24 frozen cooked meatballs (about 12 oz.), thawed</li>
			<li>1⁄4 cup sour cream</li>
				
		</ul> 
		</div>
	<div id="left">
	<h3>Meatballs and Potatoes Recipe</h3>
	
 <img src="../../Images/Dinner/potatoes.jpg" alt="Meatballs and Potatoes"/>
	</div>
	<div id="undertext">
	<h4>Instructions</h4>
	<p> 1.  In 12-inch nonstick skillet, combine potatoes, soup and water; stir gently to mix.
	Bring to a boil.</p>
	<p> 2. Reduce heat to low; simmer 5 minutes, stirring occasionally.</p>
	<p> 3.  Stir in broccoli and meatballs; simmer 10 to 15 minutes or 
	until broccoli and potatoes are tender, stirring occasionally.</p>
	<p> 4. Stir in sour cream; cook just until thoroughly heated, stirring occasionally.</p>
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