(function(){

  this.App = {};

  $.getJSON("res/latest.json", function(json) {
    moment.tz.add(json.zones);
    App.ClockShop = new WorldClockShop();
    ko.applyBindings(App.ClockShop);
    timedUpdate();
  });

  function updateClock(){
    App.ClockShop.updateClocks();
  }

  function timedUpdate () {
    updateClock();
    setTimeout(timedUpdate, 1000);
  }

})();
