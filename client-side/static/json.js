var req;
var parsedJSON;

function xhr(url) {
  req = new XMLHttpRequest();
  req.open("GET", url, false);
  req.send(null);
  req.onreadystatechange = processReqChange();
}

function xhrPost(url, params) {
  req = new XMLHttpRequest();
  req.open("POST", url, true);
  
  req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  req.setRequestHeader("Content-length", params.length);
  req.setRequestHeader("Connection", "close");

  req.send(params);
  req.onreadystatechange = function() {//Call a function when the state changes.
    if(req.readyState == 4 && req.status == 200) {
      parsedJSON = req.responseText;
    }
  }

}

function processReqChange() {
  var done = 4, ok = 200;

  if(req.readyState == done && req.status == ok) {
    parsedJSON = JSON.parse(req.responseText);
  }
  else {
    alert("Error loading page\nreq.readyState: " + req.readyState + "\nreq.status: "+req.status);
  }
}
