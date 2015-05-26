App.ViewModels ||= {}

class App.ViewModels.WorldClockShop
  constructor: ->
    @worldClocks = ko.observableArray()
    @selectedTimezone = ko.observable()
    # TODO: Filter already selected ones
    @timezoneList = ko.observableArray()
    @_loadTimezones()

  addClock: ->
    timezoneName = @selectedTimezone()
    @worldClocks.push timezoneName

  _loadTimezones: ->
    @timezoneList _.map(moment.tz.names(), (tzName, index) ->
      {
        optionText: tzName
        optionValue: tzName
      }
    )
