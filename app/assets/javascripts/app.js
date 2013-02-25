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
      $('#content').draggable({
        stop: function(event, ui) {
          $.post("",
            { top: ui.position["top"], left: ui.position["left"] },
            function() {
              //callback;
            }
          );
        }
      }).resizable({
        minHeight: 150,
        minWidth: 200
      });
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
