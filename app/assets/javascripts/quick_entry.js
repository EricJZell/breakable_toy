if($("#quick-entry").length){
  var initialLocation;
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      $("#entry_latitude").val(position.coords.latitude);
      $("#entry_longitude").val(position.coords.longitude);
      $(".button").show();
      $(".loading").hide();
    }, function(positionError) {
      $(".loading").text(
        "Browser denied access to location data. Turn on location services for\
         your browser to use the quick-entry feature.");
      alert(positionError.message)
    });
  }
  else {
    alert("Sorry, geolocation is not supported by your broswer");
  }
}
