// Variables
// Formulario
const formulario = document.getElementsByTagName('form')[0];
// DNI
const dni = document.getElementById('dni');
const dniError = document.getElementById('dniError');
// Nombre
const nombre = document.getElementById('nombre');
const nombreError = document.getElementById('nombreError');
// Correo
const email = document.getElementById('email');
const emailError = document.getElementById('emailError');
// Password
const password = document.getElementById('password');
const passwordError = document.getElementById('passwordError');
// Fecha de nacimiento
const fecNacimiento = document.getElementById('fecNac');
const fecNacimientoError = document.getElementById('fecNacError');
// Teléfono
const telefono = document.getElementById('telefono');
const telefonoError = document.getElementById('telefonoError');
// Web
const web = document.getElementById('web');
const webError = document.getElementById('webError');

/* ----------- Función para controlar la validación del formulario ---------- */
// Esta función se carga con la página y esta pendiente de informar al
// usuario si hay errores o no mientras interactua con el formulario
function validacion() {


    // EventListener DNI
    dni.addEventListener('input', function (e) {
        // Si es valido eliminamos el error
        if (dni.validity.valid) {
            dniError.innerHTML = 'Ok';
            dniError.className = 'no-error';
        } else { // Si tiene un error lo mostramos
            mostrarDniError();
        }
    });

    // EventListener nombre
    nombre.addEventListener('input', function (e) {
        // Si es valido eliminamos el error
        if (nombre.validity.valid) {
            nombreError.innerHTML = "Ok";
            nombreError.className = "no-error";
        } else {
            mostrarNombreError();
        }
    });

    // EventListener email
    email.addEventListener('input', function (e) {
        // Si es valido eliminamos el error
        if (email.validity.valid) {
            emailError.innerHTML = 'Ok';
            emailError.className = 'no-error';
        } else { // Si tiene un error lo mostramos
            mostrarEmailError();
        }
    });

    // EventListener password
    password.addEventListener('input', function (e) {
        // Si es valido eliminamos el error
        if (password.validity.valid) {
            passwordError.innerHTML = 'Ok';
            passwordError.className = 'no-error';
        } else { // Si tiene un error lo mostramos
            mostrarPasswordError();
        }
    });

    // EvenListener fecha de nacimiento
    fecNac.addEventListener('input', function (e) {
        // Si es valido eliminarmos el error
        if (fecNac.validity.valid) {
            fecNacError.innerHTML = 'OK - No requerido';
            fecNacError.className = 'no-error';
        } else {
            mostrarfecNacError();
        }
    });

    // EvenListener teléfono
    telefono.addEventListener('input', function (e) {
        // Si es valido eliminarmos el error
        if (telefono.validity.valid) {
            telefonoError.innerHTML = 'OK - No requerido';
            telefonoError.className = 'no-error';
        } else {
            mostrarTelefonoError();
        }
    });

    // EvenListener web
    web.addEventListener('input', function (e) {
        // Si es valido eliminarmos el error
        if (web.validity.valid) {
            webError.innerHTML = 'OK - No requerido';
            webError.className = 'no-error';
        } else {
            mostrarWebError();
        }
    });

    // EvenListener para controlar el envio del formulario
    formulario.addEventListener('submit', function (event) {
        // Comprobamos que todos los campos son correcto para dejar enviar al formulario
        if (!dni.validity.valid) {
            mostrarDniError();
            event.preventDefault();
        }
        if (!nombre.validity.valid) {
            mostrarNombreError();
            event.preventDefault();
        }
        if (!email.validity.valid) {
            mostrarEmailError();
            event.preventDefault();
        }
        if (!password.validity.valid) {
            mostrarPasswordError();
            event.preventDefault();
        }
        if (!fecNac.validity.valid) {
            mostrarfecNacError();
            event.preventDefault();
        }
        if (!telefono.validity.valid) {
            mostrarTelefonoError();
            event.preventDefault();
        }
        if (!web.validity.valid) {
            mostrarWebError();
            event.preventDefault();
        }
    });

}

// Función para mostrar los errores del DNI
function mostrarDniError() {
    if (dni.validity.valueMissing) {
        // Si el campo esta vacio
        dniError.textContent = 'Debe introducir su DNI';
    } else if (dni.validity.patternMismatch) {
        // Si no sigue el patrón
        dniError.textContent = 'El DNI no coincide con lo esperado 00.000.000-X';
    }
    // Establece el estilo apropiado
    dniError.className = 'error active';
}

// Función para mostrar los errores del nombre
function mostrarNombreError() {
    if (nombre.validity.valueMissing) {
        // Si el campo esta vacio
        nombreError.textContent = 'Debe introducir un nombre y un apellido como minimo';
    } else if (nombre.validity.typeMismatch) {
        // Si el campo no contiene un nombre
        nombreError.textContent = 'Debe intoducir un nombre y un apellidos como minimo válidos';
    } else if (nombre.validity.patternMismatch) {
        // Si no sigue el patrón
        nombreError.textContent = 'Un nombre y un apellido como mínimo o dos nombre y dos apellidos como máximos';
    }
    // Establece el estilo apropiado
    nombreError.className = 'error active';
}

// Función para mostrar los errores del email
function mostrarEmailError() {
    if (email.validity.valueMissing) {
        // Si el campo está vacío
        emailError.textContent = 'Debe introducir una dirección de correo electrónico.';
    } else if (email.validity.typeMismatch) {
        // Si el campo no contiene una dirección de correo electrónico
        emailError.textContent = 'El valor introducido debe ser una dirección de correo electrónico.';
    } else if (email.validity.tooShort) {
        // Si los datos son demasiado cortos
        // muestra el mensaje de error siguiente.
        emailError.textContent = 'El correo electrónico debe tener al menos ${ email.minLength } caracteres; ha introducido ${ email.value.length }.';
    }

    // Establece el estilo apropiado
    emailError.className = 'error active';
}

// Función para mostrar los errores del email
function mostrarPasswordError() {
    if (password.validity.valueMissing) {
        // Si el campo está vacío
        passwordError.textContent = 'Debe introducir una contraseña.';
    } else if (password.validity.tooShort) {
        // Si los datos son demasiado cortos
        passwordError.textContent = '8-10 caracteres, debe tener un número, una letra mayuscula y una minuscula.';
    }
    // Establece el estilo apropiado
    passwordError.className = 'error active';
}

// Funcion para mostrar los errores de la fecha de nacimiento
function mostrarfecNacError() {
    if (fecNac.validity.patternMismatch) {
        // Si no sigue el patron de la fecha
        fecNacError.textContent = 'El formato de la fecha debe ser dd/mm/yyyy.'
    }
    // Establece el estilo apropiado
    fecNacError.className = 'error active';
}

// Funcion para mostrar los errores del teléfono
function mostrarTelefonoError() {
    if (telefono.validity.patternMismatch) {
        // Si no sigue el patron de la fecha
        telefonoError.textContent = 'El formato del telefono debe ser 000-000-000.'
    }
    // Establece el estilo apropiado
    telefonoError.className = 'error active';
}

// Funcion para mostrar los errores de la web
function mostrarWebError() {
    if (web.validity.patternMismatch) {
        // Si no sigue el patron de la fecha
        webError.textContent = 'Debe introducir una url válida, incluyendo el protocolo'
    }
    // Establece el estilo apropiado
    webError.className = 'error active';
}