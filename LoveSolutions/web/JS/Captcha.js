/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
<script src='https://www.google.com/recaptcha/api.js?render=6LdGPtoZAAAAAPhXK24N-3XER82ZthFNqSclTLlw'></script>
        <script>
   grecaptcha.ready(function() {
        grecaptcha.execute('6LdGPtoZAAAAAPhXK24N-3XER82ZthFNqSclTLlw', {action: 'homepage'})
        .then(function (token) {
            document.getElementById('g-recaptcha-response').value = token;
        });
 });
</script>

