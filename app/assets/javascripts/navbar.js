
 window.onscroll = function() {scrollNav()};
 //document.getElementById("show_categories_navbar").onclick = function(){show_categories_navbar()};

function scrollNav(){
const navbar = document.querySelector('.navbar-wagon');
const search_nav = document.getElementById('search_nav');
const location_nav = document.getElementById('btn-location');
console.log(search_nav);
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY > window.innerHeight /2) {
        navbar.classList.add('navbar-wagon_scroll');
      } else {
        navbar.classList.remove('navbar-wagon_scroll');
      }
    });
  }
  if (search_nav) {
    window.addEventListener('scroll', () => {
      if (window.scrollY > window.innerHeight /2) {
        search_nav.classList.remove('navbar-search-show');
        location_nav.classList.remove('navbar-search-show');
      } else {
        search_nav.classList.add('navbar-search-show');
        location_nav.classList.add('navbar-search-show');
      }
    });
  }
}

function show_categories_navbar(){

  const categories_nav = document.getElementById('categories-navbar');
  categories_nav.classList.remove('categories-navbar-hide');
  console.log(categories_nav);
  if (categories_nav ) {
   window.addEventListener('scroll', () => {
     if (window.scrollY > window.innerHeight /2) {
       categories_nav.classList.remove('categories-navbar-hide');
     } else {
       categories_nav.classList.add('categories-navbar-hide');
     }
   });
  }
}


