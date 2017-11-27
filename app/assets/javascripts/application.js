// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require rails-ujs
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require bootstrap
//= require select2
//= require_tree .



$("#dropdown").select2({theme: "bootstrap"});

$(document).ready(function() {
 $('.select2').select2({theme: "bootstrap"});
});

//  $(document).ready(function() {
//   $(function(){
//     $(".listingoptions").tooltip();
//   });
// });

$(function() {
 $("#datepicker").datepicker({changeMonth: true, changeYear: true, yearRange: "1900:2100"});
});

$(document).ready(function() {
 $(".owl-carousel").owlCarousel({
  loop: true,
  margin: 10,
  responsiveClass: true,
  autoplay: true,
  autoplayTimeout: 2000,
  autoplayHoverPause: true,
  responsive: {
   0: {
    items: 1,
    nav: true
   },
   600: {
    items: 3,
    nav: false
   },
   1000: {
    items: 5,
    nav: true,
    loop: true
   }
  }
 });
})
//   $( function() {
//   $( document ).tooltip();
// } );
