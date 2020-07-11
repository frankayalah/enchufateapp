<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
  <a class="navbar-brand" href="#"><img src="<c:url value='/resources/img/logo.png' />" style="height: 39px; width: 48px;"></a>
  <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="navbar-collapse collapse" id="navbarCollapse" style="">
    <ul class="navbar-nav mr-auto" ng-controller="LocationController">
      <li class="nav-item" ng-class="{'active': activeURL == 'home', '': activeURL != 'home'}">
        <a class="nav-link" href="<c:url value="/"/>">
        	<spring:message code="header.home"/>
        </a>
      </li>
      <li class="nav-item" ng-class="{'active': activeURL == 'search', '': activeURL != 'search'}">
        <a class="nav-link" href="<c:url value='/protected/search'/>">
        	<spring:message code="header.search"/>
        </a>
      </li>
      <li class="nav-item" ng-class="{'active': activeURL == 'profile', '': activeURL != 'profile'}">
        <a class="nav-link" href="<c:url value='/protected/profile'/>">
        	<spring:message code="header.profile"/>
        </a>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li class="nav-item">
      	<a class="nav-link" title="<spring:message code="header.logout"/>" href="<c:url value='/logout'/>">(${usersession.nombreCompleto})&nbsp;<i class="fa fa-sign-out" aria-hidden="true"></i></a>
      </li>
    </ul> 
  </div>
</nav>