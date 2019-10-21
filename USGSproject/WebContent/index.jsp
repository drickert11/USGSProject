<%@ page language="java" contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>Homepage</title>
    <meta name="description" content="about us">
    <!-- original linking of stylesheet wasnt working but this is -->
    <style><%@include file="css/index.css"%></style>
    <script src="jquery-3.4.1.min.js"></script>
    <script lang="javascript" src="xlsx.ful.min.js"></script>
</head>
<header>
<div class="topnav">
    <a class="active" href="index.jsp">Home</a>
    <a href="Data-Input.jsp">Data Input</a>

    <div class="ye">
        <button onclick="document.getElementById('id01').style.display='block'">Login</button>
        <button onclick="document.getElementById('id02').style.display='block'">Register</button>
    </div>
</div>



<!-- The Modal -->
<!--login button-->
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

<!--signup button-->
<div id="id02" class="modal">
    <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>

    <!-- Modal Content -->
    <form class="modal-content animate">

        <div class="container">
            <h2>Enter Email, Username, and Password to register</h2>

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


</header>
<body>
<h1>USGS Automation</h1>

<!-- used JSTL to specify images -->
<img src="<c:url value='/images/USGS_black.png'/>" alt="USGS Logo">

<h2>Welcome to the USGS data automation website</h2>

<img src="<c:url value='/images/ofr20051294.png'/>" alt="Maps with points">
</body>


</html>