document.addEventListener('DOMContentLoaded', () => {

  const registroForm = document.getElementById('registroForm');
  const errorMensaje = document.getElementById('errorMensaje');

  if (registroForm) {
    registroForm.addEventListener('submit', function (e) {
      e.preventDefault(); // Evita que el formulario se envíe automáticamente

      // Limpia el mensaje de error al inicio de la validación
      errorMensaje.textContent = "";

      // Captura los valores de los campos
      const nombre = document.getElementById('nombre').value.trim();
      const correo = document.getElementById('correo').value.trim();
      const Numero = document.getElementById('Numero').value.trim(); 
      const contraseña = document.getElementById('contraseña').value.trim();

      // Validación: verifica si los campos están vacíos
      if (!nombre || !correo || !Numero || !contraseña) {
        errorMensaje.textContent = "Todos los campos son obligatorios.";
        errorMensaje.style.color = "red";
        console.log("Error: campos vacíos");
        return;
      }

      // Validación del correo electrónico
      if (!validarEmail(correo)) {
        errorMensaje.textContent = "Por favor ingresa un correo válido.";
        errorMensaje.style.color = "red";
        console.log("Error: correo inválido");
        return;
      }

      if (!validarTelefono(Numero)) {
        errorMensaje.textContent = "El número de teléfono debe contener solo dígitos.";
        errorMensaje.style.color = "red";
        console.log("Error: teléfono inválido");
        return;
      }

      errorMensaje.textContent = ""; 
      alert("Registro exitoso");
      console.log("Formulario validado y listo para enviar.");
    });
  }
});

function validarEmail(correo) {
  const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return regex.test(correo);
}

function validarTelefono(Numero) {
  const regex = /^\d+$/;
  return regex.test(Numero);
}

function login() {
  window.location.href = "login.html";
}

function register() {
  window.location.href = "Index.html";
}
