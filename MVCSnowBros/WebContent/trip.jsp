<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="en">
  <head>    
    
    <meta charset="UTF-8">
    <title>View</title>
     <jsp:include page="partials/_resources.jsp"></jsp:include>
  </head>
  <body>
  <div class="container">
  	<jsp:include page="partials/_title.jsp"></jsp:include>
	<jsp:include page="partials/_navProfile.jsp"></jsp:include>
  
  <div class="well">
  
  <p>${trip.destination}</p>
  <p>${trip.description}</p>
  <p>${trip.extraCurr}</p>
  <p>${trip.pointOfReturn}</p>
  
   <c:choose>
   <c:when test="${user.id} == ${trip.ownerId}">
  		<form action="editTripPage.do" method="GET">
    			<input type="submit" value="Edit this Trip!">
    			<input type="hidden" value="${trip.id}" name="tripId">
  		</form>
  </c:when>
  
  <c:when test="${user.id} != ${trip.ownerId}">
   		<form action="addMeToTrip.do" method="POST">
    			<input type="submit" value="Add me to Trip!">
    			<input type="hidden" value="${user.id}" name="userId">
    			<input type="hidden" value="${trip.id}" name="tripId">
  		</form>
  	</c:when>
  </c:choose>
  
  	<iframe
  		width="300"
  		height="450"
  		frameborder="0" style="border:0"
  		src="https://www.google.com/maps/embed/v1/place?key=AIzaSyASJj0SjYy3dfJWAm53SUPlIlqOXclJEWk
    		&q=${trip.destination}" allowfullscreen>
	</iframe>
  
  </div>
  
  
  
  		<form action="editUserPage.do" method="GET">
    			<input type="submit" value="Edit profile" name="${user.id}">
    			<input type="hidden" value="${user.id}" name="userId">
  		</form>
  		
  		<c:if test="${user.id} == ${trip.ownerId}">
  		
  		<form action="deleteTrip.do" method="POST">
    			<input type="submit" value="Delete this trip">
    			<input type="hidden" value="${trip.id}" name="tripId">
    			<input type="hidden" value="${user.id}" name="userId">
  		</form>
  		
  		</c:if>
  		
  		<form action="getProfilePage.do" method="GET">
  		<h3>Your Bros</h3>
  			<c:forEach items = "${tripPassengers}" var = "bros">
         		<input type="submit" value="${bros.firstName} ${bros.lastName}">
    				<input type="hidden" value="${bros.id}" name="userId">
         </c:forEach>	
  		</form>

  
  </div>
  
 
  
  </body>
  
  </html>