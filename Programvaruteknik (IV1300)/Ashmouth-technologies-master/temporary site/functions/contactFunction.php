<?php
	require_once 'libs/PHPMailer/PHPMailerAutoload.php';
	
/*
	$m->Subject = 'Here is an email';
	$m->Body = 'This is the body of a email!';
	$m->AltBody = 'This is the body of a email!';
	
	var_dump($m->send());	*/
	
	$errName="";
	$errEmail ="";
	$errMessage ="";
	$errHuman ="";
	$result="";
	if (isset($_POST["submit"])) {
		$m = new PHPMailer;
		
		$name = $_POST['name'];
		$email = $_POST['email'];
		$message = $_POST['message'];
		$sendTo = 'evan_95@hotmail.com';
		
		$m->isSMTP();
		$m->SMTPAuth = true;
		
		$m->Host='smtp.gmail.com';
		$m->Username='rainbowsender0@gmail.com';
		$m->Password = 'rainbow0';
		$m->SMTPSecure = 'ssl';
		$m->Port = 465;		
			
		$m->From = $email;
		$m->FromName = 'Rainbow contact';		
		
		$m->addReplyTo($email,'Reply address: ' . $email);
		$m->addAddress($sendTo, 'hello');
		
		$m->Body ="From: $name\n E-Mail: $email\n Message:\n $message";
		
		$key = "6LfHmwcUAAAAAFI4FB6gIykyh9Q6Il3KzTxo3Bf0";
 	        $response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=".$key."&response=".$_POST['g-recaptcha-response']);
     		$response = json_decode($response, true);	
		
		
		// Check if name has been entered
		if (!$_POST['name']) {
			$errName = 'Please enter your name';
		}
		
		// Check if email has been entered and is valid
		if (!$_POST['email'] || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
			$errEmail = 'Please enter a valid email address';
		}
		
		//Check if message has been entered
		if (!$_POST['message']) {
			$errMessage = 'Please enter your message';
		}
		//Check if anti-bot test is correct
		if ($response["success"] === false) {
		// What happens when the CAPTCHA was entered incorrectly
			$errHuman = "The reCAPTCHA wasn't entered correctly, please try again.";
		}
		
		// If there are no errors, send the email
		if (!$errName && !$errEmail && !$errMessage && !$errHuman) {
			if ($m->send()) {
				$result='<div class="alert alert-success">Thank You! We will be in touch.</div>';
			} else {
				$result='<div class="alert alert-danger">Sorry there was an error sending your message. Please try again later.</div>';
			}
		}
	}

?>