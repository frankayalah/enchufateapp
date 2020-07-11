
searchVisible = 0;
transparent = true;

$(document).ready(function(){

    /*  Activate the tooltips      */
    $('[rel="tooltip"]').tooltip();
    
    $('.input-group.date').datepicker({
        format: "dd/mm/yyyy",
        language: "es",
        autoclose: true,
        todayHighlight: true
    });

    // Code for the Validator
    var $validator = $('.wizard-card form').validate({
    	  errorPlacement: function(error, element) {
    		if (error[0].id == 'hobby-error') {
    			$( "#containerHobbies" ).prepend(error[0]);
    		} else {
    			error.insertAfter(element);
    		}
    	  },
		  rules: {
			nombre: {
		      required: true,
		      maxlength: 45
		    },
		    apellidos: {
		      required: true,
		      maxlength: 45
		    },
		    fechaNacimiento: {
		      maxlength: 10
		    },
		    sede: {
		      required: true
		    },
		    descripcion: {
		      maxlength: 255
		    },
            hobby: {
		      required: true
		    }
        },
        messages: {
	    	nombre: {
	          required: "Este campo es obligatorio.",
	          maxlength: "Longitud máxima 45 caracteres."
	        },
	        apellidos: {
	          required: "Este campo es obligatorio.",
	          maxlength: "Longitud máxima 45 caracteres."	         
	        },
            hobby: {
              required: "Este campo es obligatorio."	
  		    },
	        sede: {
	          required: "Este campo es obligatorio."	         
	        },
	        fechaNacimiento: {
	          maxlength: "Longitud máxima 10 caracteres."
	        },
	        descripcion: {
	          maxlength: "Longitud máxima 255 caracteres."
	        }
	    },
        submitHandler: function(form) {
        	
        	var i;
        	var total = $(".tab-pane").length;
        	var isValidate = true;
        	for (i = 0; i < $(".tab-pane").length; i++) {
        		
        		$(".tab-pane").removeClass('active');
            	$($(".tab-pane")[i]).addClass('active');
            	
            	$('.nav-pills').find('li').removeClass('active');
        		$('.nav-pills').find('li:nth-child(' + (i+1) + ')').addClass('active');
        		
        		var button_text = $('.nav-pills').find('li:nth-child(' + (i+1) + ') a').html()
        		$('.moving-tab').text(button_text);
        		refreshAnimation($('.wizard-card'), i);
            	
            	if (!$("form[name='signup']").valid()) {
            		
            		isValidate = false;
//            		if(i+1 >= total) {
//                        $($('.wizard-card')).find('.btn-next').hide();
//                        $($('.wizard-card')).find('.btn-finish').show();
//                    } else {
//                        $($('.wizard-card')).find('.btn-next').show();
//                        $($('.wizard-card')).find('.btn-finish').hide();
//                    }
            		
            		break;
            	}
        	}
        	
        	if (isValidate) {        		
        		$("body").showLoading();
        		form.submit();
        	}
        }
	});

    // Wizard Initialization
  	$('.wizard-card').bootstrapWizard({
        'tabClass': 'nav nav-pills',
        'nextSelector': '.btn-next',
        'previousSelector': '.btn-previous',

        onNext: function(tab, navigation, index) {
        	var $valid = $('.wizard-card form').valid();
        	if(!$valid) {
        		$validator.focusInvalid();
        		return false;
        	}
        },

        onInit : function(tab, navigation, index){

          //check number of tabs and fill the entire row
          var $total = navigation.find('li').length;
          $width = 100/$total;
          var $wizard = navigation.closest('.wizard-card');

          $display_width = $(document).width();

          if($display_width < 600 && $total > 3){
              $width = 50;
          }

           navigation.find('li').css('width',$width + '%');
           $first_li = navigation.find('li:first-child a').html();
           $moving_div = $('<div class="moving-tab">' + $first_li + '</div>');
           $('.wizard-card .wizard-navigation').append($moving_div);
           refreshAnimation($wizard, index);
           $('.moving-tab').css('transition','transform 0s');
       },

        onTabClick : function(tab, navigation, index){

            var $valid = $('.wizard-card form').valid();

            if(!$valid){
                return false;
            } else {
                return true;
            }
        },

        onTabShow: function(tab, navigation, index) {
            var $total = navigation.find('li').length;
            var $current = index+1;

            var $wizard = navigation.closest('.wizard-card');

            // If it's the last tab then hide the last button and show the finish instead
            if($current >= $total) {
                $($wizard).find('.btn-next').hide();
                $($wizard).find('.btn-finish').show();
            } else {
                $($wizard).find('.btn-next').show();
                $($wizard).find('.btn-finish').hide();
            }

            button_text = navigation.find('li:nth-child(' + $current + ') a').html();

            setTimeout(function(){
                $('.moving-tab').text(button_text);
            }, 150);

            var checkbox = $('.footer-checkbox');

            if( !index == 0 ){
                $(checkbox).css({
                    'opacity':'0',
                    'visibility':'hidden',
                    'position':'absolute'
                });
            } else {
                $(checkbox).css({
                    'opacity':'1',
                    'visibility':'visible'
                });
            }

            refreshAnimation($wizard, index);
        }
  	});


    // Prepare the preview for profile picture
    $("#wizard-picture").change(function(){
        readURL(this);
    });

    $('[data-toggle="wizard-radio"]').click(function(){
        wizard = $(this).closest('.wizard-card');
        wizard.find('[data-toggle="wizard-radio"]').removeClass('active');
        $(this).addClass('active');
        $(wizard).find('[type="radio"]').removeAttr('checked');
        $(this).find('[type="radio"]').attr('checked','true');
    });

    $('[data-toggle="wizard-checkbox"]').click(function(){
        if( $(this).hasClass('active')){
            $(this).removeClass('active');
            $(this).find('[type="checkbox"]').removeAttr('checked');
        } else {
            $(this).addClass('active');
            $(this).find('[type="checkbox"]').attr('checked','true');
        }
    });

    $('.set-full-height').css('height', 'auto');

});

function profileController($scope, $http) {
	
	$scope.url = "/enchufateapp/protected/profile/";
	$scope.displayValidationError = false;
	$scope.state = 'busy';
	$scope.user = {};
	
	$scope.createUser = function (signup) {
        if (!signup.$valid) {
            $scope.displayValidationError = true;
            return;
        }
	};
	
    $scope.getUser = function () {
    	
        var url = $scope.url;
        $scope.displayValidationError = false;
//        $("#loadingModal").modal('show');

        var config = {params: {page: 0}};

        $http.get(url, config)
            .success(function (data) {
//            	$("#loadingModal").modal('hide');
            	$scope.state = 'ready';
            	$scope.user = data;
            })
            .error(function () {
                $scope.state = 'error';
            });
    }
    
    $scope.getUser();
}

function validarValor(obj) {
	return obj != undefined && obj != null;
}

function esRespuestaValida(obj) {
	return obj != '' && validarValor(obj);
}

$(document).ajaxError(
function(event, jqxhr, settings, exception) {	
	$("body").hideLoading();
	if (esRespuestaValida(jqxhr.responseText)) {
		var lObjetoRespuesta = $.parseJSON(jqxhr.responseText);
		if(lObjetoRespuesta.mensajeRespuesta) {
			mostrarMensajeError(lObjetoRespuesta.mensajeRespuesta);
		} else {
			mostrarMensajeError(YANBAL.MSG_ERROR_GENERAL);
		}
	} else {
		mostrarMensajeError(YANBAL.MSG_ERROR_GENERAL);
	}
});

function inicializarAjax() {
	$.ajaxSetup({
		cache : false
	});
}

inicializarAjax();

//Function to show image before upload

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#wizardPicturePreview').attr('src', e.target.result).fadeIn('slow');
        }
        reader.readAsDataURL(input.files[0]);
    }
}

$(window).resize(function(){
    $('.wizard-card').each(function(){
        $wizard = $(this);
        index = $wizard.bootstrapWizard('currentIndex');
        refreshAnimation($wizard, index);

        $('.moving-tab').css({
            'transition': 'transform 0s'
        });
    });
});

function refreshAnimation($wizard, index){
    total_steps = $wizard.find('li').length;
    move_distance = $wizard.width() / total_steps;
    step_width = move_distance;
    move_distance *= index;

    $display_width = $(document).width();
    if($display_width < 600 && total_steps > 3){
        $('.moving-tab').css('width',50 + '%');
        
        if (index == 0) {
        	$('.moving-tab').css({
                'transform':'translate3d(0%, 0, 0)',
                'transition': 'all 0.3s ease-out'

            });
        } else if (index == 1) {
        	$('.moving-tab').css({
                'transform':'translate3d(100%, 0, 0)',
                'transition': 'all 0.3s ease-out'

            });
        } else if (index == 2) {
        	$('.moving-tab').css({
                'transform':'translate3d(0%, 100%, 0)',
                'transition': 'all 0.3s ease-out'

            });
        } else if (index == 3) {
        	$('.moving-tab').css({
                'transform':'translate3d(100%, 100%, 0)',
                'transition': 'all 0.3s ease-out'

            });
        }
        
    } else {
    	
    	$wizard.find('.moving-tab').css('width', step_width);
    	
    	$('.moving-tab').css({
            'transform':'translate3d(' + move_distance + 'px, 0, 0)',
            'transition': 'all 0.3s ease-out'

        });
    }
}

function debounce(func, wait, immediate) {
	var timeout;
	return function() {
		var context = this, args = arguments;
		clearTimeout(timeout);
		timeout = setTimeout(function() {
			timeout = null;
			if (!immediate) func.apply(context, args);
		}, wait);
		if (immediate && !timeout) func.apply(context, args);
	};
};
