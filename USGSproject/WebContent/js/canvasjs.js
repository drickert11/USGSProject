
var grid;

//data
function table(){
	grid.data= [
	    {col1: 'foo', col2: 0, col3: 'a'},
	    {col1: 'bar', col2: 1, col3: 'b'},
	    {col1: 'baz', col2: 2, col3: 'c'}
	];
	
	//format
	data.schema= [
		{
			name: 'col1',
			enum: [//drop down menu
	               ['foo', 'Foo'],
	                ['bar', 'Bar'],
	                ['baz', 'Baz']
	            ]
		},
		{
			name: 'col2',
			type:'data'
		},
		{
			name:'col3'
		},
		
	];
	
	//defining funtion for type above
	grid.formatters.date = function (e) {
	    return new Date(e.cell.value).toISOString();
	};
	//render text
	grid.addEventListener('rendertext', function (e) {
	    if (e.cell.rowIndex > -1) {
	        if (e.cell.header.name === 'col2') {
	            e.cell.formattedValue = new Date(e.cell.value).toISOString();
	        }
	    }
	});
	grid.addEventListener('click', function (e) {
	    if (!e.cell) { return; }
	    grid.data[0][grid.schema[0].name] = 'Clicked on ' + e.cell.value;
	});
	initGrid();
}

if (document.addEventListener) {
    document.addEventListener('DOMContentLoaded', table);
} else {
    setTimeout(function () {
        'use strict';
        table();
    }, 500);
}

