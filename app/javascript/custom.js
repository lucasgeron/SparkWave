document.addEventListener('DOMContentLoaded', function() {
  var token = document.getElementById('select_token');
  alert("Valor selecionado: " + selectedValue);
  token.addEventListener('change', function() {
    var selectedValue = token.value;
    alert("Valor selecionado: " + selectedValue);
    // Aqui você pode adicionar a lógica para realizar ações com o valor selecionado.
  });
});