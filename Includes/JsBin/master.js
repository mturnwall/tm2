$(document).ready(function () {
  $('#offScreenToggle').bind('click', function (e) {
    e.preventDefault();
    $('.off-screen').toggleClass('on-screen');
    return false;
  });
});