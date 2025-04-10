
let practiceID = null;
let concernID = null;
let alphaID = null;
let actSpaceID = null;

$(document).ready(function () {

	getAllLists();

	document.addEventListener("trix-change", function (event) {
	    document.getElementById('myHtml').textContent = event.target.value;
	});
	
	// ALPHA
	document.getElementById("alphaName").addEventListener("blur", function() {
		nameToID("alphaName", "alphaID");
		document.getElementById("alphaAddResult").innerText = " ";
	    });

	document.getElementById("stateNames").addEventListener("blur", function() {
		listNamesToIDs("stateNames", "stateIDs");
		});

	// WP
	document.getElementById("wpName").addEventListener("blur", function() {
		nameToID("wpName", "wpID");
		document.getElementById("wpAddResult").innerText = " ";
	    });

	document.getElementById("checkNames").addEventListener("blur", function() {
		listNamesToIDs("checkNames", "checkIDs");
	    });
		
	// Activity
	document.getElementById("activityName").addEventListener("blur", function() {
		nameToID("activityName", "activityID");
		document.getElementById("activityAddResult").innerText = " ";
	});
		  
	
	$('#alphaElementList').click(function (event) {
		alphaID = event.target.getAttribute("elementID");
		console.log("Chosen "+alphaID);
		})

	$('#activitySpaceElementList').click(function (event) {
		actSpaceID = event.target.getAttribute("elementID");
		console.log("Chosen "+actSpaceID);
		})

	$('#editPracticeList').click(function (event) {
		practiceID = event.target.getAttribute("elementID");
		if (practiceID != null) {
			$('#editPracticeName').text(event.target.text);
		}
	})

	$('#editConcernList').click(function (event) {
		concernID = event.target.getAttribute("elementID");
		if (concernID != null) {
			$('#editConcernName').text(event.target.text);
		}
	})

	$('#createAlpha').click(function (event) {
		createAlpha();
	})

	$('#createActivity').click(function (event) {
		createActivity();
	})

	$('#createWP').click(function (event) {
		createWP();
	})

});

function createAlpha() {
	create_element( {
		"type" : "alpha",
		"practice" : practiceID,
		"concern": concernID,
		"name": $('#alphaName').val(),
		"id": $('#alphaID').val(),
		"description": $('#alphaDesc').val(),
		"detail": $('#stateNames').val().split(',').map(string => string.trim()),
		"detailIDs": $('#stateIDs').val().split(',').map(string => string.trim())
	}, processAddAlpha);
}

function createActivity() {
	create_element({
		"type" : "activity",
		"practice" : practiceID,
		"concern": concernID,
		"parentID": actSpaceID,
		"name": $('#activityName').val(),
		"id": $('#activityID').val(),
		"description": $('#activityDesc').val()
	}, processAddActivity);
}

function createWP() {
	create_element({
		"type" : "work_product",
		"practice" : practiceID,
		"concern": concernID,
		"alphaID" : alphaID,
		"name": $('#wpName').val(),
		"id": $('#wpID').val(),
		"description": $('#wpDesc').val(),
		"detail": $('#checkNames').val().split(',').map(string => string.trim()),
		"detailIDs": $('#checkIDs').val().split(',').map(string => string.trim())
	}, processAddWP);
}

//************************
//  Get Drop Down Lists
//************************
function getAllLists() {
	getAllElements("practice", addPracticeToList);
	getAllElements("alpha", addAlphasToDropDown);
	getAllElements("activity_space", addActSpacesToDropDown);
}

const addPracticeToList = (response) => {
	addDropItemTarget("#editPracticeList", response);
}
const addAlphasToDropDown = (response) => {
	allAlphas = response.ids;
	addDropItemTarget("#alphaElementList", response);
}
const addActSpacesToDropDown = (response) => {
	addDropItemTarget("#activitySpaceElementList", response);	
}

//******************************
//    Process the Add Results
//******************************
const processAddAlpha = (response) => {
	document.getElementById("alphaAddResult").innerText = "Result: to see changes: " + response.status;
}

const processAddActivity = (response) => {
	document.getElementById("activityAddResult").innerText = "Result: to see changes: " + response.status;
}

const processAddWP = (response) => {
	document.getElementById("wpAddResult").innerText = "Result: to see changes: " + response.status;
}

//******************************
//    UTILITIES
//******************************

function nameToID(inElement, outElement) {
	let name = document.getElementById(inElement).value;
	let id = name.toLowerCase().replace(/\s+/g,"_").replace(/\W/g, '');
	document.getElementById(outElement).setAttribute('value', id);
}


function listNamesToIDs(inElement, outElement) {
	let arrayNames = document.getElementById(inElement).value.split(',');
	let arrayIDs = [];
	arrayNames.forEach((name) => {
		arrayIDs.push(name.trim().toLowerCase().replace(/\s+/g,"_").replace(/\W/g, ''));
	});
	document.getElementById(outElement).setAttribute('value', arrayIDs);
}

