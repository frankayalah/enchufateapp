<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- Fonts and icons -->
<link href="<c:url value='/resources/css/font-awesome/font-awesome-4.4.0.css' />" rel="stylesheet" />

<!-- CSS Files -->
<link href="<c:url value='/resources/assets/css/bootstrap.min.css' />" rel="stylesheet" />
<link href="<c:url value='/resources/assets/css/gsdk-bootstrap-wizard.css' />" rel="stylesheet" />
<link href="<c:url value='/resources/css/bootstrap/bootstrap-datepicker.min.css' />" rel="stylesheet" />
<script src="<c:url value='/resources/js/angular.min.js' />"></script>


<style type="text/css">
select.form-control:not([size]):not([multiple]) {
    height: 38px;
}
</style>

<div class="row" ng-controller="profileController">
        <div class="col-sm-8 col-sm-offset-2">

            <!--      Wizard container        -->
            <div class="wizard-container">

                <div class="card wizard-card" data-color="red" id="wizardProfile">
                    <form method="post" name="signup" action="public/user" >

						<div class="wizard-navigation">
							<ul>
	                            <li><a href="#account" data-toggle="tab">Mantén actualizada tu información, para conocer nuevas personas...</a></li>
	                        </ul>
						</div>

                        <div class="tab-content">
                            <div class="tab-pane" id="account">
                            	
                            	<div class="row">
                                  <div class="col-sm-5 col-sm-offset-1">
                                      <div class="form-group">
                                        <label>Nombre <small>(requerido)</small></label>
                                        <input name="nombre" value="${user.nombre}" ng-model="user.nombre" type="text" class="form-control" placeholder="David...">
                                      </div>
                                  </div>
                                  <div class="col-sm-5">
                                      <div class="form-group">
                                        <label>Apellidos <small>(requerido)</small></label>
                                        <input name="apellidos" value="${user.apellidos}" ng-model="user.apellidos" type="text" class="form-control" placeholder="Fischman Kalincausky...">
                                      </div>
                                  </div>
                                  <div class="col-sm-5 col-sm-offset-1">
                                         <div class="form-group">
                                            <label>Fecha de Nacimiento</label>
											<div class="input-group date">
											  <input type="text" name="fechaNacimiento" value="${user.fechaNacimiento}" ng-model="user.fechaNacimiento" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
											</div>
                                          </div>
                                    </div>
                                    <div class="col-sm-5">
                                         <div class="form-group">
                                            <label>Género</label>
                                            <select name="genero" value="${user.genero}" ng-model="user.genero" class="form-control">
                                            	<option value=""> - Seleccione - </option>
                                                <option value="Masculino"> Masculino </option>
                                                <option value="Femenino"> Femenino </option>
                                            </select>
                                          </div>
                                    </div>
                                    <div class="col-sm-5 col-sm-offset-1">
                                         <div class="form-group">
                                            <label>Sede</label><br>
                                             <select name="sede" value="${user.sede}" ng-model="user.sede" class="form-control">
                                             	<option value=""> - Seleccione - </option>
                                                <option value="San Isidro"> San Isidro </option>
                                                <option value="La Molina"> La Molina </option>
                                                <option value="San Miguel"> San Miguel </option>
                                                <option value="Villa"> Villa </option>
                                            </select>
                                          </div>
                                    </div>                                 
                              </div>
                            
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
                                
                                <h4 class="info-text"> Cuéntanos sobre ti... </h4>
                                
                                <div class="row" >
                                <div class="col-sm-6 col-sm-offset-1">
                                     <div class="form-group">
                                        <textarea class="form-control" style="width: 100%" value="${user.descripcion}" ng-model="user.descripcion" name="descripcion" placeholder="" rows="9"></textarea>
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
                                <input type='button' class='btn btn-finish btn-fill btn-warning btn-wd btn-sm' name='finish' value='Guardar' />

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
        
	<!--   Core JS Files   -->
	<script src="<c:url value='/resources/assets/js/bootstrap.min.js' />" type="text/javascript"></script>
	<script src="<c:url value='/resources/assets/js/jquery.bootstrap.wizard.js' />" type="text/javascript"></script>
	

	<!--  Plugin for the Wizard -->
	<script src="<c:url value='/resources/js/util/bootstrap-datepicker.min.js' />"></script>
	<script src="<c:url value='/resources/js/util/bootstrap-datepicker.es.min.js' />"></script>
	<script src="<c:url value='/resources/js/pages/profile.js' />"></script>
