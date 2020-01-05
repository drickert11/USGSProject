# USGSProject
USGS Data Visualization Project

Supported by the Army Research Office and the Minerva Research Initiative, researchers at the University of Texas at Austin and The University of North Carolina Charlotte collected data on the location, output, and prices of natural resources locations in Africa, Asia, and Latin America. For this project we are loading the dataset onto a database and displaying an organized and filtered set of the information through an interactable map utilizing the leaflet api.

The program makes use of PosgreSQL and a jsp/javaservlet setup.

Users can register and login to view a world map and interact with the dataset of the collected information throughout the years. This can offer users an immediate grasp on information across multiple countries.

Features Overview:
Interactive Map: Users can explore an interactive map of which they can zoom in and out of, offering different levels of detail on the map.

Year Range: Users can define the range of year(s) of which to display data.

Icon Definition: Users can choose between a selection of identifiers of which to sort how to display the data through the various icons. In doing this, the site builds a Legend for them to help guide the user.

Data Filter: Users can select parameters of which to display data under, narrowing the number of results based on a selected criteria.

Mine Site Overview: By clicking a marker users can view the summary information of the mine site and it’s collected results at a period in time.

Changes to be made:
Update the sql java classes to use Prepared Statements to protect against sql injection.
Fixing the Docker issue to allow this program to run on Docker alone to test, instead of the original requirements.
At the moment, the main program runs inside of the Tomcat local server docker container, and the database runs on the PosgreSQL container each just fine, but they don't communicate. 

Going forward: While this project served as a good proof of concept, going forward we will be recreating and continuing forth on a framework more concurrent with todays standards. 

To view a website walthrough please visit the wiki:
https://github.com/drickert11/USGSProject/wiki

