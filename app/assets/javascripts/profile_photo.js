var width = $('.profile-photo').width();
$('.profile-photo').css({'height':width+'px'});
window.onresize = function() {
  width = $('.profile-photo').width();
  $('.profile-photo').css({'height':width+'px'});
};
