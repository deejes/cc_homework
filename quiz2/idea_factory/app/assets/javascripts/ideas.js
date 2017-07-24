

  $(document).ready(function() {

    $('.titular').on('click', function(e) {
      $(this).next().toggleClass('hidden');
    });
  })
