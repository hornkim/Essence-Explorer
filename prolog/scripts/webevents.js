
/* select a filter drop down item */
function filterEvents() {
	$('.filter-dropdown-item').click(function (event) {
		let name = event.target.text;
		let id = event.target.getAttribute("id");
		checked = $(this).hasClass('dropdown-item-checked');
		//console.log("Filter " + id  + " "+ name  + " " + checked);
		event.preventDefault();
		$(this).toggleClass('dropdown-item-checked');
	});
}

/* Canvas Buttons */
function canvasEvents() {
	
	$('#stopCanvas').click(function (event) {
		if (stoppedCanvas) {
			stoppedCanvas = false;
			$('#stopCanvas').text("Stop");
		}
		else {
			stoppedCanvas = true;
			$('#stopCanvas').text("Go");	
		}
	});

	$('#clearCanvas').click(function (event) {
		clearDiagram();
		canvasCleared = true;
	});

	$('#deleteCanvas').click(function (event) {
		delBox();
	});
}


// ******************************************
//          SHow Drop Down element Lists
// ******************************************
function elementListEvents() {
	$('#alphaList').click(function (event) {
		let id = event.target.getAttribute("elementID");
		if (id != null) {
			getAlpha(id, "#alpha-1", true);
			$('.alpha-card').show();
		}
	})

	$('#competencyList').click(function (event) {
		let id = event.target.getAttribute("elementID");
		if (id != null) {
			getCompetency(id);
			$('.competency-card').show();
		}
	});

	$('#roleList').click(function (event) {
		let id = event.target.getAttribute("elementID");
		if (id != null) {
			getRole(id);
			$('.role-card').show();
		}
	});

	$('#activitySpaceList').click(function (event) {
		let id = event.target.getAttribute("elementID");
		if (id != null) {
			getActivitySpace(id);
			$('.activityspace-card').show();
		}
	});

	$('#activityList').click(function (event) {
		let id = event.target.getAttribute("elementID");
		if (id != null) {
			getActivity(id);
			$('.activity-card').show();
		}
	});

	$('#wpList').click(function (event) {
		let id = event.target.getAttribute("elementID");
		if (id != null) {
			getWP(id);
			$('.wp-card').show();
		}
	})

	$('#patternList').click(function (event) {
		let id = event.target.getAttribute("elementID");
		if (id != null) {
			getPattern(id);
			$('.pattern-card').show();
		}
	})

	$('#practiceList').click(function (event) {
		let id = event.target.getAttribute("elementID");
		if (id != null) {
			getPractice(id);
			$('#practiceName').text(event.target.text);
			$('.practice-card').show();
		}
	})
}

// ******************************************
//          Project Events
// ******************************************
function projectEvents() {
	//Choose LOAD PROJECT FILE MENU 
	$('.load-project-item').click(function (event) {
		load_projects();
	});

	// LOAD Project OK  button  has been pressed
	$('#loadProjectOKBtn').click(function (event) {
		currentProject = chosenProject;
		showProject(currentProject);
		//console.log("Loaded Project: " + currentProject );
	});

	$('#projectList').click(function (event) {
		let id = event.target.getAttribute("projectID");
		chosenProject = id;
	});

	//Choose NEW PROJECT FILE MENU 
	$('.new-project-item').click(function (event) {
		$('#new-project-modal').modal("show");
	});

	// NEW Project OK  button  has been pressed
	$('#newProjectOKBtn').click(function (event) {
		currentProject = document.getElementById("newProjectTxt").value;
		//console.log("New Project: " + currentProject );
		add_project(currentProject); 
		showProject(currentProject);
	});
}

// ******************************************
//          Edit Buttons
// ******************************************
function makeAlphaEvents() {
	$('#createAlpha').click(function (event) {
		let id = event.target.getAttribute("alphaID");
		let name = event.target.getAttribute("alphaName");
		let desc = event.target.getAttribute("alphaDesc");
		let states = event.target.getAttribute("stateNames");
		if (id != null) {
		}
	})
}