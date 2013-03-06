var req;

var url = 'data.cgi?users';

main();

function main() {
  req = new XMLHttpRequest();
  req.onreadystatechange = onReadyStateExchange();
  req.open('GET', url, false)
  req.send(null);
}

function onReadyStateExchange() {
  if(req.readyState == 4) {
    if(req.status == 200) {
      dump(req.responseText);
    }
    else {
      alert("Error loading page\n");
    }
  }
}
