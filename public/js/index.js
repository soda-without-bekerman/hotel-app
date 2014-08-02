// Generated by CoffeeScript 1.7.1
var errorFn, opts, printPosition;

$(function() {
  var setTime;
  setTime = function() {
    var curDate, hours, minutes, seconds, timeStr;
    curDate = new Date;
    hours = curDate.getHours();
    minutes = curDate.getMinutes();
    seconds = curDate.getSeconds();
    if (hours < 10) {
      hours = "0" + hours;
    }
    if (minutes < 10) {
      minutes = "0" + minutes;
    }
    timeStr = "" + hours + ":" + minutes;
    return $(".time").text(timeStr);
  };
  setTime();
  setInterval(setTime, 1000);
  return $(".do-checkin").on("click", function(e) {
    return navigator.geolocation.getCurrentPosition(printPosition, errorFn, opts);
  });
});

printPosition = function(pos) {
  return console.log(JSON.stringify(pos, null, 2));
};

errorFn = function(error) {
  switch (error.code) {
    case 1:
      return console.error("PERMISSION_DENIED");
    case 2:
      return console.error("POSITION_UNAVAILABLE");
    case 3:
      return console.error("TIMEOUT");
  }
};

opts = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
};

setTimeout((function() {
  return navigator.geolocation.clearWatch(positionTimer);
}), 60000);

({
  coords: {
    accuracy: 25000,
    altitude: null,
    altitudeAccuracy: null,
    heading: null,
    latitude: 58.74023,
    longitude: 41.391284,
    speed: null
  },
  timestamp: 137352000000
});