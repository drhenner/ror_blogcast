
$('a[data-popup]').live('click', function(e) {
  window.open($(this)[0].href);
     e.preventDefault();
  });