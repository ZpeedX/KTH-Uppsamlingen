<?php
if(!isset($_SESSION['CurrentUser'])){
    session_start();
}
$_SESSION['currentPage'] = __FILE__;


?>
<!doctype html>
<html>
<head>
    <title>Beef Stroganoff</title>
	
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
		<h1>Beef Stroganoff</h1>
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
			<li>2 pounds beef chuck roast</li>
			<li>1⁄2 teaspoon salt</li>
			<li>1⁄2 teaspoon ground black pepper</li>
			<li>4 ounces butter</li>
			<li>4 green onions, sliced (white parts only)</li>
			<li>4 tablespoons all-purpose flour</li>
			<li>1 (10.5 ounce) can condensed beef broth</li>
			<li>1 teaspoon prepared mustard</li>
			<li>1 (6 ounce) can sliced mushrooms, drained</li>
			<li>1⁄3 cup sour cream</li>
			<li>1⁄3 cup white wine</li>
			<li>salt to taste</li>
			<li>ground black pepper to taste</li>

				
		</ul>  
	</div>
	<div id="left">
	<h3>Beef Stroganoff Recipe</h3>
	
 <img src="../../Images/Lunch/beefstroganoff.jpg" alt="Beef Stroganoff"/>
	</div>
	<div id="undertext">
	<h4>Instructions</h4>
	<p> 1. Remove any fat and gristle from the roast and cut into strips 1/2 inch thick by 2 inches long.</p>
	<p> 2. Season with 1/2 teaspoon of both salt and pepper.</p>
	<p> 3. In a large skillet over medium heat, melt the butter and brown the beef strips quickly, then push the beef strips off to one side.</p>
	<p> 4. Add the onions and cook slowly for 3 to 5 minutes, then push to the side with the beef strips.</p>
	<p> 5. Stir the flour into the juices on the empty side of the pan. Pour in beef broth and bring to a boil, stirring constantly. </p>
	<p> 6. Lower the heat and stir in mustard. Cover and simmer for 1 hour or until the meat is tender.</p>
	<p> 7. Five minutes before serving, stir in the mushrooms, sour cream, and white wine. </p>
	<p> 8. Heat briefly then salt and pepper to taste.</p>
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