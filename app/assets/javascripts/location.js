var initialLocation;
var siberia = new google.maps.LatLng(60, 105);
var newyork = new google.maps.LatLng(40.69847032728747, -73.9514422416687);
var browserSupportFlag =  new Boolean();

function initialize() {
  var myOptions = {
    zoom: 14,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("current-location"), myOptions);
  marker = new google.maps.Marker( {position: { lat: 42.35, lng: -71.06 }, map: map} );
  marker.setMap( map );
  // Try W3C Geolocation (Preferred)
  if(navigator.geolocation) {
    browserSupportFlag = true;
    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      $("#entry_latitude").val(initialLocation.lat());
      $("#entry_longitude").val(initialLocation.lng());
      map.setCenter(initialLocation);
    }, function() {
      handleNoGeolocation(browserSupportFlag);
    });

  }
  // Browser doesn't support Geolocation
  else {
    browserSupportFlag = false;
    handleNoGeolocation(browserSupportFlag);
  }

  function handleNoGeolocation(errorFlag) {
    if (errorFlag == true) {
      alert("Geolocation service failed.");
      initialLocation = newyork;
    } else {
      alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
      initialLocation = siberia;
    }
    map.setCenter(initialLocation);
  }
  var styles = [
    {
      featureType: "road",
      elementType: "geometry",
      stylers: [
        { lightness: 100 },
        { visibility: "simplified" }
      ]
    },{
      featureType: "road",
      elementType: "labels",
      stylers: [
        { visibility: "off" },
      ]
    },{
      featureType: "water",
      elementType: "geometry",
      stylers: [
        { color: "#0e1525" }
      ]
    },{
      featureType: "water",
      elementType: "labels",
      stylers: [
        { color: "#ffffff" },
        { weight: 0.1}
      ]
    }
  ];

  map.setOptions({styles: styles});
  google.maps.event.addListener(map, "click", function (event) {
    var latitude = event.latLng.lat();
    var longitude = event.latLng.lng();
    marker.setPosition( new google.maps.LatLng( latitude, longitude ) );
    $("#entry_latitude").val(latitude);
    $("#entry_longitude").val(longitude);
  }); //end addListener

}
google.maps.event.addDomListener(window, "load", initialize);
