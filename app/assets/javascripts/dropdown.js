$("#region-select").on("change", function(event) {
  alert('We made it here')
  // var request = $.ajax({
  //   type: "GET",
  //   url: "locations/update_countries"
  //   data: { country_id: 8 },
  // });
  // request.success(function(data) {
  //   var review = $("#review"+reviewId);
  //   var upcount = review.find(".up-count");
  //   var downcount = review.find(".down-count");
  //   var message = review.find(".ajax-message");
  //   var initialMessage = review.find(".initial-message");
  //   upcount.text(data.up);
  //   downcount.text(data.down);
  //   initialMessage.hide();
  //   message.text("Thanks for your vote ");
  //   message.append(showDelete(data.voteId, reviewId));
  // });
  // request.error(function() {
  //   var review = $("#review"+reviewId);
  //   var message = review.find(".ajax-message");
  //   message.text("You must sign in to vote");
  // });
});
