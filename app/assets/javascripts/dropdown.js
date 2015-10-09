$("#region-select").on("change", function() {
  var request = $.ajax({
    method: "GET",
    url: "/countries",
    data: { region_id: $("#region-select option:selected").val() },
    dataType: "json"
  });
  request.success(function(data) {
    $("#country-select").empty();
    for (var i = 0; i < data.countries.length; i++){
      $("#country-select").append("<option value="+data.countries[i].id+">"+data.countries[i].name+"</option>");
    }
    $("#location-select").empty();
  });
});

$("#country-select").on("change", function() {
  var request = $.ajax({
    method: "GET",
    url: "/locations",
    data: { country_id: $("#country-select option:selected").val() },
    dataType: "json"
  });
  request.success(function(data) {
    $("#location-select").empty();
    for (var i = 0; i < data.locations.length; i++){
      $("#location-select").append("<option value="+data.locations[i].id+">"+data.locations[i].name+"</option>");
    }
  });
});


function initialize() {
  var locations = $("#map-canvas").data("locations");
  //debugger;
  var mapProp = {
    center:{lat: 40, lng: 290},
    zoom:1,
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
