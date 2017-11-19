<?php
if(!isset($_SESSION['CurrentUser'])){
    session_start();
}
$_SESSION['currentPage'] = __FILE__;


?>
<!doctype html>
<html>
<head>
    <title>Taco Roll</title>
	
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
		<h1>Taco Roll</h1>
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
		<li><a href="../../breakfast.php">Breakfast</a></li>
		<li><a href="../../lunch.php">Lunch</a></li>
		<li><a href="../../dinner.php">Dinner</a></li>
		
	</ul>
	</li>
	<li><a href="../../calendar.html">Calendar</a></li>
    <li><a href="../../contact.html">Contact Us</a></li>
	
</ul>
</nav>
</header>
	
	
	<div id="globalImg">
	<div id="right">
	<h2>Ingredients for 4 to 6 servings</h2>
		<ul>
			<li>1 lb lean ground beef</li>
			<li>1 (1 & 1⁄4 ounce) package taco seasoning mix</li>
			<li>1 cup shredded cheddar cheese (4 ounces)</li>
			<li>2 tablespoons water</li>
			<li>2 (8 ounce) packages refrigerated crescent dinner rolls</li>
			<li>1 medium bell pepper</li>
			<li>1 cup salsa</li>
			<li>3 cups lettuce, shredded</li>
			<li>1 medium tomatoes</li>
			<li>1⁄4 cup onion, chopped (optional)</li>
			<li>1⁄2 cup pitted ripe black olives (optional)</li>
			<li>sour cream (optional)</li>
				
		</ul>  
	</div>
	<div id="left">
	<h3>Taco Roll Recipe</h3>
	
	<img src="../../Images/Lunch/tacoroll.jpg" alt="Taco Roll"/>
	</div>
	<div id="undertext">
	<h4>Instructions</h4>
	<p> 1. Cook ground beef in large skillet over medium heat 7-9 minutes or until beef is no longer pink; drain.</p>
	<p> 2. Remove pan from heat.</p>
	<p> 3. Stir in taco seasoning mix, cheese and water.</p>
	<p> 4. Preheat oven to 375°F.</p>
	<p> 5. Unroll crescent dough; separate into triangles.</p>
	<p> 6. Arrange triangles in a circle on Classic Round Pizza Stone with wide ends overlapping in center and points toward outside.</p>
	<p> 7. Scoop meat mixture evenly onto widest end of each triangles up over filling and tuck under wide ends of dough at center of ring. </p>
	<p> 8. Bake at 20-25 minutes or until golden brown.</p>
	<p> 9. Shred lettuce and chop tomato, onion, olives, and bell pepper (if desired).</p>
	<p>10. If you want to do something fancy, scoop out a bell pepper and fill with salsa and put into center of ring.</p>
	<p>11. Add your toppings to top of ring and finish with more shredded cheese and sour cream.</p>
	</div>
	
	<div id="comments">
	<h4>Comments</h4>
	<hr>
	<div id="box">
	<h5>Martin Kalle    |    2015-05-05</h5>
	<p>Good food!</p>
	<hr>
	<h5>Olle fat    |    2015-01-01</h5>
	<p>Love your cooking!</p>
	<hr>
	<h5>Anna gotlan    |    2014-09-23</h5>
	<p>10/10</p>
	</div>
	</div>
	</div>
	</body>
	
	</html>