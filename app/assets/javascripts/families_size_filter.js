$(document).ready(function(){
  if ($("input[name='filter']:checked").val() == '5') {
    $('.fams5').show();
  }
  $("input[name='filter']").change(function() {
    $('.fams').hide();
    if ($("input[name='filter']:checked").val() == '1') {
      $('.fams1').show();
    }
    if ($("input[name='filter']:checked").val() == '2') {
      $('.fams2').show();
    }
    if ($("input[name='filter']:checked").val() == '3') {
      $('.fams3').show();
    }
    if ($("input[name='filter']:checked").val() == '4') {
      $('.fams4').show();
    }
    if ($("input[name='filter']:checked").val() == '5') {
      $('.fams5').show();
    }
  });
})