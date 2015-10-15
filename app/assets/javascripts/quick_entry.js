if($("#quick-entry").length){
  var browserSupportFlag =  new Boolean();
  var initialLocation;
  if(navigator.geolocation) {
    browserSupportFlag = true;
    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      $("#entry_latitude").val(initialLocation.lat());
      $("#entry_longitude").val(initialLocation.lng());
      $(".button").show();
      $(".loading").hide();
    }, function() {
      handleNoGeolocation(browserSupportFlag);
    });
  }
  else {
    browserSupportFlag = false;
    handleNoGeolocation(browserSupportFlag);
  }
  function handleNoGeolocation(errorFlag) {
    if (errorFlag === true) {
      alert("Geolocation service failed.");
    } else {
      alert("Your browser doesn't support geolocation");
    }
  }
}
