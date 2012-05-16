$(document).ready(function() {
  if(window.location.pathname == '/') {
    $('ul.tabs > li:nth-child(3)').after("<li><a href=\"#\" id=\"toggle-issue\">Toggle Issues/Wiki</a></li>")
    $('ul.tabs > li:nth-child(3)').after("<li><a href=\"#\" id=\"toggle-actions\">Toggle Actions</a></li>")
    $('ul.tabs > li:nth-child(3)').after("<li><a href=\"#\" id=\"toggle-watches\">Toggle Watches</a></li>")
  }

  // hide all issue/wiki stuff
  $('#toggle-issue').live('click', function(e, clicked) {
    if($('.issues_comment:visible, .issues_reopened:visible, .issues_closed:visible, .gollum:visible').length) {
      $('.issues_comment').hide();
      $('.issues_reopened').hide();
      $('.issues_closed').hide();
      $('.gollum').hide();
    }
    else {
      $('.issues_comment').show();
      $('.issues_reopened').show();
      $('.issues_closed').show();
      $('.gollum').show();
    }

  });

  // hide all action related stuff
  $('#toggle-actions').live('click', function(e, clicked) {
    if($('.push:visible, .create:visible, .delete:visible').length) {
      $('.push').hide();
      $('.create').hide();
      $('.delete').hide();
    }
    else {
      $('.push').show();
      $('.create').show();
      $('.delete').show();
    }
  });

  $('#toggle-watches').live('click', function(e, clicked) {
    if($('.alert:not(.watch_started):visible').length) {
      $('.alert:not(.watch_started)').hide();
    }
    else {
      $('.alert:not(.watch_started)').show();
    }
  });

});
