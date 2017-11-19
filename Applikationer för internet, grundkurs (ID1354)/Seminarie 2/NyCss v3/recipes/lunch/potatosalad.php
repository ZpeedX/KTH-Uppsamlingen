<?php
if(!isset($_SESSION['CurrentUser'])){
    session_start();
}
$_SESSION['currentPage'] = __FILE__;


?>
<!doctype html>
<html>
<head>
    <title>Potato Salad</title>
	
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
		<h1>Potato Salad</h1>
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
	<h2>Ingredients for 8 servings</h2>
		<ul>
			<li>8 medium potatoes, cooked and diced</li>
			<li>1 1⁄2 cups mayonnaise</li>
			<li>2 tablespoons cider vinegar</li>
			<li>2 tablespoons sugar</li>
			<li>1 tablespoon yellow mustard</li>
			<li>1 teaspoon salt</li>
			<li>1 teaspoon garlic powder</li>
			<li>1⁄2 teaspoon pepper/li>
			<li>2 celery ribs, sliced</li>
			<li>1 cup onion, minced</li>
			<li>5 hard-boiled eggs</li>
			<li>paprika</li>
		</ul>  
	</div>
	<div id="left">
	<h3>Potato Salad Recipe</h3>
	
 <img src="../../Images/Lunch/potatosalad.jpg" alt="Potatoe Salad"/>
	</div>
	<div id="undertext">
	<h4>Instructions</h4>
	<p> 1. Boil peeled potatoes in salted water until done. Cool to room temperature.</p>
	<p> 2. Place diced potatoes in large bowl.</p>
	<p> 3. Mix mayonnaise, cider vinegar, sugar, mustard, salt, garlic powder, and pepper in another bowl.</p>
	<p> 4. Add to potatoes.</p>
	<p> 5. Add celery and onions and mix well.</p>
	<p> 6. Stir in eggs.</p>
	<p> 7. Sprinkle a little paprika on top.</p>
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