const toggleBt = document.querySelector('.navbar_toggleBt');
const menu = document.querySelector('.navbar_menu');

toggleBt.addEventListener('click', () => {
    menu.classList.toggle('active');
});