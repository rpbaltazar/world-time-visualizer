@App.initialize = ->
  $.getJSON 'res/latest.json', (json) ->
    moment.tz.add json.zones
    App.ClockShop = new App.ViewModels.WorldClockShop()
    ko.applyBindings App.ClockShop

@App.initialize()

ko.components.register 'location-clock',
  viewModel: App.ViewModels.LocationClock
  template: """
    <div class="col s4">
      <div class="timezone-name" data-bind="text: displayContents()"></div>
      <canvas class="timezone-clock" data-bind="attr: {id: id() }"></canvas>
    </div>
  """
