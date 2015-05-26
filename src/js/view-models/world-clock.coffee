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
    @id = ko.observable(_.kebabCase timezone)
    @timezone = ko.observable(timezone)
    @currentTime = ko.observable()
    @updateTime()

  updateTime: ->
    @currentTime moment.tz(@timezone()).toString()

    canvas = document.getElementById(@id())
    if canvas
      context = canvas.getContext('2d')
      x = canvas.width / 2
      y = canvas.height / 2
      radius = 40
      for i in [0..23]
        startAngle = i*2*Math.PI/24
        endAngle = (i+1)*2*Math.PI/24
        counterClockwise = false
        context.beginPath()
        context.arc x, y, radius, startAngle, endAngle, counterClockwise
        context.lineWidth = 15
        context.closePath()
        # line color
        context.strokeStyle = _.sample ['red', 'black', 'yellow', 'green']
        context.stroke()

  displayContents: ->
    @timezone() + ': ' + @currentTime()
