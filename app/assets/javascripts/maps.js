function initialize() {
  var locations = $("#map-canvas").data("locations");
  var center = $("#map-canvas").data("center");
  var zoom = $("#map-canvas").data("zoom");
  var mapProp = {
    center:center,
    zoom:zoom,
    backgroundColor: "#0e1525",
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById("map-canvas"),mapProp);
  for (var i = 0; i < locations.length; i++) {
    new google.maps.Marker({
      position:{lat: locations[i].lat, lng: locations[i].lon},
      map: map,
      title: "hello, world"
    });
  };
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
google.maps.event.addDomListener(window, "load", initialize);
