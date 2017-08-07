<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> --%> 

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
  <div class="row">
  <div class="col-sm-6">
  
  <div class="panel panel-success">
  <div class="panel-heading">
    <h3 class="panel-title">Trip: ${trip.title}</h3>
  </div>
  <div class="panel-body">
    <p>Destination: ${trip.destination.name}</p>
  	<p>Description: ${trip.description}</p>
  	<p> Seats available: ${trip.numberSeats}</p>
  	<p> Date: ${trip.date}</p>
  <%-- <p>${trip.extraCurr}</p> --%>
  	<p>Leaving from: ${trip.pointOfOrigin}</p>
  	<p>Return point: ${trip.pointOfReturn}</p>
  </div>
</div>
  
 
 
  	
  
  
   <c:choose>
   <c:when test="${user.id == trip.ownerId}">
  		<form action="editTripPage.do" method="GET">
    			<p><input type="submit" class="btn btn-warning btn-block" value="Edit this Trip!"></p>
    			<input type="hidden" value="${trip.id}" name="tripId">
    			<input type="hidden" value="${user}" name="user">
  		</form>
  </c:when>
  
  <c:when test="${user.id != trip.ownerId && trip.numberSeats > 0 && !rider }">

   		<form action="addMeToTrip.do" method="POST">
    			<p><input type="submit" class="btn btn-primary btn-block" value="Add me to Trip!"></p>
    			<input type="hidden" value="${user.id}" name="userId">
    			<input type="hidden" value="${trip.id}" name="tripId">
  		</form>
  	
  	</c:when>
  </c:choose>
  
  <c:if test="${user.id == trip.ownerId}">
  		
  		<form action="deleteTrip.do" method="POST">
    			<p><input type="submit" class="btn btn-danger btn-block" value="Delete this trip"></p>
    			<input type="hidden" value="${trip.id}" name="tripId">
    			<input type="hidden" value="${user.id}" name="userId">
  		</form>
  		</c:if>
  		
 <c:if test="${user.id == trip.ownerId}"> 		 		
  		<h3>Current Passengers</h3>
  		
  		<div class="row">
  		
  			<c:forEach items = "${trip.users}" var = "bros">
  			<c:choose>
	  			<c:when test="${bros.id == user.id}">
	  			<div class="col-sm-8">
	  				<form action="getProfilePage.do" method="GET">
	  				<p><input type="submit" class="btn btn-success btn-block" value="${bros.firstName} ${bros.lastName}"></p>
	  				<input type="hidden" name="userId" value="${bros.id}">
	  				</form>
	  				</div>
	  			</c:when>
	  			<c:otherwise>
	  			<div class="col-sm-8">
	  			<form action="ViewUser.do" method="GET">
	         		<p><input type="submit" class="btn btn-success btn-block" value="${bros.firstName} ${bros.lastName}"></p>
	    				<input type="hidden" value="${bros.id}" name="broId">
	    			</form>
	    		</div>
	    			</c:otherwise>
    			</c:choose>
    		<div class="col-sm-4">	
    			<c:if test="${user.id == trip.ownerId}">
    			<form action="removeBroFromTrip.do" method="POST">
    			<p><input type="submit" class="btn btn-danger btn-block" value="Remove from Trip"></p>
    				<input type="hidden" value="${bros.id}" name="broId">
    				<input type="hidden" value="${user.id}" name="userId">
    				<input type="hidden" value="${trip.id}" name="tripId">
    			</form>
    			</c:if>
  		</div>
    				<br>
         </c:forEach>	
         </div>	
     </c:if> 	     
         
      
      
      <c:if test="${user.id != trip.ownerId}"> 		 		
  		<h3>Current Passengers</h3>
  		
  		<div class="row">
  		
  			<c:forEach items = "${trip.users}" var = "bros">
  			<c:choose>
  			<c:when test="${bros.id == user.id}">
  			<div class="col-sm-12">
  				<form action="getProfilePage.do" method="GET">
  				<p><input type="submit" class="btn btn-success btn-block" value="${bros.firstName} ${bros.lastName}"></p>
  				<input type="hidden" name="userId" value="${bros.id}">
  				</form>
  				</div>
  			</c:when>
  			<c:otherwise>
  			<div class="col-sm-12">
  			<form action="ViewUser.do" method="GET">
         		<p><input type="submit" class="btn btn-success btn-block" value="${bros.firstName} ${bros.lastName}"></p>
    				<input type="hidden" value="${bros.id}" name="broId">
    			</form>
    		</div>
    		</c:otherwise>
    		</c:choose>
    		
    				<br>
         </c:forEach>	
         </div>	
     </c:if>    
         
         
         <c:if test="${user.id != trip.ownerId && rider}">	
    		<form action="removeBroFromTrip.do" method="POST">	
    		<input type="submit" class="btn btn-danger btn-block" value="Remove me from Trip">
    				<input type="hidden" value="${user.id}" name="broId">
    				<input type="hidden" value="${user.id}" name="userId">
    				<input type="hidden" value="${trip.id}" name="tripId">
    			</form>
    		
    		</c:if>
  		
  
  </div>
  <div class="col-sm-6">
  
  	<iframe
  		width="100%"
  		height="450px"
  		frameborder="0" style="border:0"
  		src="https://www.google.com/maps/embed/v1/place?key=AIzaSyASJj0SjYy3dfJWAm53SUPlIlqOXclJEWk
    		&q=${trip.destination.name}" allowfullscreen>
	</iframe>
  
  </div>
  </div>
  </div>
  <div class="well">
  <div class="row">
  <div class="col-sm-4">
   <form action="postMessage.do" method="POST">
   <div class="form-group">
   
   <textarea class="form-control" rows="7" id="message" name="message" placeholder="Enter a message here!"></textarea>
	  	<input type="hidden" name="tripId" value="${trip.id}">
	  	</div>
	  	<input type="submit" class="btn btn-success btn-block" value="Post this message!">
	  </form>
	  </div>
  
  
  <div class="col-sm-8">
  
  	  <!--MESSAGE BOARD-->
	  <c:forEach items="${messages}" var="message">
	  <div class="panel panel-success">
  <div class="panel-heading">

    <h3 class="panel-title">${message.ownerName} on ${message.date}</h3>

    </div>
  <div class="panel-body">
	  	
	  	<p>${message.message}</p>
	  	</div>
	  	</div>
	  	
	  </c:forEach>
  
  </div>
  </div>
  </div> <!-- end of message well -->
  </div>
  
  
  
 
  
  </body>
  
  </html>