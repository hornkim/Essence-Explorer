
window.onload = function() {
	initCanvas();
}
   
var startPoint = new Point(250,250);
var startOffset = 0;
var RADIUS = 200;
var BASE_HEIGHT = 60;
var BASE_WIDTH = 140;

// var GREEN = 'rgb(219, 247, 236)';
// var BLUE = 'rgb(200, 220, 250)';
// var YELLOW = 'rgb(249, 249, 219)';
// var PINK = ' rgb(252, 235, 237)';

// Draw the first Object 
function startDraw(id, title, concern, type, width) {
	startOffset = 0;
	newRect(id, startPoint, BASE_WIDTH, BASE_HEIGHT, getColorConcern(concern), title, type, width);
}

function startNewDraw(id, title, concern, type) {
	startOffset += 600;
	let newPoint = new Point(startPoint.x + startOffset, startPoint.y );
	return newRect(id, newPoint, BASE_WIDTH, BASE_HEIGHT, getColorConcern(concern), title, type, 1);
}

// add associated objects and association links
function addAssociated(startRect, associations) {
	var nObjects = associations.length;
	var ap = getPoints(0, startRect, RADIUS, nObjects);
	//console.log("angles " + ap.angles);
	var rect = [];
	for(var i=0; i<nObjects; i++) {
		rect[i] = newRect(associations[i].id, ap.points[i], BASE_WIDTH, BASE_HEIGHT, getColorConcern(associations[i].concern), associations[i].title,  associations[i].type, 1);
		//console.log("(" + associations[i].direction + ")" + associations[i].association);
		addLineFromTo(startRect, rect[i], 'black',  associations[i].association, associations[i].direction);
		//console.log("Add Line :" + startRect.id + " - " + rect[i].id);
	}
}


// add associated objects for an Activity
// Note assumption that types order is the same as actions
function addActivities(startRect, response) {
	var linkName;
	var nObjects = response.actions.length;
	var ap = getPoints(0, startRect, RADIUS, nObjects);
	var rect = [];
	for(var i=0; i<nObjects; i++) {
		rect[i] = newRect(response.actions[i].element, ap.points[i], BASE_WIDTH, BASE_HEIGHT, getColorConcern(response.concern), response.actions[i].elementName,  response.types[i], 1)
		linkName = response.actions[i].how + " " + response.actions[i].stateName;
		addLineFromTo(startRect, rect[i], 'black',  linkName, ">");
		console.log("Add Line :" + startRect.id + " - " + rect[i].id + " - " +linkName);
	}
}

function delBox() {
	if (mySel != null) {
		mySel.drawMe = false;
		var n = mySel.assoclines.length;
		//console.log("My Sel: " + mySel.id+ " " + n);
		for (var i = 0; i < n; i++) { 
			//console.log("i: " + i);
			mySel.assoclines[i].drawMe = false;
		};
		invalidate();
	}
}

function getColorConcern(colorString) {
	var color;
	switch (colorString) {
		case "enterprise":
			color = PINK;
			break	
		case "customer":
			color = GREEN;
			break		
		case "solution":
			color = YELLOW;
			break;
		case "endeavour":
			color = BLUE;
			break;
	}
	return color;
}


