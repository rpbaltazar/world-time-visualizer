(function(){
  function updateClock(){
    var now = moment(),
        second = now.seconds() * 6,
        minute = now.minutes() * 6 + second / 60,
        hour = ((now.hours() % 12) / 12) * 360 + 90 + minute / 12;
  }

  function timedUpdate () {
    updateClock();
    setTimeout(timedUpdate, 1000);
  }

  timedUpdate();
})();
