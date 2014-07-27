$(document).ready(function() {
  $(".closeDriveCheckbox").bind('change', function(){
    if (this.checked){
      alert("Closing another year's adopt a family gift drive. You guys are amazing people!");
      $.ajax({
        url: '/drives/'+this.value+'/close_drive',
        type: 'PUT',
        data: {"status": true},
      });
    }
    else {
      alert("Reopening your drive? Contact me if you need a hand.");
     $.ajax({
      url: '/drives/'+this.value+'/close_drive',
      type: 'PUT',
      data: {"status": false}
    });
   }
 });

  $(".makeFamilyLiveCheckbox").bind('change', function(){
    // alert(this);
    if (this.checked){
      $.ajax({
        url: '/families/'+this.value+'/toggle_live_status',
        type: 'PUT',
        data: {"is_live": true},
      });
    }
    else {
     $.ajax({
      url: '/families/'+this.value+'/toggle_live_status',
      type: 'PUT',
      data: {"is_live": false}
    });
   }
 });

});
