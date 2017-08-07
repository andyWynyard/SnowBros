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
  <div class="row">
 <div class="col-sm-6">
  
  
  
  		
  		<%-- <form action="viewFriends.do" method="GET">
  		<h3>Your Bros</h3>
  			<c:forEach items = "${user.friends}" var = "friends">
         		<input type="submit" value="${friends.firstName} ${friends.lastName}">
    				<input type="hidden" value="${friends.id}" name="friendId">
         </c:forEach>	
  		</form> --%>
  	
  	
  	
  	<div class="row">
  	<div class="col-sm-6">
  	<p><img src="${user.picture}" alt="Your photo" height="100%" width="100%"></p>
  	</div>
  	<div class="col-sm-6">
  	
  		<h2>${bro.firstName} ${bro.lastName}</h2>
  		<h4>${bro.email}</h4>
  		<h4>Rating: ${brorating}</h4>
	</div>
	</div>
	<div class="row">
  		
  			<c:choose>
  				<c:when test = "${previousRater}">
  			<form action="rate.do" method="GET">
		<div class="col-sm-4">
  			<p><button type="button" class="btn btn-primary btn-lg btn-block" disabled>Rate this Bro: </button></p>
		</div>
		<div class="col-sm-4">
  			<input type="hidden" value="${bro.id}" name="broId">
  			<p><select name = "rating" class="form-control input-lg">
  				<option value="1">1</option>
 				 <option value="2">2</option>
 				 <option value="3">3</option>
 				 <option value="4">4</option>
 				 <option value="5">5</option>
			</select></p>
			
		</div>
		<div class="col-sm-4">

			<p><input type="submit" class="btn btn-primary btn-lg btn-block" value="Rate"></p>
		</div>
  			</form>
  			
  			
  		</c:when>
		</c:choose>
	</div>
	<div class="row">
		<div class="col-sm-12">
  			<c:choose>
  			
    				<c:when test="${addFriend}">
					
					<form action="addFriend.do" method="POST">
    					<p><input type="submit" class="btn btn-success btn-lg btn-block" value="Add Bro">
    					<input type="hidden" value="${bro.id}" name="broId">
    					<input type="hidden" value="${user.id}" name="userId">
  					</form>	
	
						
				
				</c:when>
				<c:otherwise>
					<form action="deleteFriend.do" method="POST">
    					<p><input type="submit" class="btn btn-danger btn-lg btn-block" value="Delete Friend">
    					<input type="hidden" value="${bro.id}" name="broId">
    					<input type="hidden" value="${user.id}" name="userId">
  					</form>	
	
						
				</c:otherwise>
				
		</c:choose>
		</div>
	</div>
	</div>
		<div class="col-sm-6">
		
		
 	<p><button type="button" class="btn btn-secondary btn-block btn-lg" disabled>Bro's Trips</button></p>
  			
  			<c:forEach items = "${bro.trips}" var = "trips">
  			<form action="viewTrip.do" method="GET">
         		<p><input type="submit" class="btn btn-info btn-lg btn-block" value="${trips.destination.name} on ${trips.date}"></p>
    				<input type="hidden" value="${trips.id}" name="tripId">
  		</form>
         </c:forEach>	
  		
  		
		</div>	
		</div>
	</div> <!-- end of single well for page -->
	
  
 
    </div> <!-- end of opening container -->
  
  </body>
  
  </html>