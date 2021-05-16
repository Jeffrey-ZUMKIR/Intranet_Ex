<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<h3>Salut</h3>

	<?php
		session_start();
		if(isset($_SESSION["login"])){
			//destruction de la session et redirection vers la page login.php
			unset($_SESSION);
			session_destroy();
			header("Location:login2.php");
		}

	?>
	
</body>
</html>