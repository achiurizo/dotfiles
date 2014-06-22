
$(document).ready ()->
  unless window.location.pathname == '/'
    $('#wrapper_header').hide()
    $('#bottomchapter').hide()
    $('#wrapper_footer').hide()
