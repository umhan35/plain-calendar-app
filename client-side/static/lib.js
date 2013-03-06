
function appendOption(select, newOption) {
  var optsLen = select.length;
  select.options[optsLen] = newOption;

  return optsLen;
}

function setSelectedIndex(s, v) {
  for ( var i = 0; i < s.options.length; i++ ) {
    if ( s.options[i].value == v ) {
      s.options[i].selected = true;
      return true;
    }
  }
  return false;
}

function a(b) {
  alert(b);
}
