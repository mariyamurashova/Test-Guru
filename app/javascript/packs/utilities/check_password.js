document.addEventListener('turbolinks:load', function() {
  var i=0
  var userPassword
document.getElementById('user_password').addEventListener("input", function (e) {
  userPassword = e.target.value
 })

document.getElementById('user_password_confirmation').addEventListener("input",function (e) {
       
  if (userPassword[i] == e.target.value[i]) {
    document.querySelector('.octicon-check').classList.remove('hide')
    document.querySelector('.octicon-alert').classList.add('hide')
    i++
    }
  else {
    document.querySelector('.octicon-alert').classList.remove('hide')
    document.querySelector('.octicon-check').classList.add('hide')
      }
  },
false
  )
})

