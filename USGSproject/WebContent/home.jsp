<%@ page isELIgnored="false" language="java" contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>  
	<meta http-equiv="Content-Type">
    <meta name="description" content="about us" content="text/html; charset=UTF-8">
    <title>Home</title>
    
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
   crossorigin=""/>
   <script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
   integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
   crossorigin="">
   </script>
</head>
<header>
<div class="topnav">
		<a class="active" href="home.jsp">Home</a> 
		<a href="data?action=data">Data Visualization</a> 
		<a href="login?action=logout">Logout</a>

</div>
</header>
<body>
<p>Welcome back, ${sessionScope.user.firstName}.</p>
<h1>USGS Visualization</h1>
<h2>USGS Visualization Homepage</h2>

<!-- used JSTL to specify images -->
<img src="images/USGS_black.png" alt="USGS Logo">



</div>
</body>


</html>