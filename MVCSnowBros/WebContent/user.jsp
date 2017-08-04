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
 	<div class="col-xs-6">
		
  		<%-- <form action="viewFriends.do" method="GET">
  		<h3>Your Bros</h3>
  			<c:forEach items = "${user.friends}" var = "friends">
         		<input type="submit" value="${friends.firstName} ${friends.lastName}">
    				<input type="hidden" value="${friends.id}" name="friendId">
         </c:forEach>	
  		</form> --%>
  		
  		<h3>Your Trips</h3>
  			<c:forEach items = "${user.trips}" var = "trips">
  		<form action="viewTrip.do" method="GET">
         		<input type="submit" class="btn btn-info btn-block btn-lg" value="${trips.destination.name} on ${trips.date}">
    				<input type="hidden" value="${trips.id}" name="tripId">
  		</form>
  		<br>
         </c:forEach>	
         </div>
  	<div class="col-xs-6">
		
		<h3>Your SnowBros</h3>	
  		<c:forEach items = "${friends}" var = "bro">
  		<form action="ViewUser.do" method="GET">
         		<p><input type="submit" class="btn btn-success btn-block btn-lg" value="${bro.firstName} ${bro.lastName}">
    					<input type="hidden" value="${bro.id}" name="broId">
  					</form>	
	
						<br>
         </c:forEach> 	

  
  </div>
  </div>
  </div>
 
    </div> <!-- end of opening container -->
  
  </body>
  
  </html>