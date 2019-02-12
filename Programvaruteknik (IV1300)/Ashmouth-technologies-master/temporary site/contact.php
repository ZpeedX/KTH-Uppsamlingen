<?php
	include_once 'functions/contactFunction.php';

?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above ll 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Contact Us</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
	
	 <!-- Custom CSS -->
	<link href="css/style.css" rel="stylesheet"/>


	<script src='https://www.google.com/recaptcha/api.js'></script>
  </head>

  <body>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Start Bootstrap</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.php">Home</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">About <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="about.php">About Us</a>
                            </li>
                            <li>
                                <a href="team.php">Work Team</a>
                            </li>
                            <li>
                                <a href="gallery.php">Gallery</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="contact.php">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
	
	<div class="container">
		<h1 class="text-center h1">Contact Us</h1>
		<hr class="featurette-divider">
		<form class="form-horizontal" role="form" method="post" action="">
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">Name</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="name" name="name" placeholder="First & Last Name" value="<?php if(!empty($_POST['name'])) echo htmlspecialchars($_POST['name']); ?>">
					<?php echo "<p class='text-danger'>" .  $errName ."</p>";?>
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-3 control-label">Email</label>
				<div class="col-sm-6">
					<input type="email" class="form-control" id="email" name="email" placeholder="example@domain.com" value="<?php if(!empty($_POST['email'])) echo htmlspecialchars($_POST['email']); ?>">
					<?php echo "<p class='text-danger'>$errEmail</p>";?>
				</div>
			</div>
			<div class="form-group">
				<label for="message" class="col-sm-3 control-label">Message</label>
				<div class="col-sm-6">
				
					<textarea class="form-control" rows="5" name="message"><?php if(!empty($_POST['message'])) echo htmlspecialchars($_POST['message']);?></textarea>
					<?php echo "<p class='text-danger'>$errMessage</p>";?>
				</div>
			</div>
			<div class="col-sm-offset-3">
					<div class="g-recaptcha" data-sitekey="6LfHmwcUAAAAADide2Fgz3MB9W4g5JXEAd-FT_Pt"></div>
					<?php echo "<p class='text-danger'>$errHuman</p>";?>
			</div>
			<div class="form-group">
				<div class="col-sm-6 col-sm-offset-3">
					<input id="submit" name="submit" type="submit" value="Send" class="btn btn-primary">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6 col-sm-offset-3">
					<?php echo $result; ?>	
				</div>
			</div>
		</form> 
		
      <!-- FOOTER -->
      <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2016 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>
	</div>






    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
   
  </body>
</html>
