$('#btn-1').mouseover(function() {
  showVideo('1');
});
$('#btn-2').mouseover(function() {
  showVideo('2');
});
$('#btn-3').mouseover(function() {
  showVideo('3');
});
$('#btn-4').mouseover(function() {
  showVideo('4');
});

function showVideo(videoId){
  $('.Video').css('display', 'none');
  $('#video-'+videoId).css('display', 'block');
}
