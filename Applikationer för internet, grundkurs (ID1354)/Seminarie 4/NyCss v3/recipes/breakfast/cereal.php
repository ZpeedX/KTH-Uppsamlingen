<?php
if(!isset($_SESSION['CurrentUser'])){
    session_start();
}
$_SESSION['currentPage'] = __FILE__;


?>
<!doctype html>
<html>
<head>
    <title>Cereal</title>
	
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
		<h1>Cereal</h1>
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
	<h2>Ingredients for 4 persons</h2>
		<ul>
			<li>1 tbsp vegetable oil</li>
			<li>100ml clear honey</li>
			<li>50ml maple syrup</li>
			<li>500g jumbo rolled oats</li>
			<li>100g flaked almonds</li>
			<li>50g pine nuts</li>
			<li>100g puffed rice</li>
			<li>2 tbsp sesame seeds</li>
			<li>50g each sultanas and raisins</li>
			<li>85g each dried cranberries</li>
			<li>50g dried coconuts shavings</li>
			<li>Greek yogurt and raspberries, to serve</li>
			
		</ul> 
			</div>
			<div id="left">
	<h3>Cereal Recipe</h3>
	
 <img src="../../Images/breakfast/cereal.jpg" alt="Cereal"/>
	</div>
	<div id="undertext">
	<h4>Instructions</h4>
   <p> 1. Heat oven to 160C/fan 140C/gas 3. Heat the oil, honey and maple syrup together in a pan.</p>
   <p> 2. Mix the oats, almonds, pine nuts, puffed rice and sesame seeds in a large mixing bowl. </p>
   <p> 3. Pour over the honey mix, stir well to coat, then tip onto a large baking tray. </p>
   <p> 4. Bake for 15 mins until everything is golden and crisp.</p>
   <p> 5. Take the tray from the oven, leave to cool, then break up any big clumps. </p>
   <p> 6. Mix together with the dried fruit and coconut shavings. </p>
   <p> 7. Serve with Greek yogurt and fresh raspberries. The rest of the granola can be stored in a sealed jar and enjoyed over the next 2 weeks.</p>
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