<%@ page isELIgnored="false" language="java" contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>  
	<%@page import="edu.drickert.dataInfo"%>
	<%@page import="java.util.ArrayList"%>
	<meta http-equiv="Content-Type">
    <meta name="description" content="about us" content="text/html; charset=UTF-8">
    <title>Data page</title>
    
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"
   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
   crossorigin=""/>
   	<script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"
   integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew=="
   crossorigin=""></script>
</head>
<header>
<div class="topnav">
    <a href="login?action=logout">Logout</a>
    <a href="home.jsp">Home</a>
    <a class="active" href="data?action=data">Data Visualization</a>
    <a href="table.jsp">table(in development)</a>

</div>
</header>
<body>
<p>Welcome back, ${sessionScope.user.firstName}.</p>
<h1>USGS Visualization</h1>

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



<h1>Welcome to the Data Visualization Page</h1>
<body>



<div id="mapid"></div>

<script type="text/javascript">
var mymap = L.map('mapid').setView([8.4051189, 21.5171788], 7);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery Â© <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox.streets',
    accessToken: 'pk.eyJ1IjoibG9uZXdvbGY2NzYiLCJhIjoiY2sxbThhNGYzMGR3eTNjbW1rMWdybG54eiJ9.nXrAwF5PWd4ev41NZjcyMQ'
}).addTo(mymap);



</script>

<%/3

ArrayList<dataInfo> dataSet = (ArrayList<dataInfo>)session.getAttribute("dataSet");

for(int i=0;i<dataSet.size();i++){
%>




	<script>
	var marker = L.marker([<%=dataSet.get(i).getLatitude()%>, <%=dataSet.get(i).getLogitude()%>]).addTo(mymap);
	
	marker.bindPopup("<br>Year: "+<%=dataSet.get(i).getYear()%>+"<br>Country: "+'<%=dataSet.get(i).getCountry()%>' +"<br>Results: " +'<%=dataSet.get(i).getAnnualAmount()%>'+" "+'<%=dataSet.get(i).getStandMeasure()%>'+" of "+'<%=dataSet.get(i).getResource()%>').openPopup();
	</script>

<%} %>
<button class="norm" onclick="document.getElementById('id03').style.display='block'">Export</button>
</body>

</html>