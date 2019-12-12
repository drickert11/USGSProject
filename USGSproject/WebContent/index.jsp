<%@ page isELIgnored="false" language="java"
	contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type">
<meta name="description" content="about us"
	content="text/html; charset=UTF-8">
<title>Home</title>

<link rel="stylesheet" type="text/css" href="css/index.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<header>
	<div class="topnav">
		<a class="active" href="index.jsp">Login</a>

		<div class="ye">
			<button
				onclick="document.getElementById('id01').style.display='block'">Login</button>
			<button
				onclick="document.getElementById('id02').style.display='block'">Register</button>
		</div>
	</div>



	<!-- The Modal -->
	<div>
		<!--login button-->
		<div id="id01" class="modal">
			<span onclick="document.getElementById('id01').style.display='none'"
				class="close" title="Close Modal">&times;</span>

			<!-- Modal Content -->
			<form class="modal-content animate" action="login?action=login"
				method="post">
				<div class="container">
					<p style="color: red;">${error}</p>

					<br> <br> <label for="email"><b>Email</b></label> <input
						type="text" id="email" class="wf" placeholder="Enter Email"
						name="email" required> <br> <br> <label
						for="psw"><b>Password</b></label> <input type="password" id="psw"
						class="wf" placeholder="Enter Password" name="password" required>

					<br>
					<button type="submit">Login</button>

				</div>

				<div class="container" style="background-color: #f1f1f1">
					<button type="button"
						onclick="document.getElementById('id01').style.display='none'"
						class="cancelbtn">Cancel</button>
					<span class="psw">Forgot <a href="#">password?</a></span>
				</div>
			</form>
		</div>

		<!--signup button-->
		<div id="id02" class="modal">
			<span onclick="document.getElementById('id02').style.display='none'"
				class="close" title="Close Modal">&times;</span>

			<!-- Modal Content -->
			<form class="modal-content animate" action="login?action=signup"
				method="post">

				<div class="container">
					<p style="color: red;">${error}</p>

					<br> <br>
					<h2>Enter Email, Username, and Password to register</h2>


					<label for="first"><b>First Name</b></label> <input type="text"
						id="first" class="wf" placeholder="Enter Your First Name"
						name="firstName" required> <br> <br> <label
						for="last"><b>Last Name</b></label> <input type="text" id="last"
						class="wf" placeholder="Enter Your Last Name" name="lastName"
						required> <br> <br> <label for="mail"><b>Email</b></label>
					<input type="email" id="mail" class="wf" placeholder="Enter Email"
						name="email" required> <br> <br> <label
						for="pass"><b>New Password</b></label> <input type="password"
						id="pass" class="wf" placeholder="Enter Password" name="password"
						required> <br> <br> <label for="pass"><b>Confirm
							Password</b></label> <input type="password" id="pass2" class="wf"
						placeholder="Confirm Password" name="password2" required>

					<br> <br>

					<button type="submit">Register</button>

				</div>

				<div class="container" style="background-color: #f1f1f1">
					<button type="button"
						onclick="document.getElementById('id02').style.display='none'"
						class="cancelbtn">Cancel</button>
				</div>
			</form>
		</div>
	</div>

</header>
<body>

	<h1>USGS Visualization</h1>
	<div id="contentBackground">
	<img src="images/USGS_black.png" alt="USGS Logo">

	<h2>
		Welcome to the USGS data visualization website. <br>Please log in
		to use the website.<br>
	</h2>

	<img src="images/truck2.jpg" alt="Maps with points">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	</div>
</body>


</html>