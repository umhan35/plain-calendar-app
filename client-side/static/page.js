var NONE = "";

var usersSelect;

init();

function init() {
  usersSelect = document.forms.main.users;
  calenderSelect = document.forms.main.events;
  populateUsers();
  selectLastActiveUser();
}

function selectLastActiveUser() {
  var url = "scripts/users.cgi?lastActiveUser";
  xhr(url);

  var result = setSelectedIndex(usersSelect, parsedJSON.name);
  if (result) {
    someUserSelected(parsedJSON.name);
  }
}

function populateUsers() {
  populateSelectElement("scripts/users.cgi", usersSelect);
}

function populateSelectElement(url, select) {
  xhr(url);
  
  for(var i = 0; i < parsedJSON.length; i++) {
    option = new Option(parsedJSON[i], parsedJSON[i]);
    appendOption(select, option);
  }
}

function populateCalender(userName) {
  var url = "scripts/calender.cgi?user=" + userName;
  xhr(url);
  
  calenderSelect.options.length = 0;
  for(var i = 0; i < parsedJSON.length; i++) {
    var event = eventToStr(parsedJSON[i] );
    option = new Option(event, event);
    appendOption(calenderSelect, option);
  }
}

function eventToStr(event) {
  return event.date + ": " + event.name + " (" + event.desc + ")";
}


/* events*/

function userSelected() {
  var chosenOptionValue = usersSelect.options[usersSelect.selectedIndex].value;

  someUserSelected(chosenOptionValue);
}

function someUserSelected(chosenOptionValue) {
  document.getElementById("newEvent").style.display = "none";
  document.getElementById("calender").style.display = "none";

  if (chosenOptionValue != NONE) {
    populateCalender(chosenOptionValue);
    document.getElementById("user").innerHTML = chosenOptionValue;
    document.getElementById("calender").style.display = "block";
    setLastActiveUser(chosenOptionValue);
  }
}

function setLastActiveUser(value) {
  xhrPost("scripts/users.cgi", "lastActiveUser=" + value);
}

function newEventClicked() {
  var nameField = document.forms.newEvent.user;
  nameField.value = document.getElementById("user").innerHTML;

  document.getElementById("newEvent").style.display = "block";
}
