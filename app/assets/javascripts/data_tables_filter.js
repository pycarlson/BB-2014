$(function(){
  if ($("input[name='option']:checked").val() == 'adoptions') {
      $('.adoptions-partial').show();
    }
  $("input[name='option']").change(function() {
    $('.manage-table').hide();
    if ($("input[name='option']:checked").val() == 'families') {
      $('.families-partial').show();
    }
    if ($("input[name='option']:checked").val() == 'adoptors') {
      $('.donors-partial').show();
    }
    if ($("input[name='option']:checked").val() == 'users') {
      $('.users-partial').show();
    }
    if ($("input[name='option']:checked").val() == 'adoptions') {
      $('.adoptions-partial').show();
    }

  });
});