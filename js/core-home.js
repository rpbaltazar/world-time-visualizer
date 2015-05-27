(function() {
  this.App.initialize = function() {
    return $.getJSON('res/latest.json', function(json) {
      moment.tz.add(json.zones);
      App.ClockShop = new App.ViewModels.WorldClockShop();
      return ko.applyBindings(App.ClockShop);
    });
  };

  this.App.initialize();

  ko.components.register('location-clock', {
    viewModel: App.ViewModels.LocationClock,
    template: "<div class=\"col s4\">\n  <div class=\"timezone-name\" data-bind=\"text: displayContents()\"></div>\n  <canvas class=\"timezone-clock\" data-bind=\"attr: {id: id() }\"></canvas>\n</div>"
  });

}).call(this);
