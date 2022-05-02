
let underBar = document.getElementById("underline");
let underBarMenus = document.querySelectorAll("nav a");


function horizontalIndicator(e) {
  underBar.style.left = e.offsetLeft + "px";
  underBar.style.width = e.offsetWidth + "px";
  underBar.style.top = e.offsetTop + e.offsetHeight + "px";
}

underBarMenus.forEach((menu) =>
  menu.addEventListener("mouseover", (e) =>
    horizontalIndicator(e.currentTarget)
  )
);

function btclick(){
  window.open(href='http://gallerybaton.com/ko/exhibitions/87-the-flexible-boundaries/', 
    'newwin', 'top=175, left=820, width=300,height=300,location=yes,status=no');
}

function btclick1(){
  window.open(href='http://www.myartmuseum.kr/', 
    'newwin1', 'top=175, left=320, width=300,height=300,location=yes,status=no');
}

//로그인
let id = document.getElementById("id");
let password = document.getElementById("pw");
let login = document.getElementById("login");
let require = "@";
password.addEventListener("keyup", checkIdPassword);
id.addEventListener("keyup", checkIdPassword);

function checkIdPassword() {
  id.value.indexOf(require) != -1 && password.value.length > 5
    ? (login.disabled = false)
    : (login.disabled = true);
}


function imageclick(){
  window.open(href="exhibition.html", 'Home');
}

function imageclick1(){
  window.open(href='https://www.theartofbanksy.asia/', 'Home');
}

function imageclick2(){
  window.open(href='http://www.gncmedia.com/ko/exhibition/%EC%82%B4%EB%B0%94%EB%8F%84%EB%A5%B4-%EB%8B%AC%EB%A6%AC', 'Home');
}

function imageclick3(){
  window.open(href='https://booking.naver.com/booking/5/bizes/581868', 'Home');
}

function imageclick4(){
  window.open(href='http://www.groundseesaw.co.kr/m11.php?cate=001', 'Home');
}

function imageclick5(){
  window.open(href='http://mpxgallery.co.kr/', 'Home');
}

function imageclick6(){
  window.open(href='https://www.artforartkorea.com/', 'Home');
}

function imageclick7(){
  window.open(href='https://booking.naver.com/booking/5/bizes/592179', 'Home');
}

function imageclick8(){
  window.open(href='https://www.2gil29gallery.com/', 'Home');
}

function imageclick9(){
  window.open(href='https://booking.naver.com/booking/12/bizes/504526', 'Home');
}

function imageclick10(){
  window.open(href='https://booking.naver.com/booking/5/bizes/609924', 'Home');
}

function input(){
  
  let input = document.getElementById('in');
  let s = input.value;
  let n = s.length;
  
  let div = document.getElementById('output');
  div.innerHTML = n + '글자 / 500자';
}