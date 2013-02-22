jQuery(function($) {
  'use strict';

  var App = {
    init: function() {
      this.cacheElements();
      this.bindEvents();
      this.render();
    },
    cacheElements: function() {
      this.$grid = $('#grid');
      this.$widgetGrid = $('#widgetGrid');
      this.$container = $('.container');
    },
    bindEvents: function() {
      // $('#on').on('click', this.create);
      $('#toggleGrid').on('click', this.toggleGrid);
    },
    render: function() {
      var url = this.$grid.data('json-url');
      $.getJSON(url, this.toTemplate);
    },
    toTemplate: function(photos) {
      var template = Handlebars.compile($('#grid-template').html()),
        grid = $('#grid');
      grid.html(template(photos)).isotope({
        itemSelector : '.grid-item'
      });
    },
    create: function(e) {
      App.render();
    },
    toggleGrid: function() {

      $('#grid').toggle().isotope('reLayout');
    }
  };

  App.init();

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
// });