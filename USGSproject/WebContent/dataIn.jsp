<%@ page isELIgnored="false" language="java"
	contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@page import="edu.drickert.dataInfo"%>
<%@page import="edu.drickert.DataTable"%>
<%@page import="java.util.ArrayList"%>
<meta http-equiv="Content-Type">
<meta name="description" content="about us"
	content="text/html; charset=UTF-8">
<title>Data page</title>

<link rel="stylesheet" type="text/css" href="css/index.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"
	integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
	crossorigin="" />
<script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"
	integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew=="
	crossorigin=""></script>

</head>
<header>
	<div class="topnav">
		<a href="home.jsp">Home</a> 
		<a class="active" href="data?action=data">Data Visualization</a> 
		<a href="login?action=logout">Logout</a>

	</div>
</header>
<body>
	<div class="testing">
	<p>Welcome back, ${sessionScope.user.firstName}.</p>
	<h1>USGS Visualization</h1>

	<div id="id03" class="modal">
		<span onclick="document.getElementById('id03').style.display='none'"
			class="close" title="Close Modal">&times;</span>

		<!-- Modal Content -->
		<form class="modal-content animate">

			<div class="container">
				<h2>Choose Export Format</h2>

				<button type="button"
					onclick="document.getElementById('id03').style.display='none'"
					class="btn">PDF</button>
				<button type="button"
					onclick="document.getElementById('id03').style.display='none'"
					class="btn">Excel</button>



			</div>

			<div class="container" style="background-color: #f1f1f1">
				<button type="button"
					onclick="document.getElementById('id03').style.display='none'"
					class="cancelbtn">Cancel</button>
			</div>
		</form>
	</div>



	<h1>Welcome to the Data Visualization Page</h1>
<body>


	<div>

		<div id="control">

			<form action="data?action=year" method="post">
				<div class="rw">
					<div class="col">
						<h3>Year Range</h3>
						<label for="yearStart">Min Year:</label> <input type="text"
							id="yearStart" name="yearStart" value="${startY}" required>

						<br> <label for="yearEnd">Max Year:</label> <input
							type="text" id="yearEnd" name="yearEnd" value="${endY}" required>
						<br /> <br /> <br /> <input type="submit" value="Update">
					</div>
					<div class="col">
						<h3>Filter Icons By:</h3>
						<input type="radio" name="selectFilter" value="resource" ${check1}
							checked> Resource<br> <input type="radio"
							name="selectFilter" value="mineType" ${check2}> Mine Type<br>
					</div>
					<div class="col">
						<h3>Filter Precision Code By:</h3>
						<select name="precodes">
							<option value="0">unfiltered</option>
							<option value="1" ${1}>1: Mine/production facility
								itself</option>
							<option value="2" ${2}>2: City or nearby city</option>
							<option value="3" ${3}>3: District/municipality level</option>
							<option value="4" ${4}>4: Province/State</option>
						</select>
						<p>
							Currently Filtering: ${filterOption}<br> Precision codes
							tell us how close the markers are to the actual minesite
						</p>
					</div>
				</div>
				<br>
			</form>
		</div>

	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />

	<div id="mid">
		<div id="mapid"></div>

		<div>

			<table id="legend">
				<caption>Icon Legend</caption>
				<tr>
					<th>Identifier</th>
					<th>Icon</th>
				</tr>
			</table>
		</div>
	</div>
	<script src="js/leaf.js"></script>

	<script type="text/javascript">

</script>

	<script>
var maps = {};
var dataSetjs=new Array();
<%DataTable dt = new DataTable();
			//ArrayList<dataInfo> dataSet=dt.getData();

			ArrayList<dataInfo> dataSet = (ArrayList<dataInfo>) session.getAttribute("dataSet");

			ArrayList<String> selection;

			if (session.getAttribute("filter").equals("MineType")) {
				selection = dt.getMineType();
			} else {
				selection = dt.getMinerals();
			}

			String precode = (String) session.getAttribute("precode");
			Boolean codeTF = false;
			ArrayList<String> precodeDT = dt.getPrecisionCode();
			if (precodeDT.contains(precode)) {
				codeTF = true;
			} else {
				codeTF = false;
			}
			int startY = (Integer) session.getAttribute("startY");
			int endY = (Integer) session.getAttribute("endY");%>

//creating layer groups per mineral, each id as lg_index, so lg_1 lg_2 and so on. Maps is a js object created above used as a key: value system.
//This first for loop initializes all the key: value within maps. value is a layergroup from leaflet. 



<%for (int i = 0; i < selection.size(); i++) {%>
var lg_<%=i%>=L.layerGroup();

		maps["<%=selection.get(i)%>"] = lg_<%=i%>;
	
<%}%>
//adds the object to the map
L.control.layers(null,maps).addTo(mymap);

//updates the existing layergroups with actual layers "L.marker..." is one layer and each of the layers is added to is respective mineral layer.
//may get random false positive errors, putting java within js within jsp, does that.
<%for (int i = 0; i < selection.size(); i++) {

				for (int j = 0; j < dataSet.size(); j++) {
					int currYear = Integer.parseInt(dataSet.get(j).getYear());
					if ((selection.get(i).equals(dataSet.get(j).getResource())
							|| selection.get(i).equals(dataSet.get(j).getMineType()))
							&& ((startY <= currYear) && (currYear <= endY))) {
						if (precode.equals(dataSet.get(j).getPrecisionCode())) {%>
		
				L.marker([<%=dataSet.get(j).getLatitude()%>, <%=dataSet.get(j).getLogitude()%>],{icon: icons[<%=i%>]}).bindPopup("<br>Year: "+<%=dataSet.get(j).getYear()%>+"<br>Country: "+
						'<%=dataSet.get(j).getCountry()%>' +"<br>Results: " +'<%=dataSet.get(j).getAnnualAmount()%>'+" "+'<%=dataSet.get(j).getStandMeasure()%>'+" of "+
						'<%=dataSet.get(j).getResource()%>'+"<br>Precision Code: "+'<%=dataSet.get(j).getPrecisionCode()%>').addTo(lg_<%=i%>);
					<%} else if (precode.equals("0")) {%>
				L.marker([<%=dataSet.get(j).getLatitude()%>, <%=dataSet.get(j).getLogitude()%>],{icon: icons[<%=i%>]}).bindPopup("<br>Year: "+<%=dataSet.get(j).getYear()%>+"<br>Country: "+
						'<%=dataSet.get(j).getCountry()%>' +"<br>Results: " +'<%=dataSet.get(j).getAnnualAmount()%>'+" "+'<%=dataSet.get(j).getStandMeasure()%>'+" of "+
						'<%=dataSet.get(j).getResource()%>'+"<br>Precision Code: "+'<%=dataSet.get(j).getPrecisionCode()%>').addTo(lg_<%=i%>);
	
					<%}
					}
				}
			}%>

<%for (int i = 0; i < selection.size(); i++) {%>
	var text= "<%=selection.get(i)%>";
		var numb =<%=i%>;

		var table = document.getElementById("legend");

		var row = table.insertRow();

		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);

		cell1.innerHTML = text;
		cell2.innerHTML = "<img src=\"icons/image"+numb+".png\" height=\"20\" style=\"width:20px\">";
	<%}%>
		
	</script>
	<br>
	<br>
	<br>
	<br>

</div>
</body>

</html>