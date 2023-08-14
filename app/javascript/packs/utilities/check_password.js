document.addEventListener('turbolinks:load', function() {

document.getElementById('user_password').addEventListener("input", function (e) {
 var userPassword = e.target.value

document.getElementById('user_password_confirmation').addEventListener("input",function (e) {
       
  if (userPassword == e.target.value) {
    document.querySelector('.octicon-check').classList.remove('hide')
    document.querySelector('.octicon-alert').classList.add('hide')
    }
  else {
    document.querySelector('.octicon-alert').classList.remove('hide')
    document.querySelector('.octicon-check').classList.add('hide')
      }
    })
  })
})

