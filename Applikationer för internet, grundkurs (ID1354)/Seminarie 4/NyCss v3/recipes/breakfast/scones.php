<?php
if(!isset($_SESSION['CurrentUser'])){
    session_start();
}
$_SESSION['currentPage'] = __FILE__;


?>
<!doctype html>
<html>
<head>
    <title>Scones</title>
	
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
		<h1>Scones</h1>
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
	<h2>Ingredients for 8 porsions</h2>
		<ul>
			<li>3 cups all-purpose flour</li>
			<li>1⁄2 cup white sugar</li>
			<li>5 teaspoons baking powder</li>
			<li>1⁄2 teaspoon salt</li>
			<li>3⁄4 cup butter</li>
			<li>1 egg, beaten</li>
			<li>1 cup milk</li>

		</ul>  
	</div>
	<div id="left">
	<h3>Scones Recipe</h3>
	
 <img src="../../Images/breakfast/scones.jpg" alt="Scones"/>
	</div>
	<div id="undertext">
	<h4>Instructions</h4>
	<p> 1. Preheat oven to 400 degrees F (200 degrees C). Lightly grease a baking sheet.</p>
	<p> 2. In a large bowl, combine flour, sugar, baking powder, and salt. Cut in butter.</p>
	<p> 3. Mix the egg and milk in a small bowl, and stir into flour mixture until moistened.</p>
	<p> 4. Turn dough out onto a lightly floured surface, and knead briefly. </p>
	<p> 5. Roll dough out into a 1/2 inch thick round. Cut into 8 wedges, and place on the prepared baking sheet.</p>
	<p> 6. Bake 15 minutes in the preheated oven, or until golden brown.</p>
	</div>
	
	
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
	
	</body>
	
	</html>