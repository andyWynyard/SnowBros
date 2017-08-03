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
 
  
  
  
  		
  		<%-- <form action="viewFriends.do" method="GET">
  		<h3>Your Bros</h3>
  			<c:forEach items = "${user.friends}" var = "friends">
         		<input type="submit" value="${friends.firstName} ${friends.lastName}">
    				<input type="hidden" value="${friends.id}" name="friendId">
         </c:forEach>	
  		</form> --%>
  		
  		<h4>${bro.firstName}</h4>
  			Rating: ${brorating}	
  			<form action="rate.do" method="GET">
  			<input type="hidden" value="${bro.id}" name="broId">
  			<input type="submit" value="Rate User" name="Rate" />
  			</form>
  			<c:choose>
    						<c:when test="${addFriend}">
					
					
					
					<form action="addFriend.do" method="GET">
    					<p><input type="submit" class="btn btn-success btn-block" value="Add Friend">
    					<input type="hidden" value="${bro.id}" name="broId">
    					<input type="hidden" value="${user.id}" name="userId">
  					</form>	
	
						<br>
				
				</c:when>
		</c:choose>
  			<br><br>
  			<c:forEach items = "${bro.trips}" var = "trips">
  			<form action="viewTrip.do" method="GET">
         		<input type="submit" class="btn btn-primary btn-lg active" value="${trips.destination.name} on ${trips.date}">
    				<input type="hidden" value="${trips.id}" name="tripId">
  		</form>
         </c:forEach>	
  		
  		

  
  </div>
  
 
    </div> <!-- end of opening container -->
  
  </body>
  
  </html>