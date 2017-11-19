<?php
//Start a session if a session is not currently active.
if(!isset($_SESSION['CurrentUser'])){
    session_start();
}
//Save this page in a session as a link to be used as a previous page.
$_SESSION['currentPage'] = __FILE__;


?>
<!--Pizza recipe page-->
<!doctype html>
<html>
<head>
    <title>Pizza</title>
	
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
		<h1>Pizza</h1>
                
		</div>  
	 <div id="login">   
           <?php
           //checks if a user is logged in.
           //If it's true show logout button.
           //If it's false show login button.
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
			<li>300g strong bread flour</li>
			<li>1 tsp instant yeast (from a sachet or a tub)</li>
			<li>1 tsp salt</li>
			<li>1 tbsp olive oil, plus extra for drizzling</li>
			<li>100ml passata</li>
			<li>handful fresh basil or 1 tsp dried</li>
			<li>1 garlic clove, crushed</li>
			<li>125g ball mozzarella, sliced</li>
			<li>handful grated or shaved parmesan</li>
			<li>handful cherry tomatoes, halved</li>
			<li>handful basil leaves (optional)</li>
				
		</ul>  
	</div>
	<div id="left">
	<h3>Pizza marghetia Recipe</h3>
	
 <img src="../../Images/Dinner/pizza.jpg" alt="Pizza"/>
	</div>
 
	<div id="undertext">
	<h4>Instructions</h4>
	<p> 1. Make the base: Put the flour into a large bowl, then stir in the yeast and salt.
	Make a well, pour in 200ml warm water and the olive oil and bring together with a wooden spoon 
	until you have a soft, fairly wet dough.
	Turn onto a lightly floured surface and knead for 5 mins until smooth. Cover with a tea towel and set aside.
	You can leave the dough to rise if you like, but it’s not essential for a thin crust.</p>
	<p> 2. Make the sauce: Mix the passata, basil and crushed garlic together, then season to taste. 
	Leave to stand at room temperature while you get on with shaping the base.</p>
	<p> 3. Roll out the dough: If you’ve let the dough rise, give it a quick knead, then split into two balls.
	On a floured surface, roll out the dough into large rounds, about 25cm across, using a rolling pin.
	The dough needs to be very thin as it will rise in the oven. Lift the rounds onto two floured baking sheets.</p>
	<p> 4. Top and bake: Heat oven to 240C/fan 220C /gas 8.
	Put another baking sheet or an upturned baking tray in the oven on the top shelf. Smooth sauce over bases with the back of a spoon.
	Scatter with cheese and tomatoes, drizzle with olive oil and season.
	Put one pizza, still on its baking sheet, on top of the preheated sheet or tray. 
	Bake for 8-10 mins until crisp. Serve with a little more olive oil, and basil leaves if using. Repeat step for remaining pizza.</p>
	</div>
            
	
         <div id="comments">
	<h4>Comments</h4>
	<hr>
	<div id="box">
            
            <?php
            //Inlcude comment section.
            include '../../php/php/commentFunction.php';
                    
             ?>
        </div>
	</div>
	</div>
	</body>
	
	</html>