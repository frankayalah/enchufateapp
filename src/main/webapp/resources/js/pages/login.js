$(function() {
    $("form[name='login']").validate({
      errorElement: 'div',
      rules: {
    	j_username: {
          required: true,
          email: true
        },
        j_password: {
          required: true
        }
      },
      messages: {
    	j_username: "Por favor, introduce una dirección de correo electrónico válida",
       
    	j_password: {
          required: "Por favor, ingrese contraseña",
         
        }
      },
      submitHandler: function(form) {
        form.submit();
      }
    });
    
    $("#j_username").blur(function() {
    	$("form[name='login']").valid();
	});
    
    $("#j_password").blur(function() {
    	$("form[name='login']").valid();
  	});
});

function loginController($scope, $location) {
    var url = "" + $location.$$absUrl;
    $scope.displayLoginError = (url.indexOf("error") >= 0);
}