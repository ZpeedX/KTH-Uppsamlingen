<?php
	//Inlcues all PHPMailer functions to be able to send mails. 
	require_once 'libs/PHPMailer/PHPMailerAutoload.php';
	
/*
	$m->Subject = 'Here is an email';
	$m->Body = 'This is the body of a email!';
	$m->AltBody = 'This is the body of a email!';
	
	var_dump($m->send());	*/
	
	//Vairables related to error messages.
	$errName="";
	$errEmail ="";
	$errMessage ="";
	$errHuman ="";
	$result="";
	
	/*
	Checks first if submit button in contact form is clicked.
	*If the statement is true then the code will:
	*Create a new PHPMailer object and call every required variable to be configured
	to be able to send a mail.
	*Check if every field in the contact form is filled and the input is
	not exceeding the specified character limit.
	*Send a request to the reCAPTCHA function with specified key and get a boolean response.
	*If there are no error messages and the reCaPTCHA function was handled correctly, 
	the PHPMailer function will send a mail to the specified email with the given credentials.
	*/
	if (isset($_POST["submit"])) {
		$m = new PHPMailer;
		
		$name = $_POST['name'];
		$email = $_POST['email'];
		$message = $_POST['message'];
		$sendTo = 'rainbowsender0@gmail.com';
		
		$m->isSMTP();
		$m->SMTPAuth = true;
		
		$m->Host='smtp.gmail.com';
		$m->Username='rainbowsender0@gmail.com';
		$m->Password = 'rainbow0';
		$m->SMTPSecure = 'ssl';
		$m->Port = 465;		
			
		$m->From = $email;
		$m->FromName = 'Rainbow contact form';		
		
		$m->addReplyTo($email,'Reply address: ' . $email);
		$m->addAddress($sendTo, $name);
		
		$m->Body ="From: $name\n E-Mail: $email\n Message:\n $message";
		
		$key = "6LfHmwcUAAAAAFI4FB6gIykyh9Q6Il3KzTxo3Bf0";
        $response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=".$key."&response=".$_POST['g-recaptcha-response']);
        $response = json_decode($response, true);	
		
		
		// Check if name has been entered
		if (!$_POST['name']) {
			$errName = 'Please enter your name';
		} else if(strlen($_POST['name']) > 60) {
			$errName = "You can't enter more than 60 characters!";
		}
		
		// Check if email has been entered and is valid
		if (!$_POST['email'] || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
			$errEmail = 'Please enter a valid email address';
		} else if(strlen($_POST['email']) > 60) {
			$errEmail = "You can't enter more than 60 characters!";
		}
		
		//Check if message has been entered
		if (!$_POST['message']) {
			$errMessage = 'Please enter your message';
		} else if(strlen($_POST['message']) > 500) {
			$errMessage = "You can't enter more than 500 characters!";
		}
		//Check if anti-bot test is correct
		if ($response["success"] === false) {
		// What happens when the CAPTCHA was entered incorrectly
			$errHuman = "The reCAPTCHA wasn't entered correctly, please try again.";
		}
		$confirm = false;
		// If there are no errors, send the email
		if (!$errName && !$errEmail && !$errMessage && !$errHuman) {
			if ($m->send()) {
				$confirm = true;
				$result='<div class="alert alert-success">Thank You! We will be in touch.</div>';
			} else {
				$result='<div class="alert alert-danger">Sorry there was an error sending your message. Please try again later.</div>';
			}
		}
	}
?>