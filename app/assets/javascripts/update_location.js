// function initialize() {
//   var mapDiv = $("#update-location");
//   var center = { lat: mapDiv.data().lat, lng: mapDiv.data().lon }
//   var myOptions = {
//     zoom: 12,
//     center: center,
//     mapTypeId: google.maps.MapTypeId.ROADMAP
//   };
//   var map = new google.maps.Map(document.getElementById("update-location"), myOptions);
//   marker = new google.maps.Marker( {position: { lat: mapDiv.data().lat, lng: mapDiv.data().lon }, map: map} );
//   marker.setMap( map );
//   var styles = [
//     {
//       featureType: "road",
//       elementType: "geometry",
//       stylers: [
//         { lightness: 100 },
//         { visibility: "simplified" }
//       ]
//     },{
//       featureType: "road",
//       elementType: "labels",
//       stylers: [
//         { visibility: "off" },
//       ]
//     },{
//       featureType: "water",
//       elementType: "geometry",
//       stylers: [
//         { color: "#0e1525" }
//       ]
//     },{
//       featureType: "water",
//       elementType: "labels",
//       stylers: [
//         { color: "#ffffff" },
//         { weight: 0.1}
//       ]
//     }
//   ];
//
//   map.setOptions({styles: styles});
//   google.maps.event.addListener(map, "click", function (event) {
//     var latitude = event.latLng.lat();
//     var longitude = event.latLng.lng();
//     marker.setPosition( new google.maps.LatLng( latitude, longitude ) );
//     $("#entry_latitude").val(latitude);
//     $("#entry_longitude").val(longitude);
//   }); //end addListener
// }
// if ($("#update-location").length){
//   google.maps.event.addDomListener(window, "load", initialize);
// }
