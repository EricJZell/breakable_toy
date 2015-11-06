if ($(".owl-carousel").length) {
  $(".owl-carousel").owlCarousel({
    navigation : true, // Show next and prev buttons
    slideSpeed : 300,
    paginationSpeed : 400,
    singleItem:true
  });
}

$('#photo_file_name').change(function() {
  $('#add-photo').show();
});
