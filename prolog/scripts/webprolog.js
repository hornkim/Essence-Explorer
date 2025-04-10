/*
*
*   FETCH HTTP CALLS
*
*/

const URL_GAES = 'http://localhost:8000/api/allElements';
const URL_GCES = 'http://localhost:8000/api/concernElements';
const URL_GE = 'http://localhost:8000/api/element';
const URL_GEASSOC = 'http://localhost:8000/api/associations';
const URL_SEARCH = 'http://localhost:8000/api/search';
const URL_ACTINSPACE = 'http://localhost:8000/api/activitesInSpace';
const URL_SETCHECK = 'http://localhost:8000/api/setCheck';
const URL_GETPJS = 'http://localhost:8000/api/getProjects';
const URL_ADDPJS = 'http://localhost:8000/api/addProject';
const URL_ADDELEMENT = 'http://localhost:8000/api/addElement';

const HEADER = {'Content-Type': 'application/json'};

function getAllElements(type, callfunction) {
	fetch(URL_GAES+ '/' + type, {
		method: 'GET',
		headers: HEADER
	      })
	      .then(response => response.json())
	      .then(data => callfunction(data))
	      .catch(error => console.error(error))
}


function getConcernElements(concern, type, params, callfunction) {
	fetch(URL_GAES+ '/' + type + '/concern/' + concern+ '?'+params, {
		method: 'GET',
		headers: HEADER
	      })
	      .then(response => response.json())
	      .then(data => callfunction(data,concern))
	      .catch(error => console.error(error))
}

/* input is an object with fields (parameters) that are passsed on to  */
/* calling function, the ID is obtained as the key */
function getElement(input, callfunction) {
	id = input.key;
	fetch(URL_GE+ '/' + id, {
		method: 'GET',
		headers: HEADER,
	})
	.then(response => response.json())
	.then(data => callfunction(data,input))
	.catch(error => console.error(error))
}

function getElementDetail(project, id, detail, callfunction) {
	fetch(URL_GE + '/' + id + '/detail/' + detail + '/project/' + project, {
		method: 'GET',
		headers: HEADER
	})
	.then(response => response.json())
	.then(data => callfunction(data))
	.catch(error => console.error(error))
}

function getElementAssociations(id, callfunction) {
	fetch(URL_GEASSOC+'/'+id, {
		method: 'GET',
		headers: HEADER,
	      })
	      .then(response => response.json())
	      .then(data => callfunction(data))
	      .catch(error => console.error(error))
}


function processSearch(txt) {
	fetch(URL_SEARCH+'/'+txt, {
		method: 'GET',
		headers: HEADER,
	      })
	      .then(response => response.json())
	      .then(data => processSearchElement(data))
	      .catch(error => console.error(error))
}

function getActivitySpaceActivities(name) {
	fetch(URL_ACTINSPACE+'/'+name, {
		method: 'GET',
		headers: HEADER,
	      })
	      .then(response => response.json())
	      .then(data => processActivitySpaceButtons(data))
	      .catch(error => console.error(error))
}


function store_status_check(name, index, elementID, detailID, action) {
	fetch(URL_SETCHECK, {
		method: 'POST',
		headers: HEADER,
		body: JSON.stringify({
			"name" : name,
			"index": index,
			"elementID": elementID,
			"detailID": detailID,
			"action": action
		})
	      })
	      .then(response => response.json())
	      .then(data => console.log(data.status))
	      .catch(error => console.error(error))
}


function load_projects() {
	fetch(URL_GETPJS)
	      .then(response => response.json())
	      .then(data => loadProjectDialog(data))
	      .catch(error => console.error(error))
}

function add_project(name) {
	fetch(URL_ADDPJS, {
		method: 'POST',
		headers: HEADER,
		body: JSON.stringify({
			"name": name
		})
	      })
	      .then(response => response.json())
	      .then(data => loadProjectDialog(data))
	      .catch(error => console.error(error))
}

function create_element(json_data, callfunction) {
	fetch(URL_ADDELEMENT, {
		method: 'POST',
		headers: HEADER,
		body: JSON.stringify(json_data)
	      })
	      .then(response => response.json())
		  .then(data => callfunction(data))
		  .catch(error => console.error(error))
}

