/* 
*
********** Utilities *******
*
*/

var GREEN = 'rgb(219, 247, 236)';
var BLUE = 'rgb(200, 220, 250)';
var YELLOW = 'rgb(249, 249, 219)';
var PINK = 'rgb(252, 235, 237)';
var PURPLE = 'rgb(201, 179, 245)';
var BROWN = 'rgb(244, 213, 166)';

function get_imageName(type) {
	imageName = type +'.png';
	if (type == 'role' ) {
		imageName = 'role.svg';
	}
	else if (type == 'competency' ) {
		imageName = 'competency.svg';
	}
	return imageName;
}

// Turns a string into a safe HTML ID by removing bad characters
function safeID(txt) {
	return txt.replace(/^[^a-z]+|[^\w:.-]+/gi, ""); 
}

function firstToUpper(str) {
	return str.charAt(0).toUpperCase() + str.slice(1);
}


// <div class="form-group row">
// 	<div class="card essence-endeavour">
//   <div class="card-body">
// 		<div class="row">Endeavour</div>
// 			<div class="row endeavour-card">
// 	  		<!-- fill with stuff-->
// 			</div>
//   	</div>
//  </div>
// </div> 
//
//  makeConcern('.concernButtons', 'endeavour')
function makeConcern(target, name, color) {

	div_top = $('<div />', { 'class': 'form-group row' });
	//div_card = $('<div />', { 'class': 'card essence-' + name });
	div_card = $('<div />', { 'class': 'card essence-' + name ,'style': 'background-color: ' + color + ';'});
	div_card_body = $('<div />', { 'class': 'card-body' });
	div_row = $('<div />', { 'class': 'row', text: firstToUpper(name)});
	div_row_card = $('<div />', { 'class': 'row ' + name +'-card' });
	$(target).append(div_top.append(div_card.append(div_card_body.append(div_row.append(div_row_card)))));
}

// create an ID by concetanating the Parent ID, Detail ID (State or Detail) 
// and checkBox index positon e.g. opportunity-identified-0
// the ID is used to easily check the boxes again.
function addCheck(checkTxt, parentID, detailID, index, elementType, target, checked ) {
	id = parentID + "-" + detailID + "-" + index;
	formdivbit = $('<div />', { 'class': 'form-check' });
	inputdata = {
		'class': 'form-check-input',
		'id': id,
		'elementID': parentID,
		'elementType': elementType, 
		'detailID' : detailID,
		'checkIndex' : index,
		type: 'checkbox',
	};
	if (checked) {
		inputdata.checked = '';
	};
	inputbit = $('<input />', inputdata );
	labelbit = $('<label />', {
		'class': 'form-check-label',
		text: checkTxt,
		for: id 
	});
	// console.log("ID : " + id);
	$(target).append(formdivbit.append(labelbit.prepend(inputbit)));
}


// Add an Item to drop down list
function addDropItemTarget(target, response) {
	response.ids.forEach((id, index) => {
		$(target).append('<li><a class="dropdown-item" elementID="' + id + '">' + response.names[index] + '</a></li>');
	});
}


// Add an Item to drop down list
// <li><a class="dropdown-item filter-dropdown-item dropdown-item-checked" id="kernel" href="#">Kernel</a></li>
function addDropFilterItem(target, response) {
	response.ids.forEach((id, index) => {
		console.log('ID: '+ id + ' Name: ' + response.names[index]);
		$(target).append('<li><a class="dropdown-item filter-dropdown-item dropdown-item-checked" id="' + id + '">' + response.names[index] + '</a></li>');
	});
	// need to add events to the drop down
	filterEvents(); 
}


function addParaToTarget(target, id, items) {
	items.forEach((txt, index) => {
		target.find(id).append('<p>' + txt + '</p>');
	});
}

function addPara(id, items) {
	if (items != null) {
		items.forEach((txt, index) => {
			$(id).append('<p>' + txt + '</p>');
			});
	}
}

// remove elements from a container
function emptyAll(items) {
	items.forEach((i) => {$(i).empty()});
}

//##################################
//        Add POINTS
//##################################

// addPoints('#rolePrompt', response.prompt, '#rolePointsList', response.points )
function addPoints(promptTag, prompt, pointsTag, points ) {
	if (points.length > 0 ) {
		$(promptTag).text(prompt + ":");
		points.forEach((point) => { addPoint(pointsTag, point); });
	}
}

function addPoint(tag, point) {
	listbit = $('<li />', {text: point });
	$(tag).append(listbit);
}


function addPointsTarget(target, promptTag, prompt, pointsTag, points ) {
	if (points.length > 0 ) {
		target.find('#alphaPrompt').text(prompt + ":");
		points.forEach((point) => { addPointTarget(target, pointsTag, point); });
	}
}

function addPointTarget(target, tag, point) {
	listbit = $('<li />', {text: point });
	target.find(tag).append(listbit);
}

function toComma(input_list) {
	var n = input_list.length;
	var new_string = input_list[0];
	for (let i = 1; i < n; i++) {
		new_string = new_string.concat(", ").concat(input_list[i]);	
	}
	return new_string;
} 

function showProject(name) {
	$('#projectHeading').text("Project: " + name);
}


function colorConcern(type, concern) {
	let target = "." +type + "-theme";
	switch(concern) {
		case "solution":
			$(target).removeClass('themed-col-customer');
			$(target).removeClass('themed-col-endeavour');
			$(target).addClass('themed-col-solution');
			break;
		case "customer":
			$(target).removeClass('themed-col-solution');
			$(target).removeClass('themed-col-endeavour');
			$(target).addClass('themed-col-customer');
			break;
		case "endeavour":
			$(target).removeClass('themed-col-customer');
			$(target).removeClass('themed-col-solution');
			$(target).addClass('themed-col-endeavour');
			break;					
	}
}

function colorConcernTarget(type, concern, element) {
	let target = "." +type + "-theme";
	switch(concern) {
		case "solution":
			$(element).find(target).removeClass('themed-col-customer');
			$(element).find(target).removeClass('themed-col-endeavour');
			$(element).find(target).addClass('themed-col-solution');
			$(element).removeClass('themed-col-customer');
			$(element).removeClass('themed-col-endeavour');
			$(element).addClass('themed-col-solution');
			break;
		case "customer":
			$(element).find(target).removeClass('themed-col-solution');
			$(element).find(target).removeClass('themed-col-endeavour');
			$(element).find(target).addClass('themed-col-customer');
			$(element).removeClass('themed-col-solution');
			$(element).removeClass('themed-col-endeavour');
			$(element).addClass('themed-col-customer');
			break;
		case "endeavour":
			$(element).find(target).removeClass('themed-col-customer');
			$(element).find(target).removeClass('themed-col-solution');
			$(element).find(target).addClass('themed-col-endeavour');
			$(element).removeClass('themed-col-customer');
			$(element).removeClass('themed-col-solution');
			$(element).addClass('themed-col-endeavour');
			break;					
	}
}

// add the detail buttons to an Element 
function addElementDetail(thing, id, detailID, name) {
	btngrpbit = $('<div />', { 'class': 'row py-2' });
	btnbit = $('<button />', {
		'class': 'btn btn-primary',
		text: name,
		'aria-expanded': 'false',
		type: 'button py-2',
		'elementID': id,
		'detailID': detailID
	});
	spbit = $('<span />', { 'class': 'btn-label' });
	$(thing).append(btngrpbit.append(btnbit.prepend(spbit)));
}


function addState(target, id, stateID, stateName) {
	btngrpbit = $('<div />', { 'class': 'row py-2' });
	btnbit = $('<button />', {
		'class': 'btn btn-primary',
		text: stateName,
		'aria-expanded': 'false',
		type: 'button py-2',
		alphaID: id,
		stateID: stateID
	});
	spbit = $('<span />', { 'class': 'btn-label' });
	target.find('.stateBtnCol').append(btngrpbit.append(btnbit.prepend(spbit)));
}


// Add the buttons with icon to concern
function addElementToConcern(id, type, name, concern, icon) {
	btngrpbit = $('<div />', { 'class': 'col' });
	btnbit = $('<button />', {
		'class': 'btn btn-outline-primary form-control btn-block',
		'text': "  " + name,
		'aria-expanded': 'false',
		'type': 'button',
		elementType: type,
		'elementID': id
	});
	btnimg = $('<img />', {
		'src': '/images/'+icon,
		'width': 32,
		'height': 32
	});
	$('.' + concern + '-card').append(btngrpbit.append(btnbit.prepend(btnimg)));
}


// Add Buttons two different ways
function addButton(thing, id, name, icon) {
	addButtonType(thing, id, name, "", icon, 'btn btn-outline-primary','button py-2', 'row py-2');
}

function addButtonCard(thing, id, name, type, icon, concern) {
	addButtonType(thing, id, name, type, icon, 'btn btn-outline-dark form-control btn-block card-'+concern, 'button', 'col' );
}

function addButtonType(thing, id, name, type, icon, classes, buttype, coltype) {
	btngrpbit = $('<div />', { 'class': coltype });
	btnbit = $('<button />', {
		'class': classes,
		text: name,
		'aria-expanded': 'false',
		type: buttype,
		elementID: id,
		elementType: type
	});
	btnimg = $('<img />', {
		'src': '/images/'+ icon,
		'width': 32,
		'height': 32
	});
	$(thing).append(btngrpbit.append(btnbit.prepend(btnimg)));
}



// just add a Resource  button to a thing to show the filename
function addResourceButton(thing, type, file, classes) {
	const capitalised = type.charAt(0).toUpperCase() + type.slice(1)
	btnbit = $('<button />', {
		'class': classes,
		text: capitalised,
		'aria-expanded': 'false',
		'detail': file
	});
	$(thing).append(btnbit);
}

// thing  =  "#wpResourceBtn"
function showResources(thing, resources) {
	if (resources != null) {
	if (resources.length > 0 ) {
		resources.forEach((item) => {
			addResourceButton(thing, item.type, item.file, "btn btn-info me-1");
		});	
	}
	}
}







