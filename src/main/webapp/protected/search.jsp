<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- CSS Files -->
<link href="<c:url value='/resources/assets/css/bootstrap.min.css' />" rel="stylesheet" />
<link href="<c:url value='/resources/assets/css/gsdk-bootstrap-wizard.css' />" rel="stylesheet" />

<!-- CSS Files -->
<script src="<c:url value='/resources/js/angular.min.js' />"></script>


<style type="text/css">
select.form-control:not([size]):not([multiple]) {
    height: 38px;
}

.gallery {
-webkit-column-count: 3;
-moz-column-count: 3;
column-count: 3;
-webkit-column-width: 33%;
-moz-column-width: 33%;
column-width: 33%; }
.gallery .pics {
-webkit-transition: all 350ms ease;
transition: all 350ms ease; }
.gallery .animation {
-webkit-transform: scale(1);
-ms-transform: scale(1);
transform: scale(1); }

@media (max-width: 450px) {
.gallery {
-webkit-column-count: 1;
-moz-column-count: 1;
column-count: 1;
-webkit-column-width: 100%;
-moz-column-width: 100%;
column-width: 100%;
}
}

@media (max-width: 400px) {
.btn.filter {
padding-left: 1.1rem;
padding-right: 1.1rem;
}
}
</style>

<!-- Grid row -->
<div class="row">

  <!-- Grid column -->
  <div class="col-md-12 d-flex justify-content-center mb-5">

    <form  method="post" name="search" action="protected/search">
    
    <div class="row">
         <div class="col-sm-5 col-sm-offset-1">
             <div class="form-group">
               <label>Nombre <small>(requerido)</small></label>
               <input name="nombre" value="${user.nombre}" ng-model="user.nombre" type="text" class="form-control" placeholder="David...">
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
     
     <br/>
     
     <button type="button" class="btn btn-warning" onclick="ocultar();">Limpiar</button>
     <button type="button" class="btn btn-warning" onclick="mostrar();">Buscar</button>
    
    </form>

  </div>
  <!-- Grid column -->

</div>
<!-- Grid row -->

<!-- Grid row -->
<div class="gallery" id="gallery" style="display: none;">

  <!-- Grid column -->
  <div class="mb-3 pics animation all 2">
    <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(73).jpg" alt="Card image cap">
  </div>
  <!-- Grid column -->

  <!-- Grid column -->
  <div class="mb-3 pics animation all 1">
    <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Vertical/mountain1.jpg" alt="Card image cap">
  </div>
  <!-- Grid column -->

  <!-- Grid column -->
  <div class="mb-3 pics animation all 1">
    <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Vertical/mountain2.jpg" alt="Card image cap">
  </div>
  <!-- Grid column -->

  <!-- Grid column -->
  <div class="mb-3 pics animation all 2">
    <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(35).jpg" alt="Card image cap">
  </div>
  <!-- Grid column -->

  <!-- Grid column -->
  <div class="mb-3 pics animation all 2">
    <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(18).jpg" alt="Card image cap">
  </div>
  <!-- Grid column -->

  <!-- Grid column -->
  <div class="mb-3 pics animation all 1">
    <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Vertical/mountain3.jpg" alt="Card image cap">
  </div>
  <!-- Grid column -->

</div>
<!-- Grid row -->

	<!--  Plugin for the Wizard -->
	<script src="<c:url value='/resources/js/pages/search.js' />"></script>

	<!--   Core JS Files   -->
	<script src="<c:url value='/resources/assets/js/bootstrap.min.js' />" type="text/javascript"></script>
	<script src="<c:url value='/resources/assets/js/jquery.bootstrap.wizard.js' />" type="text/javascript"></script>