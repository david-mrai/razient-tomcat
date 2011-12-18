
function hideTab(index, len,lang) {

  for (var i = 0; i < len; i++) {
    var dataDiv = document.getElementById('tab' + i);
	var tabLi = document.getElementById('tab' + i + '_view');
	hideObject(dataDiv);
	tabLi.src = './css/images/menu'+lang+'/dashTab' + i + '.png';
  }
  dataDiv = document.getElementById('tab' + index);
  tabLi = document.getElementById('tab' + index + '_view');
  showObject(dataDiv);
  tabLi.src = './css/images/menu'+lang+'/dashTab' + index + '-1.png';
}

function hideSurveyTab(index, len,lang) {

  for (var i = 0; i < len; i++) {
    var dataDiv = document.getElementById('tab' + i);
	var tabLi = document.getElementById('tab' + i + '_view');
	hideObject(dataDiv);
	tabLi.src = './css/images/menu'+lang+'/surveyTab' + i + '.png';
  }
  dataDiv = document.getElementById('tab' + index);
  tabLi = document.getElementById('tab' + index + '_view');
  showObject(dataDiv);
  tabLi.src = './css/images/menu'+lang+'/surveyTab' + index + '-3.png';
}




function hideObject(dataDiv) {
  dataDiv.style.display = 'none';
}

function showObject(dataDiv) {
  dataDiv.style.display = '';
}


function showTab(tab, obj) {
	 s = document.getElementById(tab).style;
	 s.display = (s.display == "none") ? "" : "none";
	 obj.getElementsByTagName('img')[0].src = (s.display == "none") ? "./css/images/general/minus-glow.png" : "./css/images/general/plus-glow.png"; 
}