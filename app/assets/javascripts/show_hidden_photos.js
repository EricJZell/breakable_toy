$("#show-hidden-photos").on("click", function(event) {
  event.preventDefault();
  $(".profile").hide();
  $(".main-container").css("background-color", "black");
  $(".hidden").show();
});

$("#hide-photos").on("click", function(event) {
  event.preventDefault();
  $(".profile").show();
  $(".main-container").css("background-color", "#EFEFEF");
  $(".hidden").hide();
});
