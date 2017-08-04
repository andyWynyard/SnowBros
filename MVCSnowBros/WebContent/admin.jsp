<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="en">
  <head>    
    
    <meta charset="UTF-8">
    <title>adminView</title>
    
     </head>
  <body>
  <div class="container">
 <%-- <jsp:include page="partials/_title.jsp"></jsp:include> 
 <jsp:include page="partials/_navProfile.jsp"></jsp:include> --%> 
  <div class="well">
  <div class="row">
 	<div class="col-xs-6">
  		<h2>Admin Page</h2>
  		<h4>All users:</h4>
  			<c:forEach items ="${allUsers}" var = "user">
  				<c:out value="${user.firstName}"></c:out>
  				<c:out value="${user.lastName}"></c:out>		
  				<br>
         	</c:forEach>
         <h4>All trips:</h4>
         	<c:forEach items ="${allTrips}" var = "trip">
  				<c:out value="${trip.title}"></c:out>
  				<c:out value="${trip.description}"></c:out>
  				<br>	
  		    </c:forEach>
     </div>
  </div>
  </div>
 
    </div> <!-- end of opening container -->
  
  </body>
  
  </html>