<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
	
	<title><spring:message code="project.title"/></title>

	<!-- Fonts and icons -->
    <link href="<c:url value='/resources/css/font-awesome/font-awesome-4.4.0.css' />" rel="stylesheet" />

	<!-- CSS Files -->
    <link href="<c:url value='/resources/assets/css/bootstrap.min.css' />" rel="stylesheet" />
	<link href="<c:url value='/resources/assets/css/gsdk-bootstrap-wizard.css' />" rel="stylesheet" />
	<link href="<c:url value='/resources/css/bootstrap/bootstrap-datepicker.min.css' />" rel="stylesheet" />
	<script src="<c:url value='/resources/js/angular.min.js' />"></script>

<%
String mensajeError = (String)session.getAttribute("messageError");
session.removeAttribute("messageError");

if (mensajeError != null) { %>

<style type="text/css">
.alert-danger {
    color: #721c24;
    background-color: #f8d7da;
    border-color: #f5c6cb !important;
}
.alert-dismissible {
    padding-right: 4rem !important;
}
.alert {
    position: relative;
    padding: .75rem 1.25rem;
    margin-bottom: 1rem;
    margin-top: 1rem;
    border: 1px solid transparent;
    border-radius: .25rem;
}
.fade {
    transition: opacity .15s linear !important;
    opacity: unset;
}
</style>
<% } %>
</head>
<body>
<div class="image-container set-full-height" ng-controller="userController" style="background-image: url('resources/assets/img/wizard.jpg')">
	
    <!--   Big container   -->
    <div class="container">
        <div class="row">
        <div class="col-sm-8 col-sm-offset-2">

			<% if(mensajeError != null){ %>
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
			  <strong>Error! </strong><%=mensajeError%>
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
			<% } %>

            <!--      Wizard container        -->
            <div class="wizard-container">
            	<a style="float: right" href="<c:url value="/"/>">
            	<img width="58px" height="46px" alt="Iniciar Sesión" src="<c:url value='/resources/img/logo.png' />">
            	</a>

                <div class="card wizard-card" data-color="orange" id="wizardProfile">
                    <form method="post" name="signup" action="public/user" >
                <!--        You can switch ' data-color="orange" '  with one of the next bright colors: "blue", "green", "orange", "red"          -->

                    	<div class="wizard-header">
                        	<h3>
                        	   <b>Crear</b> una cuenta <br>
                        	   <small>Regístrate y Enchúfate con tus amigos.</small>
                        	</h3>
                    	</div>

						<div class="wizard-navigation">
							<ul>
	                            <li><a href="#about" data-toggle="tab">Sobre mí</a></li>
	                            <li><a href="#account" data-toggle="tab">Hobbies</a></li>
	                            <li><a href="#address" data-toggle="tab">Adicional</a></li>
	                            <li><a href="#description" data-toggle="tab">Descripción</a></li>
	                        </ul>

						</div>

                        <div class="tab-content">
                            <div class="tab-pane" id="about">
                              <div class="row">
                                  <div class="col-sm-4 col-sm-offset-1">
                                     <div class="picture-container">
                                          <div class="picture">
                                              <img src="<c:url value='/resources/assets/img/default-avatar.png' />" class="picture-src" id="wizardPicturePreview" title=""/>
                                              <input type="file" ng-model="user.imagen" name="imagen" id="wizard-picture">
                                          </div>
                                          <h6>Subir foto de perfil</h6>
                                      </div>
                                  </div>
                                  <div class="col-sm-6">
                                      <div class="form-group">
                                        <label>Nombre <small>(requerido)</small></label>
                                        <input name="nombre" ng-model="user.nombre" type="text" class="form-control" placeholder="David...">
                                      </div>
                                      <div class="form-group">
                                        <label>Apellidos <small>(requerido)</small></label>
                                        <input name="apellidos" ng-model="user.apellidos" type="text" class="form-control" placeholder="Fischman Kalincausky...">
                                      </div>
                                  </div>
                                  <div class="col-sm-10 col-sm-offset-1">
                                      <div class="form-group">
                                          <label>Correo UPC <small>(requerido)</small></label>
                                          <input name="correo" ng-model="user.correo" type="email" class="form-control" placeholder="example@upc.edu.pe">
                                      </div>
                                  </div>
                                  <div class="col-sm-5 col-sm-offset-1">
                                      <div class="form-group">
                                          <label>Contraseña <small>(requerido)</small></label>
                                          <input name="clave" ng-model="user.clave" id="clave" type="password" class="form-control" placeholder="" autocomplete="off">
                                      </div>
                                  </div>
                                  <div class="col-sm-5">
                                      <div class="form-group">
                                          <label>Confirmación</label>
                                          <input name="confirmClave" type="password" class="form-control" placeholder="" autocomplete="off">
                                      </div>
                                  </div>
                              </div>
                            </div>
                            <div class="tab-pane" id="account">
                                <h4 class="info-text"> ¿Cuáles son tu intereses? </h4>
                                <div class="row" >
									<div class="col-sm-10 col-sm-offset-1" id="containerHobbies" ></div>
                                    <div class="col-sm-10 col-sm-offset-1" >
                                        <div class="col-sm-4">
                                            <div class="choice" data-toggle="wizard-checkbox">
                                                <input type="checkbox" name="hobby" value="1">
                                                <div class="icon">
                                                    <i class="fa fa-music"></i>
                                                </div>
                                                <h6>Música</h6>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="choice" data-toggle="wizard-checkbox">
                                                <input type="checkbox" name="hobby" value="2">
                                                <div class="icon">
                                                    <i class="fa fa-terminal"></i>
                                                </div>
                                                <h6>Programación</h6>
                                            </div>

                                        </div>
                                        <div class="col-sm-4">
                                            <div class="choice" data-toggle="wizard-checkbox">
                                                <input type="checkbox" name="hobby" value="3">
                                                <div class="icon">
                                                    <i class="fa fa-paint-brush"></i>
                                                </div>
                                                <h6>Arte</h6>
                                            </div>

                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-10 col-sm-offset-1">
                                        <div class="col-sm-4">
                                            <div class="choice" data-toggle="wizard-checkbox">
                                                <input type="checkbox" name="hobby" value="4">
                                                <div class="icon">
                                                    <i class="fa fa-book"></i>
                                                </div>
                                                <h6>Lectura</h6>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="choice" data-toggle="wizard-checkbox">
                                                <input type="checkbox" name="hobby" value="5">
                                                <div class="icon">
                                                    <i class="fa fa-futbol-o"></i>
                                                </div>
                                                <h6>Fútbol</h6>
                                            </div>

                                        </div>
                                        <div class="col-sm-4">
                                            <div class="choice" data-toggle="wizard-checkbox">
                                                <input type="checkbox" name="hobby" value="6">
                                                <div class="icon">
                                                    <i class="fa fa-film"></i>
                                                </div>
                                                <h6>Cine</h6>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="tab-pane" id="address">
                                <div class="row">
                                    <div class="col-sm-5 col-sm-offset-1">
                                         <div class="form-group">
                                            <label>Fecha de Nacimiento</label>
											<div class="input-group date">
											  <input type="text" name="fechaNacimiento" ng-model="user.fechaNacimiento" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
											</div>
                                          </div>
                                    </div>
                                    <div class="col-sm-5">
                                         <div class="form-group">
                                            <label>Género</label>
                                            <select name="genero" ng-model="user.genero" class="form-control">
                                            	<option value=""> - Seleccione - </option>
                                                <option value="Masculino"> Masculino </option>
                                                <option value="Femenino"> Femenino </option>
                                            </select>
                                          </div>
                                    </div>
                                    <div class="col-sm-5 col-sm-offset-1">
                                         <div class="form-group">
                                            <label>Sede</label><br>
                                             <select name="sede" ng-model="user.sede" class="form-control">
                                             	<option value=""> - Seleccione - </option>
                                                <option value="San Isidro"> San Isidro </option>
                                                <option value="La Molina"> La Molina </option>
                                                <option value="San Miguel"> San Miguel </option>
                                                <option value="Villa"> Villa </option>
                                            </select>
                                          </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="description">
                                <div class="row">
                                    <div class="col-sm-6 col-sm-offset-1">
                                         <div class="form-group">
                                            <textarea class="form-control" style="width: 100%" ng-model="user.descripcion" name="descripcion" placeholder="" rows="9"></textarea>
                                          </div>
                                    </div>
                                    <div class="col-sm-4">
                                         <div class="form-group">
                                            <label>Ejemplo</label>
                                            <p class="description">"Soy un estudiante muy dedicado con deseos de conocer personas que compartan conmigo los mismos intereses."</p>
                                          </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="wizard-footer height-wizard">
                            <div class="pull-right">
                                <input type='button' class='btn btn-next btn-fill btn-warning btn-wd btn-sm' name='next' value='Siguiente' />
                                <input type='submit' class='btn btn-finish btn-fill btn-warning btn-wd btn-sm' name='finish' value='Regístrate' ng-click="createUser(signup);" />

                            </div>

                            <div class="pull-left">
                                <input type='button' class='btn btn-previous btn-fill btn-default btn-wd btn-sm' name='previous' value='Anterior' />
                            </div>
                            <div class="clearfix"></div>
                        </div>

                    </form>
                </div>
            </div> <!-- wizard container -->
        </div>
        </div><!-- end row -->
    </div> <!--  big container -->

</div>

</body>

	<!--   Core JS Files   -->
	<script src="<c:url value='/resources/assets/js/jquery-2.2.4.min.js' />" type="text/javascript"></script>
	<script src="<c:url value='/resources/assets/js/bootstrap.min.js' />" type="text/javascript"></script>
	<script src="<c:url value='/resources/assets/js/jquery.bootstrap.wizard.js' />" type="text/javascript"></script>
	

	<!--  Plugin for the Wizard -->
	<script src="<c:url value='/resources/js/util/bootstrap-datepicker.min.js' />"></script>
	<script src="<c:url value='/resources/js/util/bootstrap-datepicker.es.min.js' />"></script>
	<script src="<c:url value='/resources/assets/js/gsdk-bootstrap-wizard.js' />"></script>

	<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
	<script src="<c:url value='/resources/assets/js/jquery.validate.min.js' />"></script>

</html>