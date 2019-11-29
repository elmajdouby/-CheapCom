//= require rails-ujs
//= require jquery
//= require jquery-ui
//= require jquery-ui/widgets/draggable
//= require jquery-ui/widgets/sortable
//= require jquery-ui/widgets/datepicker
//= require popper
//= require bootstrap
//= require dragula
//= require data-confirm-modal
//= require_tree .

//= require components/orgchart
//= require components/member_tree
//= require components/flickity
var open = false;

function toggleMenu(clicked_id) {
  var menuElement = document.getElementById(clicked_id);
  if(open) {
    menuElement.className = 'menu';
  } else {
    menuElement.className = 'menu open';
  }

  open = !open;
}


