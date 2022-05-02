var target = document.querySelectorAll('.notice2');
var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
var targetID;

// 팝업 열기
for(var i = 0; i < target.length; i++){
  target[i].addEventListener('click', function(){
    targetID = this.getAttribute('href');
    document.querySelector(targetID).style.display = 'block';
  });
}

// 팝업 닫기
for(var j = 0; j < target.length; j++){
  btnPopClose[j].addEventListener('click', function(){
    this.parentNode.parentNode.style.display = 'none';
  });
}

//마일리지 사용
function printName() {
  mileage_table = document.getElementById('mileage_table').value;
  document.getElementById('mileageoutput').innerText = mileage_table;
}
