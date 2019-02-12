<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above ll 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Rainbow Software">
    <meta name="author" content="Rainbow Software">

    <title>Rainbow Software</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>

	 <!-- Custom CSS -->
	<link href="css/dimas.css" rel="stylesheet"/>
    <link href="css/style.css" rel="stylesheet"/>

	<link href="css/cover.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Tangerine">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">


	<script src='https://www.google.com/recaptcha/api.js'></script>
  </head>


  <body>
    <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="index.php" >Rainbow Software</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                    <!-- <li>
                        <a href="index.php">Home</a>
                    </li> -->
					<li>
						<a href="about.php">About Us</a>
					</li>					
					<li>
						<a href="team.php">Work Team</a>
					</li>
					<li>
						<a href="gallery.php">Gallery</a>
					</li>
					
					<li>
                        <a href="contact.php">Contact</a>
                    </li>

                </ul>
            </div>
          </div>
        </nav>

      </div>
    </div>

    <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="inner cover">
            <h1 class="cover-heading">Rainbow Software</h1>
            <p class="lead">"Ba-a, ba-a, black sheep, have you any wool?
				Yes, sir! yes, sir! three bags full:
				One for my master, one for my dame,
				And one for the little boy that lives in our lane." - William Shakespear.
				Welcome to our reality.</p>
            <p class="lead">
              <div id="visitors"><?php include_once 'functions/counter.php' ?> Visitors </div>
            </p>
          </div>
			<div class="mastfoot">
				<div class="inner">
				  <p>&copy; 2016 Company, Inc.</p>
				</div>
			  </div>
			
        </div>

      </div>

    </div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>

  </body>

</html>
