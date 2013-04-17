jQuery(function($) {
  'use strict';

  $('form').on('click', '.remove_fields', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
    return event.preventDefault();
  });
  $('form').on('click', '.add_fields', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });

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
      $.ajaxSetup({
        cache: false
      });
    },
    bindEvents: function() {
      // $('#content').draggable({
      //   stop: function(event, ui) {
      //     $.post("",
      //       { top: ui.position["top"], left: ui.position["left"] },
      //       function() {
      //         //callback;
      //       }
      //     );
      //   }
      // }).resizable({
      //   minHeight: 150,
      //   minWidth: 200
      // });
      $('#toggleGrid').on('click', this.toggleGrid);
    },
    render: function() {
      var url = this.$grid.data('json-url');
      $.getJSON(url, this.toTemplate);
    },
    toTemplate: function(photos) {
      // var template = Handlebars.compile($('#grid-template').html()),
      var $grid = $('#grid'),
        columns;
      // $grid.html(template(photos)).imagesLoaded(
      $grid.imagesLoaded( function(){
        $('#grid').show();
        $('#loading').hide();
        $grid.isotope({
          resizable: false,
          masonry: { columnWidth: $grid.width() / columns },
          itemSelector : '.grid-item'
        });
      });
      $(window).smartresize(function(){
        $grid.isotope({
          masonry: { columnWidth: $grid.width() / columns }
        });
      });
      // $grid.infinitescroll({
      //   navSelector  : '.pagination',    // selector for the paged navigation
      //   nextSelector : '.pagination a',  // selector for the NEXT link (to page 2)
      //   itemSelector : '.grid-item',     // selector for all items you'll retrieve
      //   extraScrollPx:50,
      //   loading: {
      //       img: 'http://i.imgur.com/qkKy8.gif',
      //     }
      //   },
      //   // call Isotope as a callback
      //   function(newElements) {
      //     var $newElems = $(newElements);
      //     $newElems.imagesLoaded(function(){
      //       $grid.isotope('appended', $newElems );
      //     });
      //   }
      // );
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
