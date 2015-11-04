if($("#quick-entry").length){
  var initialLocation;
  if(navigator.geolocation) {
    browserSupportFlag = true;
    navigator.geolocation.getCurrentPosition(function(position) {
      $("#entry_latitude").val(position.coords.latitude);
      $("#entry_longitude").val(position.coords.longitude);
      $(".button").show();
      $(".loading").hide();
    }, function(positionError) {
      alert(positionError.message)
    });
  }
  else {
    alert("Sorry, this app is not supported by your broswer");
  }
}
