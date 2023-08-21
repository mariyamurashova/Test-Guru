document.addEventListener('turbolinks:load', function() {

  if (document.querySelector('.progress-bar')) {
    var progressBar = document.querySelector('.progress-bar')
    var questionNumber = Number(progressBar.dataset.questionNumber)
    var questionsAmount = Number(progressBar.dataset.questionsAmount)
    var countProgress = (questionNumber / questionsAmount)*100
   
     progressBar.style.width = countProgress +'%'
  }
  
})
