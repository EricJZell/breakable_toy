function getLocation() {
  var initialLocation;
  var siberia = new google.maps.LatLng(60, 105);
  var newyork = new google.maps.LatLng(40.69847032728747, -73.9514422416687);
  var myOptions = {
    zoom: 12,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("current-location"), myOptions);
  var marker = new google.maps.Marker( {position: newyork, map: map} );
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      $("#entry_latitude").val(initialLocation.lat());
      $("#entry_longitude").val(initialLocation.lng());
      map.setCenter(initialLocation);
      marker.setPosition(initialLocation);
    }, function(positionError) {
      map.setCenter(newyork);
      alert(positionError.message);
    });

  }
  else {
    map.setCenter(newyork);
    alert("Sorry, geolocation is not supported by your browser")
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

  marker.setMap( map );
  map.setOptions({styles: styles});
  google.maps.event.addListener(map, "click", function (event) {
    var latitude = event.latLng.lat();
    var longitude = event.latLng.lng();
    marker.setPosition( new google.maps.LatLng( latitude, longitude ) );
    $("#entry_latitude").val(latitude);
    $("#entry_longitude").val(longitude);
  });
}
if($("#current-location").length){
  google.maps.event.addDomListener(window, "load", getLocation);
}
