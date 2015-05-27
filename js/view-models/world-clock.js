(function() {
  App.ViewModels || (App.ViewModels = {});

  App.ViewModels.WorldClockShop = (function() {
    function WorldClockShop() {
      this.worldClocks = ko.observableArray();
      this.selectedTimezone = ko.observable();
      this.timezoneList = ko.observableArray();
      this._loadTimezones();
    }

    WorldClockShop.prototype.addClock = function() {
      var timezoneName;
      timezoneName = this.selectedTimezone();
      return this.worldClocks.push(timezoneName);
    };

    WorldClockShop.prototype._loadTimezones = function() {
      return this.timezoneList(_.map(moment.tz.names(), function(tzName, index) {
        return {
          optionText: tzName,
          optionValue: tzName
        };
      }));
    };

    return WorldClockShop;

  })();

}).call(this);
