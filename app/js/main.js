(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  define([], function() {
    var Main;
    return Main = (function() {
      function Main() {
        this.eventHandler = __bind(this.eventHandler, this);
        this.currentController = $('#loading');
        this.currentHandler = this.loadingHandler;
      }

      Main.prototype.init = function() {
        $('.js-screen').hide();
        this.currentController.show();
        this.bind();
        return this.timeOut();
      };

      Main.prototype.timeOut = function() {
        return setTimeout(function() {
          var e, eventData;
          eventData = {
            name: 'loading done'
          };
          e = $.Event('appEvent', eventData);
          return $('body').trigger(e);
        }, Math.floor(10000 * Math.random() + 1000));
      };

      Main.prototype.eventHandler = function(e) {
        return this.currentHandler(e);
      };

      Main.prototype.bind = function() {
        $('body').bind('appEvent', this.eventHandler);
        return $('body').bind('keydown', this.eventHandler);
      };

      Main.prototype.ctrl1Handler = function(e) {
        if (e.type === 'keydown' && e.key === 'Right') {
          return this.switchController('ctrl2');
        }
      };

      Main.prototype.ctrl2Handler = function(e) {
        if (e.type === 'keydown' && e.key === 'Left') {
          return this.switchController('ctrl1');
        }
      };

      Main.prototype.loadingHandler = function(e) {
        if (e.type === 'appEvent' && e.name === 'loading done') {
          return this.switchController('ctrl1');
        }
      };

      Main.prototype.switchController = function(name) {
        this.previousController = this.currentController;
        switch (name) {
          case 'ctrl1':
            this.currentController = $('#screen1');
            this.currentHandler = this.ctrl1Handler;
            break;
          case 'ctrl2':
            this.currentController = $('#screen2');
            this.currentHandler = this.ctrl2Handler;
        }
        return this.previousController.slideUp(1000, (function(_this) {
          return function() {
            return _this.currentController.slideDown(1000);
          };
        })(this));
      };

      return Main;

    })();
  });

}).call(this);
