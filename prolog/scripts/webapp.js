
let allAlphas = null;
let collapseSingle = true;
let projectList = "";
let currentProject = "default";
let chosenProject = "";
let canvasCleared = true;
let stoppedCanvas = false;
let concerns = ["organisation", "customer", "solution", "endeavour"];



$(document).ready(function () {
	$('.alpha-card').hide();
	$('.competency-card').hide();
	$('.role-card').hide();
	$('.activityspace-card').hide();
	$('.activity-card').hide();
	$('.wp-card').hide();
	$('.pattern-card').hide();
	$('.alpha-all-card').hide();

	getAllLists();
	canvasEvents();
	projectEvents();
	makeAlphaEvents();
	makeAllConcerns();

	// Collapse all accordians
	$('#collapseAll').click(function (event) {
		$('.accordion-collapse').collapse('hide');
	})	
	
	// open a detail window on document detail
	$('.openResourceBtn').click(function (event) {
		openResource(event.target.getAttribute("detail"));
	});

	// Accordian Single Multi has been checked
	$('#toggleAcc').click(function (event) {
		if (event.target.checked) {
			collapseSingle = true;
			$('#AccordianToggle').text("Single View");
		}
		else {
			collapseSingle = false;
			$('#AccordianToggle').text("Multiple Views");
		}
		//console.log("Single-Multi " + collapseSingle);
	});

	// CHECKBOX a State or Detail Check Box has been checked
	$('.checkSpace').click(function (event) {
		var index = parseInt(event.target.getAttribute("checkIndex"));
		var detailID = event.target.getAttribute("detailID");
		var elementID = event.target.getAttribute("elementID");
		if (event.target.checked) {
			store_status_check(currentProject, index, elementID, detailID,"check");
		}
		else {
			store_status_check(currentProject, index, elementID, detailID,"uncheck" );
		}
	});

	// SHOW ALL Alphas button pressed
	$('#showAllAlpha').click(function (event) {
		showAllAlphas();
	});

	// SEARCH  button  has been pressed
	$('#searchBtn').click(function (event) {
		let txt = $('#searchField').val();
		processSearch(txt);
		//console.log("ProcessSearch: " + txt );
	});

	// Pressed a top radio button to show elements in one of 3 concerns
	// where id is the type of element
	$('.elementChoice').click(function (event) {
		let id = event.target.getAttribute("id");
		if (id != null) {
			if (collapseSingle) {
				$('.accordion-collapse').collapse('hide');
			}
			showElementsInConcern(id);
		}
	});


	// CONCERN - a button inside the 3 concerns has been pressed
	$('.concernButtons').click(function (event) {
		let id = event.target.getAttribute("elementID");
		let elementTypeID = event.target.getAttribute("elementType");
		if (id != null) {
			displayConcernElement(elementTypeID, id);
		}
	});

	$('.stateBtnCol').click(function (event) {
		let alphaID = event.target.getAttribute("alphaID");
		let stateID = event.target.getAttribute("stateID");
		if (id != null) {
			getElementDetail(currentProject, alphaID, stateID, processState);
		}
	});

	$('.activitySpaceBtnCol').click(function (event) {
		let id = event.target.getAttribute("elementID");
		$('#collapseActivity').collapse('show');
		if (id != null) {
			getActivity(id);
			$('.activity-card').show();
		}
	})

	$('.activityBtnCol').click(function (event) {
		let txt = event.target.innerText;
		$('#collapseActivity').collapse('show');
		if (id != null) {
			processSearch(txt);
		}
	})

	$('.activitySpaceBtnLink').click(function (event) {
		let txt = event.target.innerText;
		$('#collapseActivity').collapse('show');
		if (id != null) {
			processSearch(txt);
		}
	})
	
	$('.practiceBtnCol').click(function (event) {
		let txt = event.target.innerText;
		$('#collapseActivity').collapse('show');
		if (id != null) {
			processSearch(txt);
		}
	})

	$('.wpDetailBtnCol').click(function (event) {
		let wpID = event.target.getAttribute("elementID");
		let detailID = event.target.getAttribute("detailID");
		if (id != null) {
			getElementDetail(currentProject, wpID, detailID, processWPDetail);
		}
	});

	$('#compDetailBtnCol').click(function (event) {
		 let competencyID = event.target.getAttribute("elementID");
		 let levelID = event.target.getAttribute("detailID");
		 if (id != null) {
		 	getElementDetail(currentProject, competencyID, levelID, processCompDetail);
		 }
	});

	/* the competency button in a role */
	$('.roleButtons').click(function (event) {
		let id = event.target.getAttribute("elementID");
		if (id != null) {
			getCompetency(id);
			$('.competency-card').show();
		}
	});
});


/*********************************************
*                 DISPLAY CONCERNS           *
**********************************************/

function showElementsInConcern(id) {
	// store the global state
	elementState = id;
	//emptyAll(['.customer-card','.solution-card','.endeavour-card']);
	// ['enterprise-card', 'customer-card', 'solution-card', 'endeavour-card']
	const emptyArray = concerns.map(item => {
			item = '.'+ item +'-card';
    		return item;
	})
	console.log(emptyArray);
	emptyAll(emptyArray);

	/* get the filter list */
	const params = new URLSearchParams();
	$('.dropdown-item-checked').each((index, element) => {
		console.log('Filter : ' + element.id); 
		params.append('pts', element.id);
	})
	//console.log('Filter N : ' + params.size); 

	switch (id) {
		case "alpha":
			concerns.forEach((concern) => { getConcernElements(concern, "alpha", params, processConcernAlphas) });
			$('#collapseAlpha').collapse('show');
			break;
		case "competency":
			concerns.forEach((concern) => { getConcernElements(concern, "competency", params, processConcernCompetencies) });
			concerns.forEach((concern) => { getConcernElements(concern, "role", params, processConcernRoles) });
			$('#collapseCompetency').collapse('show');
			break;
		case "activity_space":
			concerns.forEach((concern) => { getConcernElements(concern, "activity_space", params, processConcernActivitySpace) });
			$('#collapseActSpace').collapse('show');
			break;
		case "activity":
			concerns.forEach((concern) => { getConcernElements(concern, "activity", params, processConcernActivities) });
			$('#collapseActivity').collapse('show');
			break;
		case "work_product":
			concerns.forEach((concern) => { getConcernElements(concern, "work_product", params, processConcernWorkProducts) });
			$('#collapseWorkProd').collapse('show');
			break;
		case "pattern":
			concerns.forEach((concern) => { getConcernElements(concern, "pattern", params, processConcernPattern) });
			$('#collapsePattern').collapse('show');
			break;
		case "resource":
			concerns.forEach((concern) => { getConcernElements(concern, "resource", params, processConcernResource) });
			break;	
	}
}


/* CONCERN - a button inside the 3 concerns view  has been pressed */
/* Display an Element type with ID and Show the Element card within an accordian, the 'Element'-card */
function displayConcernElement(elementTypeID,id) {
	switch (elementTypeID) {
		case "alpha":
			getAlpha(id, "#alpha-1", true);
			$('.alpha-card').show();
			$('#collapseAlpha').collapse('show');
			break;
		case "competency":
			getCompetency(id);
			$('.competency-card').show();
			$('#collapseCompetency').collapse('show');
			break;
		case "role":
			getRole(id);
			$('.role-card').show();
			$('#collapseCompetency').collapse('show');
			break;
		case "activity_space":
			getActivitySpace(id);
			$('.activityspace-card').show();
			$('#collapseActSpace').collapse('show');
			break;
		case "activity":
			getActivity(id);
			$('.activity-card').show();
			$('#collapseActivity').collapse('show');
			break;
		case "work_product":
			getWP(id);
			$('.wp-card').show();
			$('#collapseWorkProd').collapse('show');
			break
		case "pattern":
			getPattern(id);
			$('.pattern-card').show();
			$('#collapsePattern').collapse('show');
			break;
		case "resource":
			getResource(id);
			break;
	}
}


/********************************************
*                 ALPHAS                    *
*********************************************/

const addAlphasToList = (response) => {
	allAlphas = response.ids;
	addDropItemTarget("#alphaList", response);
}

/***   Show all the alphas on page  ***/
function showAllAlphas() {
	let row = 1;
	let cc = 1;
	$('<div />', { 'class': 'form-group row py-3 alpha-all-card' }).attr('id', 'row-1').appendTo('.accordion-body');

	let n = allAlphas.length / 2 + 2;
	for (let i = 2; i < n; i++) {
		$('#row-1').clone().attr('id', 'row-' + i).appendTo('.accordion-body');
	}

	let number = allAlphas.length + 2;
	for (let i = 2; i < number; i++) {
		$('#alpha-1').clone().attr('id', 'nalpha-' + i).appendTo('#row-' + row);
		$('<div />', { 'class': 'col-md-2' }).appendTo('#row-' + row);
		if (++cc == 3) {
			row++;
			cc = 1;
		}
	}

	cc = 2;
	allAlphas.forEach((anAlphaID) => {
		getAlpha(anAlphaID, '#nalpha-' + cc, false);
		cc++;
	});

	$('.alpha-all-card').show();
}

/* called from FETCH with web response */
const processConcernAlphas = (response, concern) => {
	response.ids.forEach((alphaID, index) => {
		addElementToConcern(alphaID, 'alpha', response.names[index], concern, 'alpha.png');	
	});
}

function getAlpha(id, topElement, showState) {
	const input = { key: id, top: topElement, show: showState };
	getElement(input, populateAlpha);
}

// the top is the ID of the Element
const populateAlpha = (response, input) => {
	target = $(input.top);
	target.find('.stateBtnCol').empty();
	target.find("#alphaPointsList").empty();
	target.find('#alphaAssociations').empty();
	target.find('#alphaParent').empty();
	target.find('#alphaDescriptionTxt').empty();
	target.find('#alphaResourceBtn').empty();
	target.find('#alphaPrompt').empty();

	target.find("#alphaTitle").text(response.title);
	response.states.forEach((stateID, index) => { addState(target, response.id, stateID, response.names[index]); });
	addParaToTarget(target, '#alphaDescriptionTxt', response.description);
	addPointsTarget(target, '#alphaPrompt', response.prompt , "#alphaPointsList", response.points );
	response.associations.forEach((item) => { addPointTarget(target, '#alphaAssociations', item); });
	target.find("#alphaParent").text(response.parent);
	showResources("#alphaResourceBtn", response.resources);
	colorConcernTarget('alpha', response.concern, input.top);
	// show the first state
	if (input.show) {
		getElementDetail(currentProject, response.id, response.states[0], processState);
	}
	drawOnCanvas(response.id, response.title, response.concern, 'alpha');
}


/*************************  ALPHA STATES  *****************************
*****************   Create A State Card wth check boxes **************/

const processState = (response) => {
	emptyAll(['.checkSpace','#state_description']);
	$("#stateTitle").text(response.state);
	addPara("#state_description", response.description);

	response.checks.forEach((checkTxt,index) => {
		addCheck(checkTxt, response.id, response.detailID, index, 'alpha', '.checkStateDetail', response.checked.includes(index));
	});
	colorConcern('alpha', response.concern);
}


/**************************************************
*                 COMPETENCIES                    *
***************************************************/

const addCompetenciesToList = (response) => {
	addDropItemTarget("#competencyList", response);
}

/* called from FETCH with web response */
const processConcernCompetencies = (response, concern) => {
	response.ids.forEach((compID, index) => {
		addElementToConcern(compID, 'competency', response.names[index], concern, 'competency.svg');
	});
}


/*****************   Create A Competency Card  **************/

function getCompetency(id) {
	const input = { key: id };
	getElement(input, populateCompetency);
}

const populateCompetency = (response, input) => {
	emptyAll(['#orderedLevels','#compDetailBtnCol']);
	$("#competencyTitle").text(response.title);
	$('#competencySummary').text(response.description);

	response.levels.forEach((levelID, index) => {
		var name = index+ ' - ' + response.names[index];
		addElementDetail('#compDetailBtnCol', response.id, levelID, name); 
	});
	colorConcern('competency', response.concern);
}

function addLevel(point) {
	listbit = $('<li />', { text: point });
	$('#orderedLevels').append(listbit);
}


/* ****************   Add a Competency level detail description  ************* */

const processCompDetail = (response) => {
	emptyAll(['#typeDescription', '#levelDescription']);
	$("#typeDescription").text(response.typeDescription);
	$("#levelDescription").html(response.name + ' : '+ response.levelDescription);
}


/********************************************
*                 ROLES                     *
*********************************************/
const addRolesToList = (response) => {
	addDropItemTarget("#roleList", response);	
}

/* called from FETCH with web response */
const processConcernRoles = (response, concern) => {
	response.ids.forEach((roleID, index) => {
		addElementToConcern(roleID, 'role', response.names[index], concern, 'role.svg');
	});
}

 
/*****************   Create A ROLE Card  **************/

function getRole(id) {
	const input = { key: id };
	getElement(input, populateRole);
}

const populateRole = (response) => {
	emptyAll(['.roleButtons','#rolePrompt','#rolePointsList','#roleAssociations','#roleDescriptionTxt']);

	$("#roleTitle").text(response.title);
	addPara('#roleDescriptionTxt', response.description);
	addPoints('#rolePrompt', response.prompt, '#rolePointsList', response.points )
	response.competencies.forEach((level, index) => {
		addButton('.roleButtons', response.compids[index], level,'competency.svg'); 
	});
	response.associations.forEach((item) => { addPoint('#roleAssociations', item); });
	colorConcern('role', response.concern);
}


/***************************************************
*                 ACTIVITY SPACES                  *
****************************************************/

const addActSpacesToList = (response) => {
	addDropItemTarget("#activitySpaceList", response);	
}

/* called from FETCH with web response */
const processConcernActivitySpace = (response, concern) => {
	response.ids.forEach((actID, index) => {
		addElementToConcern(actID, 'activity_space', response.names[index], concern, 'activity_space.png');
	});
}


/*****************   Create An Activity Space Card  **************/

function getActivitySpace(id) {
	const input = { key: id };
	getElement(input, populateActivitySpace);
}

const populateActivitySpace = (response, input) => {
	emptyAll(['#activitySpacePointsList','#activitySpaceInputs','#activitySpaceEntry','#activitySpaceCompletion','.actBtnCol',
	 	'.activitySpaceBtnCol','#activitySpaceDescriptionTxt','#activitySpacePrompt']);

	$("#activitySpaceTitle").text(response.title);
	addPara('#activitySpaceDescriptionTxt', response.description);
	addPoints('#activitySpacePrompt', response.prompt, '#activitySpacePointsList', response.points )
	$('#activitySpaceInputs').text(toComma(response.inputs));
	response.entry.forEach((item) => { addPoint('#activitySpaceEntry', item); });
	response.completion.forEach((item) => { addPoint('#activitySpaceCompletion', item); });
	colorConcern('act-space', response.concern);

	getActivitySpaceActivities(input.key);
}


function processActivitySpaceButtons(response) {
	response.activityIDs.forEach((id, index) => {
		addButton('.activitySpaceBtnCol', id, response.names[index],'activity.png'); 
	})
	colorConcern('act-space', response.concern);
}


/************************************************
*                 ACTIVITIES                    *
*************************************************/

const addActivitiesToList = (response) => {
	addDropItemTarget("#activityList", response);	
}
/* called from FETCH with web response */
const processConcernActivities = (response, concern) => {
	response.ids.forEach((actID, index) => {
		addElementToConcern(actID, 'activity', response.names[index], concern, 'activity.png');
	});
}

/*****************   Create An Activity Card  **************/

function getActivity(id) {
	const input = { key: id };
	getElement(input, populateActivity);
}

const populateActivity = (response, input) => {
	emptyAll(['#activityPointsList','#activitySpaceLink','#activityEntry','#activityAchieves','#activityContributes','.activityBtnCol',
		'#activityDescriptionTxt','#activityAssociations','#activityPrompt']);
	$("#activityTitle").text(response.title);
	addPara('#activityDescriptionTxt', response.description);
	addButton('#activitySpaceLink', response.activityspaceid, response.activityspace, get_imageName('activity_space'));
	addPoints('#activityPrompt', response.prompt, '#activityPrompt', response.points );

	response.entry.forEach((item) => { addPoint('#activityEntry', item); });
	if (response.competencies != null) {
		$('#activityCompetencies').text("Competencies: " + toComma(response.competencies));
	}
	if (response.roles != null) {
		$('#activityRoles').text("Roles: " + toComma(response.roles));
	}
	response.achieves.forEach((item) => { addPoint('#activityAchieves', item); });
	response.contributes.forEach((item) => { addPoint('#activityContributes', item); });
	response.associations.forEach((item) => { addPoint('#activityAssociations', item); });

	processActivityButtons(response);
	colorConcern('activity', response.concern);
	drawActivityDiagram(response);
}

/********       Activity Link Buttons      *******/
function processActivityButtons(response) {
	response.links.forEach((id, index) => {
		addButton('.activityBtnCol', id, response.names[index],get_imageName(response.types[index])); 
	})
}

/********       Activity Diagram      *******/
// 															this is wrong XXXXXXX
function drawActivityDiagram(response) {

	var start = startDraw(response.id, response.title, response.concern, 'activity', 3); 
	var box = findBox(response.id);	
	addActivities(box, response);
}

/*************************************************
*                 WORK PRODUCTS                  *
**************************************************/

const addWPsToList = (response) => {
	addDropItemTarget("#wpList", response);	
}

/* called from FETCH with web response */
const processConcernWorkProducts = (response, concern) => {
	response.ids.forEach((wpID, index) => {
		addElementToConcern(wpID, 'work_product', response.names[index], concern, 'work_product.png');
	});
}


/**********      get an WP     ********/
function getWP(id) {
	const input = { key: id };
	getElement(input, populateWP);
}

const populateWP = (response, input) => {
	emptyAll(['.wpDetailBtnCol','#wpDescriptionTxt','#wpResourceBtn','#wpPrompt','#wpPointsList']);
	$("#wpTitle").text(response.title);
	response.details.forEach((detailID, index) => {
		addElementDetail('.wpDetailBtnCol', response.id, detailID, response.names[index]); 
	});

	addPara("#wpDescriptionTxt", response.description);
	addPoints('#wpPrompt', response.prompt, '#wpPointsList', response.points )
	showResources("#wpResourceBtn", response.resources);
	$("#wpAlpha").text("Describes Alpha:  " + response.alpha);
	// show the first detail
	getElementDetail(currentProject, response.id,response.details[0], processWPDetail);
	colorConcern('competency', response.concern);
}

/* ****************   Create a WP detail Card wth check boxes ************* */

const processWPDetail = (response) => {
	emptyAll(['.checkWPDetail','#wpDetailDescriptionTxt','#wpdPrompt','#wpdPointsList']);
	$("#wpDetailTitle").text(response.detail);
	addPoints('#wpdPrompt', response.prompt, '#wpdPointsList', response.points )
	$("#wpDetail_option").html(firstToUpper(response.mandatory));
	addPara("#wpDetailDescriptionTxt", response.description);

	response.checks.forEach((checkTxt,index) => {
		addCheck(checkTxt, response.id, response.detailID, index, 'work_product', '.checkWPDetail', response.checked.includes(index));
	});
	colorConcern('wp', response.concern);
}


/********************************************
*                 PATTERN                   *
*********************************************/

const addPatternsToList = (response) => {
	addDropItemTarget("#patternList", response);	
}

const processConcernPattern = (response, concern) => {
	response.ids.forEach((id, index) => {
		addElementToConcern(id, 'pattern', response.names[index], concern, 'pattern.png');
	});
}

/*****************   Create A Pattern Card  **************/

function getPattern(id) {
	const input = { key: id };
	getElement(input, populatePattern);
}

const populatePattern = (response, input) => {
	emptyAll(['#patternDescriptionTxt','#patternAssociations','#patternResourceBtn']);

	$("#patternTitle").text(response.title);
	addPara('#patternDescriptionTxt', response.description);
	
	showResources("#patternResourceBtn", response.resources);

	$('#patternType').text("Type:  " + firstToUpper(response.type));
	response.associations.forEach((item) => { addPoint('#patternAssociations', item); });
	colorConcern('act-space', response.concern);
};

/********************************************
*                 PRACTICE                 *
*********************************************/

const addPracticeToList = (response) => {
	addDropItemTarget("#practiceList", response);
	addDropFilterItem("#practiceFilterList", response);
	addDropItemTarget("#editPracticeList", response);
}

function getPractice(id) {
	const input = { key: id };
	getElement(input, populatePractice);
}

const populatePractice = (response, input) => {
	emptyAll(['.alpha-pcard','.competency-pcard','.role-pcard','.activity_space-pcard','.activity-pcard',
		'.work_product-pcard','.pattern-pcard','#practiceDescriptionTxt','#practiceResourceBtn']);

	addPara('#practiceDescriptionTxt', response.description);
	showResources("#practiceResourceBtn", response.resources);

	response.elementIDs.forEach((id, index) => {
		var type = response.types[index];
		addButtonCard('.' + type + '-pcard', id, response.elementNames[index], type, get_imageName(type), response.concerns[index]);
	});
	$('#collapsePractice').collapse('show');
};


/********************************************
*                 RESOURCE                   *
*********************************************/

const processConcernResource = (response, concern) => {
	response.ids.forEach((id, index) => {
		addElementToConcern(id, 'resource', response.names[index], concern, 'pattern.png');
	});
}

function getResource(id) {
	const input = { key: id };
	getElement(input, showResource);
}

const showResource = (response, input) => {
	openResource(response.file);
}

function openResource(file) {
	var url = '/documents/' + file;
	var myWindow = window.open(url, "", "width=800,height=600");
}


/********************************************
*                 MISC                      *
*********************************************/

function drawOnCanvas(id, title, concern, type) {
	if (!stoppedCanvas) {
		// draw box in canvas
		if (canvasCleared) {
			startDraw(id, title, concern, type, 1); 
			canvasCleared = false;
		}
		else {
			var box = findBox(id);	
			if (box == null) {
				startNewDraw(id, title, concern, type, 1); 	
			}
		}
		getElementAssociations(id, drawAssocs);
	}
}

const drawAssocs = (response) => {
 	var box = findBox(response.id);
 	addAssociated(box, response.associations);
}

function processSearchElement(response) {
	//console.log("Search TYPE: " + response.type + " ID: "+ response.id)
	if (response.id != 99) {
		displayConcernElement(response.type, response.id);
	}
}


function  loadProjectDialog(data) {
	$("#projectList").empty();
	projectList = data.projects;
	//console.log("LOAD: " + projectList);
	projectList.forEach((item) => {
		$("#projectList").append('<li><a class="dropdown-item" projectID="' + item + '">' + item + '</a></li>');
	});		
	$('#load-project-modal').modal("show");
}

function showArtefact(image) {
	imagebit = $('<img />', {
		'src': '/images/'+image,
		'id' : 'image-artefact',
		'class': 'img-fluid'
	});
	$('#artefactContent').append(imagebit);
	document.getElementById('image-view').hidden=false;
}

function closeArtefact(id) {
	const element = document.getElementById('image-artefact');
	element.remove();
	document.getElementById('image-view').hidden=true;
}

function getAllLists() {
	getAllElements("alpha", addAlphasToList);
	getAllElements("competency", addCompetenciesToList);
	getAllElements("role", addRolesToList);
	getAllElements("activity", addActivitiesToList);
	getAllElements("activity_space", addActSpacesToList);
	getAllElements("work_product", addWPsToList);
	getAllElements("pattern", addPatternsToList);
	getAllElements("practice", addPracticeToList);
	elementListEvents();
}

function makeAllConcerns() {
	makeConcern('.concernButtons', 'organisation',PINK);
	makeConcern('.concernButtons', 'customer',YELLOW);
	makeConcern('.concernButtons', 'solution', GREEN);
	makeConcern('.concernButtons', 'endeavour',BLUE);
}

