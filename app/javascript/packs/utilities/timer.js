document.addEventListener('turbolinks:load', function() {

  var timerId = null
  var time_limit = (new Date(document.getElementById('timer-minutes').value)).getMinutes()
  var minute = time_limit
  var sec = 59
  minute--
  window.addEventListener("load", function() {
    sec  = window.localStorage.getItem("seconds")
    minute = window.localStorage.getItem("minutes")
    if (time_limit !=0) {
      timerId = setInterval(countdownTimer, 1000);
    }
  })

  function countdownTimer() {
    if (sec<0 || minute<0) { 
      minute = time_limit
      minute--
      sec = 59
    } 
    minutes_text = minute < 10 ? "0"+ minute: minute
    seconds_text = sec <10 ? "0" + sec : sec
    document.querySelector('.timer').classList.remove('hide')
    document.getElementById("timer-minutes").value = minutes_text + ":" + seconds_text
    sec--
    window.localStorage.setItem("seconds",sec)
    if (sec == 0) {
      minute--
      window.localStorage.setItem("minutes",minute)
      sec = 60
      if (minute <= 0) {
        $("#form-with-timer").trigger('submit.rails');
        clearInterval(timerId);
      }
    }
  }

})
