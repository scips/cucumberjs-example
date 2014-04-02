(function() {
  define(['jquery'], function($) {
    var App, Main;
    Main = (function() {
      function Main() {}

      Main.prototype.init = function() {
        $('.js-screen').hide();
        return $('#loading').show();
      };

      return Main;

    })();
    App = new Main();
    return App.init();
  });

}).call(this);
