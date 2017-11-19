
<?php
if(!isset($_SESSION['CurrentUser'])){
    session_start();
}
$_SESSION['currentPage'] = __FILE__;


?>
<!doctype html>
<html>
<head>
    <title>Tuna Salad</title>
	
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
		<h1>Tuna Salad</h1>
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
			<li>1 (7 ounce) can white tuna, drained and flaked</li>
			<li>6 tablespoons mayonnaise or salad dressing</li>
			<li>1 tablespoon Parmesan cheese</li>
			<li>3 tablespoons sweet pickle relish</li>
			<li>1⁄8 teaspoon dried minced onion flakes</li>
			<li>1⁄4 teaspoon curry powder</li>
			<li>1 tablespoon dried parsley</li>
			<li>1 teaspoon dried dill weed</li>
			<li>1 pinch garlic powder</li>
	
		</ul> 
		</div>
	<div id="left">
	<h3>Tuna Salad Recipe</h3>
	
	<img src="../../Images/Dinner/tunasalad.jpg" alt="Tuna Salad"/>
	</div>
	
	<div id="undertext">
	<h4>Instructions</h4>
	<p> 1. In a medium bowl, stir together the tuna, mayonnaise, Parmesan cheese, and onion flakes.</p>
	<p> 2. Season with curry powder, parsley, dill and garlic powder. Mix well and serve with crackers or on a sandwich.</p>
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