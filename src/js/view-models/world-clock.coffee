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
    @worldClocks.push new Clock(timezoneName)

  updateClocks: ->
    _.each @worldClocks(), (clock) ->
      clock.updateTime()

  _loadTimezones: ->
    @timezoneList _.map(moment.tz.names(), (tzName, index) ->
      {
        optionText: tzName
        optionValue: tzName
      }
    )

class Clock
  constructor: (timezone) ->
    @timezone = ko.observable(timezone)
    @currentTime = ko.observable()
    @updateTime()


  updateTime: ->
    @currentTime moment.tz(@timezone()).toString()

  displayContents: ->
    @timezone() + ': ' + @currentTime()
