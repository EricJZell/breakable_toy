$("#region-select").on("change", function() {
  //alert('We made it here');
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
