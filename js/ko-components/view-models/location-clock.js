(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  App.ViewModels || (App.ViewModels = {});

  App.ViewModels.LocationClock = (function() {
    function LocationClock(params) {
      this._timedUpdate = bind(this._timedUpdate, this);
      this.updateTime = bind(this.updateTime, this);
      var timezone;
      timezone = params.timezone;
      this.id = ko.observable(_.kebabCase(timezone));
      this.timezone = ko.observable(timezone);
      this.currentTime = ko.observable();
      this.colorArray = ['#ffebee', '#ffcdd2', '#ef9a9a', '#e57373', '#ef5350', '#f44336', '#e53935', '#d32f2f', '#c62828', '#b71c1c', '#ff8a80', '#ff5252', '#ff1744', '#d50000', '#fce4ec', '#f8bbd0', '#f48fb1', '#f06292', '#ec407a', '#e91e63', '#d81b60', '#c2185b', '#ad1457', '#880e4f'];
      this._timedUpdate();
    }

    LocationClock.prototype.updateTime = function() {
      var canvas, context, counterClockwise, endAngle, hourShift, i, j, mCurrentTime, radius, results, startAngle, x, y;
      mCurrentTime = moment.tz(this.timezone());
      this.currentTime(mCurrentTime.toString());
      hourShift = mCurrentTime.hour();
      canvas = document.getElementById(this.id());
      console.log(canvas);
      if (canvas) {
        context = canvas.getContext('2d');
        x = canvas.width / 2;
        y = canvas.height / 2;
        radius = 40;
        results = [];
        for (i = j = 0; j <= 23; i = ++j) {
          startAngle = (hourShift + i - 0.5) * 2 * Math.PI / 24;
          endAngle = (hourShift + i + 0.5) * 2 * Math.PI / 24;
          counterClockwise = false;
          context.beginPath();
          context.arc(x, y, radius, startAngle, endAngle, counterClockwise);
          context.lineWidth = 15;
          context.closePath();
          context.strokeStyle = this.colorArray[i];
          results.push(context.stroke());
        }
        return results;
      }
    };

    LocationClock.prototype.displayContents = function() {
      return this.timezone() + ': ' + this.currentTime();
    };

    LocationClock.prototype._timedUpdate = function() {
      this.updateTime();
      return setTimeout(this._timedUpdate, 1000);
    };

    return LocationClock;

  })();

}).call(this);
