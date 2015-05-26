App.ViewModels ||= {}

class App.ViewModels.LocationClock
  constructor: (params) ->
    timezone = params.timezone
    @id = ko.observable(_.kebabCase timezone)
    @timezone = ko.observable(timezone)
    @currentTime = ko.observable()

    @colorArray = [
      '#ffebee'
      '#ffcdd2'
      '#ef9a9a'
      '#e57373'
      '#ef5350'
      '#f44336'
      '#e53935'
      '#d32f2f'
      '#c62828'
      '#b71c1c'
      '#ff8a80'
      '#ff5252'
      '#ff1744'
      '#d50000'
      '#fce4ec'
      '#f8bbd0'
      '#f48fb1'
      '#f06292'
      '#ec407a'
      '#e91e63'
      '#d81b60'
      '#c2185b'
      '#ad1457'
      '#880e4f'
    ]

    @_timedUpdate()

  updateTime: =>
    mCurrentTime = moment.tz(@timezone())
    @currentTime mCurrentTime.toString()
    hourShift = mCurrentTime.hour()

    canvas = document.getElementById(@id())
    console.log canvas
    if canvas
      context = canvas.getContext('2d')
      x = canvas.width / 2
      y = canvas.height / 2
      radius = 40
      for i in [0..23]
        startAngle = (hourShift + i-0.5) * 2 * Math.PI / 24
        endAngle = (hourShift + i + 0.5) * 2 * Math.PI / 24
        counterClockwise = false
        context.beginPath()
        context.arc x, y, radius, startAngle, endAngle, counterClockwise
        context.lineWidth = 15
        context.closePath()
        # line color
        context.strokeStyle = @colorArray[i]
        context.stroke()

  displayContents: ->
    @timezone() + ': ' + @currentTime()

  # TODO: Find a way to update all clocks at same time
  _timedUpdate: =>
    @updateTime()
    setTimeout @_timedUpdate, 1000
