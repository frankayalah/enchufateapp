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
    	$("#j_username").val($("#j_username").val().trim());
    	$("#j_password").val($("#j_password").val().trim());
      	if ($("form[name='login']").valid()) {
      		form.submit();
      	}
      }
    });
  
});

function loginController($scope, $location) {
    var url = "" + $location.$$absUrl;
    $scope.displayLoginError = (url.indexOf("error") >= 0);
}