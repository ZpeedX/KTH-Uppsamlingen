<?php
if(!isset($_SESSION['CurrentUser'])){
    session_start();
}
$_SESSION['currentPage'] = __FILE__;


?>
<!doctype html>
<html>
<head>
    <title>Wok</title>
	
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
		<h1>Wok</h1>
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
	<h2>Ingredients for 6 to 8 servings</h2>
		<ul>
			<li>1 tablespoon vegetable oil</li>
			<li>1 tablespoon sesame oil</li>
			<li>2 pounds boneless, skinless chicken breast, cut into 1⁄2-inch pieces</li>
			<li>1 bunch broccoli, cut into florets</li>
			<li>1 package shiitake mushrooms</li>
			<li>2 to 3 carrots, thinly sliced</li>
			<li>1 cup onion, diced</li>
			<li>1 (8-ounce) can sliced water chestnuts, drained</li>
			<li>1 cup chicken broth</li>
			<li>1/4 cup hoisin sauce</li>
			<li>1 tablespoon soy sauce</li>
			<li>1 teaspoon powdered ginger</li>
			<li>2 tablespoons cornstarch</li>
			<li>Serving suggestion: Hot, cooked rice noodles</li>

				
		</ul>  
	</div>
	<div id="left">
	<h3>Wok Recipe</h3>
	
	<img src="../../Images/Lunch/wok.jpg" alt="Wok"/>
	</div>
	<div id="undertext">
	<h4>Instructions</h4>
	<p> 1. In a large skillet, heat the oils over medium-high heat. Add the chicken and cook for 4 to 5 minutes or until lightly browned.</p>
	<p> 2. Add broccoli, mushrooms, carrots, pepper, and onion and cook an additional 5 minutes, stirring frequently.</p>
	<p> 3. Stir in the water chestnuts.</p>
	<p> 4. In a small bowl, combine broth, hoisin sauce, soy sauce, ginger, and cornstarch.</p>
	<p> 5. Add to chicken mixture and bring to a boil over medium-high heat.</p>
	<p> 6. Reduce heat to medium to medium-low, and simmer for 4 to 5 minutes, or until sauce thickens.</p>
	<p> 7. Serve over hot, cooked rice noodles.</p>
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