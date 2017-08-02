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
 
  
  
  		<form action="editUserPage.do" method="GET">
    			<input type="submit" value="Edit your Profile" name="${user.id}">
    			<input type="hidden" value="${user.id}" name="userId">
  		</form>
  		
  		<form action="deleteUser.do" method="POST">
    			<input type="submit" value="Delete your account">
    			<input type="hidden" value="${user.id}" name="userId">
  		</form>
  		
  		<%-- <form action="viewFriends.do" method="GET">
  		<h3>Your Bros</h3>
  			<c:forEach items = "${user.friends}" var = "friends">
         		<input type="submit" value="${friends.firstName} ${friends.lastName}">
    				<input type="hidden" value="${friends.id}" name="friendId">
         </c:forEach>	
  		</form> --%>
  		
  		<form action="viewTrip.do" method="GET">
  		<h3>Your Trips</h3>
  			<c:forEach items = "${user.trips}" var = "trips">
         		<input type="submit" value="${trips.destination}">
    				<input type="hidden" value="${trips.id}" name="tripId">
         </c:forEach>	
  		</form>
  		
  		<form action="createTripPage.do" method="GET">
    			<input type="submit" value="Create Trip">
    			<input type="hidden" value="${user.id}" name="userId">
  		</form>
  
  		<form action="searchPage.do" method="GET">
  			<input type="submit" value="Search for Bros or Rides">
  		</form>

  
  </div>
  
 
    </div> <!-- end of opening container -->
  
  </body>
  
  </html>