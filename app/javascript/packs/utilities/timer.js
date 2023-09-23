document.addEventListener('turbolinks:load', function() {

var deadline = new Date(document.getElementById('timer-minutes').value)
var seconds
var minutes
var timeinterval
var clock = document.getElementById('clockdiv'); 
var minutesSpan = clock.querySelector('.minutes');  
var secondsSpan = clock.querySelector('.seconds');

window.onload = function(){
  updateClock(); // запускаем функцию один раз, чтобы избежать задержки  
  timeinterval = setInterval(updateClock,1000); 
}

function getTimeRemaining(endtime){  
  t = Date.parse(endtime) - Date.parse(new Date());  
  seconds = Math.floor( (t/1000) % 60 );  
  minutes = Math.floor( (t/1000/60) % 60 );  
  return {  
   'total': t,   
   'minutes': minutes,  
   'seconds': seconds  
  };  
}

function updateClock(){    
 var t = getTimeRemaining(deadline);  
  minutesSpan.innerHTML = t.minutes;  
  secondsSpan.innerHTML =  ('0' + t.seconds).slice(-2);;   
    if(t.total<=0){  
      clearInterval(timeinterval); 
     $("#form-with-timer").trigger('submit.rails'); 
   }  
  }
})
