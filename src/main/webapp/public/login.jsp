<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="pt-BR" id="ng-app" ng-app="">
<head>
    <title><spring:message code="project.title" /></title>

    <link href="<c:url value='/resources/css/bootstrap/bootstrap-4.1.1.min.css' />" rel="stylesheet" id="bootstrap-css">
    <link href="<c:url value='/resources/css/bootstrap-responsive.min.css' />" rel="stylesheet"/>
    <link href="<c:url value='/resources/css/project_style.css' />" rel="stylesheet"/>
	<script src="<c:url value='/resources/js/jquery-1.9.1.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery-1.15.1.validate.min.js' />"></script>
    <script src="<c:url value='/resources/js/angular.min.js' />"></script>
	
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap/bootstrap-4.1.3.min.css' />">
	   
	<!--Fontawesome CDN-->
	<link rel="stylesheet" href="<c:url value='/resources/css/all_style.css' />">
	
	<!--Custom styles-->
	<link href="<c:url value='/resources/css/login_style.css' />" rel="stylesheet"/>
</head>
<body>

<div class="container">
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
			<div class="alert alert-danger" ng-class="{'': displayLoginError == true, 'none': displayLoginError == false}">
	            <spring:message code="login.error" />
	        </div>
			<form method="post" name="login" action="j_spring_security_check">
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-user"></i></span>
					</div>
					<input name="j_username" id="j_username" type="email" class="form-control" placeholder="Correo UPC">
					
				</div>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-key"></i></span>
					</div>
					<input name="j_password" id="j_password" type="password" class="form-control" placeholder="Contraseña">
				</div>
				<div class="form-group">
					<input type="submit" name="submit" value="Ingresar" class="btn float-right login_btn">
				</div>
			</form>
		</div>
		<div class="card-footer">
			<div class="d-flex justify-content-center links">
				¿No tienes una cuenta?<a href="#">Regístrate</a>
			</div>
			<div class="d-flex justify-content-center">
				<a href="#">¿Olvidaste tu contraseña?</a>
			</div>
		</div>
	</div>
</div>

</div>

<!--[if IE]>
    <script src="<c:url value='/resources/js/bootstrap.min.ie.js' />"></script>
<![endif]-->
<!--[if !IE]><!-->
    <script src="<c:url value='/resources/js/util/bootstrap-4.1.1.min.js' />"></script>
<!--<![endif]-->

<script src="<c:url value='/resources/js/pages/login.js' />"></script>

</body>
</html>