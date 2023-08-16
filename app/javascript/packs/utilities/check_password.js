document.addEventListener('turbolinks:load', function() {
 var userPassword

document.getElementById('user_password').addEventListener("input", function (e) {
  userPassword = e.target.value 

document.getElementById('user_password_confirmation').addEventListener("input",function (e) {  

if (e.target.value == '') {return(document.querySelector('.octicon-alert').classList.add('hide'))}  

comparePasswords (e.target.value)
    })
  })

function comparePasswords(passwordConfirmation){
  
  if (userPassword == passwordConfirmation) {
    document.querySelector('.octicon-check').classList.remove('hide')
    document.querySelector('.octicon-alert').classList.add('hide')
    }
  else {
    document.querySelector('.octicon-alert').classList.remove('hide')
    document.querySelector('.octicon-check').classList.add('hide')
    }
  }
})
