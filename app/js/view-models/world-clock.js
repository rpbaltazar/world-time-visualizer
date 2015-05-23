function WorldClockShop(){
  this.worldClocks = ko.observableArray();
  this.selectedTimezone = ko.observable();
  // TODO: Filter already selected ones
  this.timezoneList = ko.observableArray();
  this._loadTimezones();
}

WorldClockShop.prototype._loadTimezones = function() {
  this.timezoneList(_.map(moment.tz.names(), function(tzName, index){
    return { optionText: tzName, optionValue: tzName }
  }));
}

WorldClockShop.prototype.updateClocks = function() {
  _.each(this.worldClocks(), function(clock){
    clock.updateTime();
  });
}

WorldClockShop.prototype.addClock = function() {
  var timezoneName = this.selectedTimezone();
  this.worldClocks.push(new Clock(timezoneName));
}

function Clock(timezone) {
  this.timezone = ko.observable(timezone);
  this.currentTime = ko.observable();
  this.updateTime();
}

Clock.prototype.updateTime = function() {
  return this.currentTime(moment.tz(this.timezone()).toString());
}

Clock.prototype.displayContents = function() {
  return this.timezone() + ": "+this.currentTime();
}
