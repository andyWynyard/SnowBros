<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
		
			Search for Trip
			<form action="searchTrip.do" method="GET">
				<input type="submit" value="Search"> <input type="text"
					name="searchTitle">
			</form>
			
			<br><br>
			<c:choose>
				<c:when test="${searchResults != null}">
					<c:forEach items="${searchResults}" var="trip">
					
					
					<form action="viewTrip.do" method="POST">
    					<p><input type="submit" value="${trip.destination.name} on ${trip.date}">
    					<input type="hidden" value="${trip.id}" name="tripId">
  					</form>	
					
					
    						
					</c:forEach>
				</c:when>

				<c:otherwise>

					<c:forEach items="${allTrips}" var="trip">
    						<form action="viewTrip.do" method="POST">
    					<p><input type="submit" value="${trip.destination.name} on ${trip.date}">
    					<input type="hidden" value="${trip.id}" name="tripId">
  					</form>	
					</c:forEach>

				</c:otherwise>

			</c:choose>
		</div>
		
		
		
		<div class="col-xs-6">
		
		Search for Bros
			<form action="searchUser.do" method="GET">
				<input type="submit" value="Search"> <input type="text"
					name="searchUser">
			</form>
	<c:choose>
    						<c:when test="${searchResultsUsers != null}">
					<c:forEach items="${searchResultsUsers}" var="bro">
					
					
					<form action="ViewUser.do" method="GET">
    					<p><img src="${bro.picture}" alt="Your photo" height="10%" width="10%"><input type="submit" value="${bro.firstName}">
    					<input type="hidden" value="${bro.id}" name="broId">
    					<input type="hidden" value="${user.id}" name="userId">
  					</form>	
					
					
    						
					</c:forEach>
				</c:when>
		</c:choose>
		</div>
		
		
		

		</div>
	</div>
	</div><!-- end of opening container -->

</body>

</html>