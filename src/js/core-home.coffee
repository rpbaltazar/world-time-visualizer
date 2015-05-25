@App.initialize = ->
  $.getJSON 'res/latest.json', (json) ->
    moment.tz.add json.zones
    App.ClockShop = new App.ViewModels.WorldClockShop()
    ko.applyBindings App.ClockShop
    App.timedUpdate()

@App.timedUpdate = =>
  App.ClockShop.updateClocks()
  setTimeout @App.timedUpdate, 1000

@App.initialize()
