function showMap() {
  var locations = $("#entry-location").data("locations");
  var center = $("#entry-location").data("center");
  var zoom = $("#entry-location").data("zoom");
  var mapProp = {
    center:center,
    zoom:zoom,
    backgroundColor: "#0e1525",
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById("entry-location"),mapProp);
  for (var i = 0; i < locations.length; i++) {
    new google.maps.Marker({
      position:{lat: locations[i].latitude, lng: locations[i].longitude},
      map: map,
      title: "hello, world"
    });
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
}
if ($("#entry-location").length) {
  google.maps.event.addDomListener(window, "load", showMap);
}
