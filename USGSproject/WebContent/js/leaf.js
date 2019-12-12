//map setup
var mymap = L.map('mapid').setView([ 8.4051189, 21.5171788 ], 4);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}',
				{
					attribution : 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery Â© <a href="https://www.mapbox.com/">Mapbox</a>',
					maxZoom : 18,
					id : 'mapbox.streets',
					accessToken : 'pk.eyJ1IjoibG9uZXdvbGY2NzYiLCJhIjoiY2sxbThhNGYzMGR3eTNjbW1rMWdybG54eiJ9.nXrAwF5PWd4ev41NZjcyMQ'
				}).addTo(mymap);

// icons
var icons = new Array();

var LeafIcon = L.Icon.extend({
	options : {
		iconSize : [ 20, 20 ],
		iconAnchor : [ 12, 12 ],
		popupAnchor : [ -1, -1 ]
	}
});
for (var i = 0; i < 17; i++) {
	var test = new LeafIcon({
		iconUrl : 'icons/image' + i + '.png'
	});

	icons.push(test);
}
