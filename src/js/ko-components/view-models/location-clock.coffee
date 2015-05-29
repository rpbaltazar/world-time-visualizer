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
    if canvas
      context = canvas.getContext('2d')
      context.clearRect(0, 0, canvas.width, canvas.height);
      x = canvas.width / 2
      y = canvas.height / 2
      radius = 40
      outerRadius = radius + 14
      for i in [0..23]
        startAngle = (i-0.5) * 2 *Math.PI / 24 - (Math.PI/2)
        endAngle = (i+0.5) * 2 *Math.PI / 24 - (Math.PI/2)
        angle = 2*Math.PI - ((endAngle - startAngle)/2 + startAngle) + Math.PI/2
        counterClockwise = false
        context.beginPath()
        context.arc x, y, radius, startAngle, endAngle, counterClockwise
        context.lineWidth = 15
        context.closePath()
        # line color
        if hourShift + i > 24
          currentHour = hourShift + i - 24
        else
          currentHour = hourShift + i

        context.strokeStyle = @colorArray[currentHour]
        context.stroke()
        context.font = '12 serif'
        hourText = context.measureText(currentHour)
        px = Math.sin(angle) * outerRadius + x - hourText.width/2
        py = Math.cos(angle) * outerRadius + y + 3
        context.fillStyle = @colorArray[currentHour]
        context.fillText currentHour, px, py

  displayContents: ->
    @timezone() + ': ' + @currentTime()

  # TODO: Find a way to update all clocks at same time
  _timedUpdate: =>
    @updateTime()
    setTimeout @_timedUpdate, 1000

