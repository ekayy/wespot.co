$(function(){
  var $container = $('#grid');

  $container.imagesLoaded(function () {
    // $('#container').show();
    // $('#loading').hide();
    $container.isotope({
      itemSelector : '.gridItem'
    });
  });



  // $container.infinitescroll({
  //   navSelector  : '.pagination',    // selector for the paged navigation
  //   nextSelector : '.pagination a',  // selector for the NEXT link (to page 2)
  //   itemSelector : '.box',     // selector for all items you'll retrieve
  //   extraScrollPx:50,
  //   loading: {
  //       img: 'http://i.imgur.com/qkKy8.gif',
  //     }
  //   },
  //   // call Isotope as a callback
  //   function(newElements) {
  //     var $newElems = $(newElements);
  //     $newElems.imagesLoaded(function(){
  //       $container.isotope('appended', $newElems );
  //     });
  //   }
  // );
});