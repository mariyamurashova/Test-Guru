document.addEventListener('turbolinks:load', function() {
  var checkbox1 = document.querySelector('.rule1')
  var checkbox2 = document.querySelector('.rule2')
  var checkbox3 = document.querySelector('.rule3')

  checkbox1.addEventListener('change', function() {
  if (this.checked) {
    document.querySelector('.select-category').classList.remove('hide');
    document.getElementById("badge_rule_level").value = "nil";
    document.querySelector('.select-level').classList.add('hide');
    checkbox2.checked = false
    checkbox3.checked = false
  } 
});

  checkbox2.addEventListener('change', function() {
  if (this.checked) {
    document.querySelector('.select-level').classList.remove('hide');
    document.getElementById("badge_rule_category").value = "nil";
    document.querySelector('.select-category').classList.add('hide');
    checkbox1.checked = false
    checkbox3.checked = false
  } 
});

  checkbox3.addEventListener('change', function() {
  if (this.checked) {
    document.querySelector('.select-level').classList.add('hide');
    document.querySelector('.select-category').classList.add('hide');
    document.getElementById("badge_rule_category").value = "nil";
    document.getElementById("badge_rule_level").value = "nil";
    checkbox1.checked = false
    checkbox2.checked = false
  } 
});

})
