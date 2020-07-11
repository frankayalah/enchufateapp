<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!doctype html>
<html lang="en" id="ng-app" ng-app="">
	<head>
		<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title><spring:message code="project.title" /></title>
        
        <!-- Fonts and icons -->
    	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">
        
        <!-- CSS Files -->
        <link href="<c:url value='/resources/css/bootstrap/bootstrap-4.1.1.min.css' />" rel="stylesheet">
        <link href="<c:url value='/resources/assets/css/gsdk-bootstrap-wizard.css' />" rel="stylesheet" />
        
        <script src="<c:url value='/resources/js/util/jquery-3.2.1.min.js' />"></script>
        <script src="<c:url value='/resources/js/jquery-1.15.1.validate.min.js' />"></script>
        <script src="<c:url value='/resources/js/angular.min.js' />"></script>
    </head>
    <body>
    	<tiles:insertAttribute name="header" />
        <div class="container">
            <tiles:insertAttribute name="body" />
        </div>

        <!--[if IE]>
            <script src="<c:url value='/resources/js/bootstrap.min.ie.js' />"></script>
        <![endif]-->
        <!--[if !IE]><!-->
            <script src="<c:url value='/resources/js/util/bootstrap-4.1.1.min.js' />"></script>
        <!--<![endif]-->

        <tiles:insertAttribute name="footer" />
    </body>
</html>