
// THIS CODE WILL HAVE A LINK OPEN IN A NEW POPUP
$('a[data-popup]').live('click', function(e) {
  window.open($(this)[0].href);
     e.preventDefault();
  });