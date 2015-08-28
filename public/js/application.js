$(document).ready(function() {

// REGISTER FORM
  $("form[action='/register']").toggle();

  $("#register").on("click", function(){
    $("form[action='/register']").toggle();
  });

// LOG IN FORM
  $("form[action='/log_in']").toggle();

  $("#log_in").on("click", function(){
    $("form[action='/log_in']").toggle();
  });

// ADD NEW PROPERTY FORM
  $("form[action='/add_new_property']").toggle();

  $("#add_new_property").on("click", function(){
    $("form[action='/add_new_property']").toggle();
  });


});
