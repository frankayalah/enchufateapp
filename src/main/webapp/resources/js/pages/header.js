function LocationController($scope, $location) {
    if($location.$$absUrl.lastIndexOf('/profile') > 0){
        $scope.activeURL = 'profile';
    } else if($location.$$absUrl.lastIndexOf('/search') > 0){
        $scope.activeURL = 'search';
    } else if($location.$$absUrl.lastIndexOf('/logout') > 0){
        $scope.activeURL = 'logout';
    } else{
        $scope.activeURL = 'home';
    }
}

$(document).ready(function(){
	$(document).on('keydown', '.tipoEmail', function(event) {
		return FP_CaracteresCorreoValido(event);
	});
});

function FP_CaracteresCorreoValido(event) {

	// No permitir
	if ((event.keyCode == 111 || (event.keyCode == 55  && event.shiftKey == true)) || 	// no permite: "/"
		(event.keyCode == 219 || (event.keyCode == 219 && event.ctrlKey == true))  || 	// no permite: "'" "\"
		(event.keyCode == 188 || (event.keyCode == 52  && event.shiftKey == true)) ||	// no permite: "," "$"
	    (event.keyCode == 192 || (event.keyCode == 50  && event.shiftKey == true)) ||	// no permite: "Ñ" "(comilla)
		(event.keyCode == 32 || event.keyCode == 186 || event.keyCode == 13) ||		// no permite: " " "´" "enter"
		(event.keyCode == 51  && event.shiftKey == true) ||			// no permite: "#"
		(event.keyCode == 53  && event.shiftKey == true) ||			// no permite: "%"
		(event.keyCode == 54  && event.shiftKey == true) ||			// no permite: "&"
		(event.keyCode == 48  && event.shiftKey == true) ||			// no permite: "="
		(event.keyCode == 49  && event.shiftKey == true) ||			// no permite: "!"
		(event.keyCode == 221 && event.shiftKey == true) ||			// no permite: "¡"
		(event.keyCode == 219 && event.shiftKey == true) ||			// no permite: "?"
		(event.keyCode == 221)) {									// no permite: "¿"
		
		event.preventDefault();
	} else {
		return;
	}
}