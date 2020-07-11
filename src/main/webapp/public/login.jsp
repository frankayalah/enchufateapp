<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<link href="<c:url value='/resources/css/project_style.css' />" rel="stylesheet"/>

<!--Bootsrap 4 CDN-->
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap/bootstrap-4.1.3.min.css' />">
   
<!--Fontawesome CDN-->
<link rel="stylesheet" href="<c:url value='/resources/css/all_style.css' />">

<!--Custom styles-->
<link href="<c:url value='/resources/css/login_style.css' />" rel="stylesheet"/>

<%
String mensajeExito = (String)session.getAttribute("messageSuccess");
session.removeAttribute("messageSuccess");
%>

<div class="d-flex justify-content-center h-100">
	<div class="card">
		<div class="card-header">
			<img src="<c:url value='/resources/img/logo.png' />">
			<div class="d-flex justify-content-end social_icon">
				<span><i class="fab fa-facebook-square"></i></span>
				<span><i class="fab fa-google-plus-square"></i></span>
				<span><i class="fab fa-twitter-square"></i></span>
			</div>
		</div>
		<div class="card-body" ng-controller="loginController">
	        
	        <% if(mensajeExito != null){ %>
			<div class="alert alert-success fade show" role="alert">
			  <strong>Éxito! </strong><%=mensajeExito%>
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
			<% } else { %>
			
	        <div class="alert alert-danger fade show" role="alert" ng-class="{'': displayLoginError == true, 'none': displayLoginError == false}">
			  <strong>Error! </strong><spring:message code="login.error" />
			</div>
	        
			<% } %>
	        
			<form method="post" name="login" action="j_spring_security_check">
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-user"></i></span>
					</div>
					<input name="j_username" id="j_username" type="email" required class="form-control tipoEmail" placeholder="Correo UPC">
					
				</div>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-key"></i></span>
					</div>
					<input name="j_password" id="j_password" type="password" required class="form-control" placeholder="Contraseña" autocomplete="off">
				</div>
				<div class="form-group">
					<input type="submit" name="btnSubmit" value="Ingresar" class="btn float-right login_btn">
				</div>
			</form>
		</div>
		<div class="card-footer">
			<div class="d-flex justify-content-center links">
				¿No tienes una cuenta?<a href="signup">Regístrate</a>
			</div>
			<div class="d-flex justify-content-center">
				<a href="#">¿Olvidaste tu contraseña?</a>
			</div>
		</div>
	</div>
</div>

<script src="<c:url value='/resources/js/pages/login.js' />"></script>