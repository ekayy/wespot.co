window.Wespot = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  init: function() {
    new Wespot.Routers.Menus;
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Wespot.init();
});