
<?php
if(!isset($_SESSION['CurrentUser'])){
    session_start();
}
$_SESSION['currentPage'] = __FILE__;


?>

<!doctype html>
<html>
<head>
    <title>Salmon Lasagne</title>
	
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
		<h1>Salmon Lasagne</h1>
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
			<li>600g skinless salmon fillets</li>
			<li>3 bunches asparagus, woody ends trimmed, halved crossways</li>
			<li>150g butter</li>
			<li>3 large leeks, pale section only, washed, thinly sliced</li>
			<li>125g plain flour</li>
			<li>1L (4 cups) milk</li>
			<li>1 tablespoon finely grated lemon rind</li>
			<li>2 teaspoons Dijon mustard</li>
			<li>1⁄4 cup chopped fresh dill</li>
			<li>110g (1 1⁄2 cups) finely grated parmesan</li>
			<li>Olive oil spray</li>
			<li>200g fresh lasagne sheets</li>
				
		</ul>  
	</div>
	<div id="left">
	<h3>Salmon Lasagne Recipe</h3>
	
 <img src="../../Images/Dinner/salmonlasa.jpg" alt="Salmon Lassagna"/>
	</div>
	<div id="undertext">
	<h4>Instructions</h4>
	<p> 1. Place the salmon in a large steamer lined with non-stick baking paper.
	Season with salt and pepper. Cover and cook over a large saucepan of boiling water
	(make sure the steamer doesn't touch the water) for 8 minutes or until just cooked through.
	Set aside for 5 minutes to cool slightly. Use a fork to flake the salmon into large pieces.</p>
	<p> 2. Meanwhile, cook the asparagus in the steamer, covered, for 4 minutes or until bright 
	green and tender crisp. Transfer to a large bowl of iced water and set aside for 2 minutes to refresh. 
	Drain and pat dry with paper towel.</p>
	<p> 3.  Melt 25g of the butter in a saucepan over medium-low heat. Add the leek and cook,
	partially covered, stirring occasionally, for 12 minutes or until soft.
	Transfer the leek to a colander and press to remove excess liquid.</p>
	<p> 4. Heat the remaining butter in a large saucepan over medium-high heat until foaming.
	Add the flour and cook, stirring, for 1-2 minutes or until the mixture bubbles and starts to
	come away from the side of pan. Remove from heat.
	Gradually add the milk, whisking constantly until smooth.</p>
	<p> 5. Place the milk mixture over medium-high heat and bring to the boil, stirring constantly with a wooden spoon,
	for 3 minutes or until the sauce thickens and coats the back of the spoon.
	Stir in the leek, lemon rind, mustard, dill and half the parmesan. Season with salt and pepper. </p>
	<p> 6. Preheat oven to 180°C. Lightly spray a 30 x 19cm (base measurement)
	2.5L (10-cup) capacity ovenproof dish with olive oil spray to grease.
	Line the base with one-third of the lasagne sheets. Top with one-third of the sauce. 
	Arrange the asparagus on top.
	Top with half the remaining lasagne sheets and half the remaining sauce. Top with the salmon.
	Season with salt and pepper. Top with remaining lasagne sheets and sauce. Sprinkle with remaining parmesan.
	Place the dish on a baking tray and bake for 30 minutes or until golden. Set aside for 10 minutes to cool slightly.
	Serve with mixed salad leaves.</p>
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