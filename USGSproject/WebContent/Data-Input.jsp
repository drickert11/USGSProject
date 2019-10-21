<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>Data Input</title>
    <meta name="description" content="about us">
    
    <!-- original linking of stylesheet wasnt working but this is -->
    <style><%@include file="css/index.css"%></style>
    <script src="jquery-3.4.1.min.js"></script>
    <script src="https://fastcdn.org/FileSaver.js/1.1.20151003/FileSaver.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.0/xlsx.full.min.js"></script>
</head>

<div class="topnav">
    <a href="index.jsp">Home</a>
    <a class="active" href="Data-Input.jsp">Data Input</a>

    <div class="ye">
        <button onclick="document.getElementById('id01').style.display='block'">Login</button>
        <button onclick="document.getElementById('id02').style.display='block'">Register</button>
    </div>

</div>

<!-- Button to open the modal login form -->


<!-- The Modal -->
<!--Login button-->
<div id="id01" class="modal">
  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>

    <!-- Modal Content -->
    <form class="modal-content animate">

        <div class="container">
            <label for="uname"><b>Username</b></label>
            <input type="text" id="uname" class="wf" placeholder="Enter Username" name="uname" required>

            <br>
            <br>

            <label for="psw"><b>Password</b></label>
            <input type="password" id="psw" class="wf" placeholder="Enter Password" name="psw" required>

            <br>
            <br>

            <label>
                <input type="checkbox" class="ckbx" checked="checked" name="remember"> Remember me
            </label>
            <br>
            <button type="submit">Login</button>

        </div>

        <div class="container" style="background-color:#f1f1f1">
            <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
            <span class="psw">Forgot <a href="#">password?</a></span>
        </div>
    </form>
</div>


<!--Sign up Button-->
<div id="id02" class="modal">
    <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>

    <!-- Modal Content -->
    <form class="modal-content animate">

        <div class="container">
            <h2>Enter Email, Username, and Password to Register</h2>

            <label for="mail"><b>Email</b></label>
            <input type="email" id="mail" class="wf" placeholder="Enter Email" name="email" required>

            <br>
            <br>

            <label for="use"><b>New Username</b></label>
            <input type="text" id="use" class="wf" placeholder="Enter Username" name="username" required>

            <br>
            <br>

            <label for="pass"><b>New Password</b></label>
            <input type="password" id="pass" class="wf" placeholder="Enter Password" name="password" required>

            <br>
            <br>

            <button type="submit">Register</button>

        </div>

        <div class="container" style="background-color:#f1f1f1">
            <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">Cancel</button>
        </div>
    </form>
</div>



<div id="id03" class="modal">
    <span onclick="document.getElementById('id03').style.display='none'" class="close" title="Close Modal">&times;</span>

    <!-- Modal Content -->
    <form class="modal-content animate">

        <div class="container">
            <h2>Choose Export Format</h2>

            <button type="button" onclick="document.getElementById('id03').style.display='none'" class="btn">PDF</button>
            <button type="button" onclick="document.getElementById('id03').style.display='none'" class="btn">Excel</button>



        </div>

        <div class="container" style="background-color:#f1f1f1">
            <button type="button" onclick="document.getElementById('id03').style.display='none'" class="cancelbtn">Cancel</button>
        </div>
    </form>
</div>

<div id="id04" class="modal">
    <span onclick="document.getElementById('id04').style.display='none'" class="close" title="Close Modal">&times;</span>

    <!-- Modal Content -->
    <form class="modal-content animate">

        <div class="container">
            <h2>Choose Export Format</h2>

            <label for="imp"><b>Choose File to Import</b></label>

            <br>
            <br>

            <input type="file" id="imp" name="usgs file" accept="application/vnd.ms-excel/"required>

            <br>
            <br>

            <button type="submit">Import</button>



        </div>

        <div class="container" style="background-color:#f1f1f1">
            <button type="button" onclick="document.getElementById('id04').style.display='none'" class="cancelbtn">Cancel</button>
        </div>
    </form>
</div>

<header>
<h1>Welcome to the Data Input Page</h1>
<img src="USGS_black.png" alt="USGS Logo">
</header>

<body>
<h2>Please fill out the information fields below</h2>

<h3>Information Fields</h3>
<form action="#" class="border">
    <label for="country">Country:</label>
    <input type="text" id="country" name="Country" placeholder="Ex.United States" required>

    <br>
    <br>

    <label for="year">Year:</label>
    <input type="number" id="year" name="yearOf" placeholder="Ex.1990" required>

    <br>
    <br>

    <label for="reso">Resource:</label>
    <input type="text" id="reso" name="resource" placeholder="Ex.Aluminum" required>

    <br>
    <br>

    <label for="mineType">Mine Type:</label>
    <select id="mineType" name="mineType">
	    <option value="artisanal">artisanal</option>
	  	<option value="artisanal and military">artisanal and military</option>
	  	<option value="artisanal, military, rebel">artisanal, military, rebel</option>
	 	<option value="cooperative">cooperative</option>
	 	<option value="cooperative and industrial">cooperative and industrial</option>
	 	<option value="government">government</option>
	 	<option value="government and industrial">government and industrial</option>
	 	<option value="industrial">industrial</option>
	 	<option value="military">military</option>
	 	<option value="na">na</option>
	 	<option value="rebel">rebel</option>
	</select>

    <br>
    <br>

    <label for="loca">Location:</label>
    <input type="text" id="loca" name="location" placeholder="Ex.Los Angeles" required>

    <br>
    <br>

    <label for="lat">Latitude:</label>
    <input type="number" id="lat" name="latitude" placeholder="Ex.-42.7692" required>

    <br>
    <br>

    <label for="long">Longitude:</label>
    <input type="number" id="long" name="longitude" placeholder="Ex.-65.0385" required>

    <br>
    <br>

    <label for="admin1">Admin 1:</label>
    <input type="text" id="admin1" name="admin1" placeholder="chubut">

    <br>
    <br>

    <label for="admin2">Admin 2:</label>
    <input type="text" id="admin2" name="admin2" placeholder="puerto madryn">

    <br>
    <br>
    
    <label for="precisionCode">Precision Code:</label>
    <select id="precisionCode" name="precisionCode">
	    <option value="1">1: Mine/production facility itself</option>
	  	<option value="2">2: City or nearby city</option>
	  	<option value="3">3: District/municipality level</option>
	 	<option value="4">4: Province/State</option>
	 	<option value="5">9: Unsure if location is correct</option>
	</select>
    <br>
    <br>
    
    <label for="amo">Standard Measure for Amount:</label>
    <input type="text" id="amo" name="amount" size="28" placeholder="Ex.Thousand Metric Tons" required>

    <br>
    <br>

    <label for="anAmou">Annual Amount:</label>
    <input type="number" id="anAmou" name="annual ammount" placeholder="Ex.170" required>

    <br>
    <br>


    <input type="submit" id="Add" value="Save">
</form>
<button class="norm" onclick="document.getElementById('id03').style.display='block'">Export</button>
<button class="norm" onclick="document.getElementById('id04').style.display='block'">Load</button>
</body>

</html>