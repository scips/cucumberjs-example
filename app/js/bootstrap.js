(function() {
  require.config({
    paths: {
      vendors: 'vendors'
    }
  });

  require(['main'], function(Main) {
    $(function() {
      var App;
      App = new Main();
      return App.init();
    });
  });

}).call(this);
