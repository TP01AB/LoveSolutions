

var code;
var CaptchaMatematico = false;
var result = 0;
function captcha() {
    var simbol = new Array('+', '-', '*', '/');
    var i;
    for (i = 0; i < 5; i++) {
        var a = parseInt(Math.random() * 100) + 1;
        var b = parseInt(Math.random() * 100) + 1;
        var s = simbol[Math.floor(Math.random() * simbol.length)];
    }
    if (b < a) {
        code = a + ' ' + s + ' ' + b;
    } else {
        code = b + ' ' + s + ' ' + a;
    }

    switch (s) {
        case '+' :
            result = a + b;
            break;
        case '-' :
            if (b < a) {
                result = a - b;
            } else {
                result = b - a;
            }
            break;
        case '*' :
            result = a * b;
            break;
        case '/' :
            if (b < a) {
                result = parseInt(a / b);
            } else {
                result = parseInt(b / a);
            }
            break;
    }

    creaIMG(code);
}

function validCaptcha(txtInput) {

    if (result == document.getElementById(txtInput).value) {
    CaptchaMatematico = true

            document.getElementById("validar").classList.remove('captcha_Comprobar-enable');
            document.getElementById("validar").classList.add('captcha_Comprobar-disable');
            document.getElementById("txtInput").classList.remove('captcha_introducido-enable');
            document.getElementById("txtInput").classList.add('captcha_introducido-disable');
            document.getElementById("refresh").classList.remove('captcha_refresh-enable');
            document.getElementById("refresh").classList.add('captcha_refresh-disable');
    } else {
    captcha();
            CaptchaMatematico = false;
            document.getElementById("validar").classList.add('captcha_Comprobar-enable');
            document.getElementById("validar").classList.remove('captcha_Comprobar-disable');
            document.getElementById("txtInput").classList.add('captcha_introducido-enable');
            document.getElementById("txtInput").classList.remove('captcha_introducido-disable');
            document.getElementById("refresh").classList.add('captcha_refresh-enable');
            document.getElementById("refresh").classList.remove('captcha_refresh-disable');
    }
    document.cookie = "CaptchaMatematico=" + CaptchaMatematico;
}

function creaIMG(texto) {
    var ctxCanvas = document.getElementById('captcha').getContext('2d');
    var fontSize = "30px";
    var fontFamily = "Arial";
    var width = 250;
    var height = 50;
    //tamaño
    ctxCanvas.canvas.width = width;
    ctxCanvas.canvas.height = height;
    //color de fondo
    ctxCanvas.fillStyle = "whitesmoke";
    ctxCanvas.fillRect(0, 0, width, height);
    //puntos de distorsión
    ctxCanvas.setLineDash([7, 10]);
    ctxCanvas.lineDashOffset = 5;
    ctxCanvas.beginPath();
    var line;
    for (var i = 0; i < (width); i++) {
        line = i * 5;
        ctxCanvas.moveTo(line, 0);
        ctxCanvas.lineTo(0, line);
    }
    ctxCanvas.stroke();
    //formato texto
    ctxCanvas.direction = 'ltr';
    ctxCanvas.font = fontSize + " " + fontFamily;
    //texto posicion
    var x = (width / 9);
    var y = (height / 3) * 2;
    //color del borde del texto
    ctxCanvas.strokeStyle = "yellow";
    ctxCanvas.strokeText(texto, x, y);
    //color del texto
    ctxCanvas.fillStyle = "red";
    ctxCanvas.fillText(texto, x, y);
}

const formulario = document.getElementsByTagName('form')[0];
// DNI
const DNI = document.getElementById('DNIRegistro');
const DNIError = document.getElementById('DNIError');
// Nombre
const Nick = document.getElementById('NickRegistro');
const NickError = document.getElementById('NickError');
// Correo
const Email = document.getElementById('EmailRegistro');
const EmailError = document.getElementById('EmailError');

// Password
const Password = document.getElementById('PasswordRegistro');
const PasswordError = document.getElementById('PasswordError');
/* ----------- Función para controlar la validación del formulario ---------- */
// Esta función se carga con la página y esta pendiente de informar al
// usuario si hay errores o no mientras interactua con el formulario
function validacion() {
    captcha();
    // EventListener DNI
    DNI.addEventListener('blur', function (e) {

        // Si es valido eliminamos el error
        if (DNI.validity.valid) {
            DNIError.innerHTML = 'Ok';
            DNIError.className = 'no-error';
        } else { // Si tiene un error lo mostramos
            mostrarDniError();
        }
    });
    // EventListener nombre
    Nick.addEventListener('blur', function (e) {
        // Si es valido eliminamos el error
        if (Nick.validity.valid) {
            NickError.innerHTML = "Ok";
            NickError.className = "no-error";
        } else {
            mostrarNombreError();
        }
    });
    // EventListener email
    Email.addEventListener('blur', function (e) {
        // Si es valido eliminamos el error
        if (Email.validity.valid) {
            EmailError.innerHTML = 'Ok';
            EmailError.className = 'no-error';
        } else { // Si tiene un error lo mostramos
            mostrarEmailError();
        }
    });
    // EventListener password
    Password.addEventListener('blur', function (e) {
        // Si es valido eliminamos el error
        if (Password.validity.valid) {
            PasswordError.innerHTML = 'Ok';
            PasswordError.className = 'no-error';
        } else { // Si tiene un error lo mostramos
            mostrarPasswordError();
        }
    });
    // EvenListener para controlar el envio del formulario
    formulario.addEventListener('submit', function (event) {
        // Comprobamos que todos los campos son correcto para dejar enviar al formulario
        if (!DNI.validity.valid) {
            mostrarDniError();
            event.preventDefault();
        }
        if (!Nick.validity.valid) {
            mostrarNombreError();
            event.preventDefault();
        }
        if (!Email.validity.valid) {
            mostrarEmailError();
            event.preventDefault();
        }
        if (!Password.validity.valid) {
            mostrarPasswordError();
            event.preventDefault();
        }
        if (!document.cookie) {
            event.preventDefault();
            
        }
    });
}
function cargarCookies() {
    var nom_cookie, valor_cookie;
    var temp;
    var array_cookies = document.cookie.split('; ');
    document.cookie = "idioma=ingles";
    for (var i = 0; i < array_cookies.length; i++) {
        temp = array_cookies[i].split('=');
        nom_cookie = temp[0];
        valor_cookie = temp[1];
        if (nom_cookie == "CaptchaMatematico") {
            CaptchaMatematico = valor_cookie;
            p.innerHTML = "captcha completado correctamente";
        }
    }
}
// Función para mostrar los errores del DNI
function mostrarDniError() {
    if (DNI.validity.valueMissing) {
        // Si el campo esta vacio
        DNIError.textContent = 'Debe introducir su DNI';
    } else if (DNI.validity.patternMismatch) {
        // Si no sigue el patrón
        DNIError.textContent = 'Introduce un Dni 00011122X';
    } else if (!ConexionEstatica.ExisteDNI(DNI)) {
        DNIError.textContent = 'DNI EXISTE';
    }
    // Establece el estilo apropiado
    DNIError.className = 'error active';
}

// Función para mostrar los errores del nombre
function mostrarNombreError() {
    if (Nick.validity.valueMissing) {
        // Si el campo esta vacio
        NickError.textContent = 'Debe un nick como minimo';
    } else if (Nick.validity.typeMismatch) {
        // Si el campo no contiene un nombre
        NickError.textContent = 'Nick no  válido';
    } else if (Nick.validity.patternMismatch) {
        // Si no sigue el patrón
        NickError.textContent = 'nick con 4 a 16 caracteres';
    }
    // Establece el estilo apropiado
    NickError.className = 'error active';
}

// Función para mostrar los errores del email
function mostrarEmailError() {
    if (Email.validity.valueMissing) {
        // Si el campo está vacío
        EmailError.textContent = 'Debe introducir una dirección de correo electrónico.';
    } else if (Email.validity.typeMismatch) {
        // Si el campo no contiene una dirección de correo electrónico
        EmailError.textContent = 'El valor introducido debe ser una dirección de correo electrónico.';
    } else if (Email.validity.tooShort) {
        // Si los datos son demasiado cortos
        // muestra el mensaje de error siguiente.
        EmailError.textContent = 'El correo electrónico debe tener al menos ${ email.minLength } caracteres; ha introducido ${ email.value.length }.';
    }

    // Establece el estilo apropiado
    EmailError.className = 'error active';
}

// Función para mostrar los errores del email
function mostrarPasswordError() {
    if (Password.validity.valueMissing) {
        // Si el campo está vacío
        PasswordError.textContent = 'Debe introducir una contraseña.';
    } else if (Password.validity.tooShort) {
        // Si los datos son demasiado cortos
        PasswordError.textContent = '8-10 caracteres, debe tener un número, una letra mayuscula y una minuscula.';
    }
    // Establece el estilo apropiado
    PasswordError.className = 'error active';
}
