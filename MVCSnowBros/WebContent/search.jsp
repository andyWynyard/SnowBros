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
		
			<h3>Search for Trip</h3>
			<form action="searchTrip.do" method="GET">
			
			
			<div class="input-group">
      			<input type="text" class="form-control" placeholder="Search for..." name="searchTitle">
      				<span class="input-group-btn">
        					<button class="btn btn-default" type="submit">Go!</button>
      				</span>
    			</div><!-- /input-group -->
			
			</form>
			
			<br>
			<c:choose>
				<c:when test="${searchResults != null}">
					<c:forEach items="${searchResults}" var="trip">
					
					<form action="viewTrip.do" method="GET">
    					<p><input type="submit" class="btn btn-info btn-block" value="${trip.destination.name} on ${trip.date}">
    					<input type="hidden" value="${trip.id}" name="tripId">
  					</form>	
					<br>
					</c:forEach>
				</c:when>

				<c:otherwise>

					<c:forEach items="${allTrips}" var="trip">
    						<form action="viewTrip.do" method="GET">
    					<p><input type="submit" class="btn btn-info btn-block" value="${trip.destination.name} on ${trip.date}">
    					<input type="hidden" value="${trip.id}" name="tripId">
  					</form>	
  					<br>
					</c:forEach>

				</c:otherwise>

			</c:choose>
		</div>
		
		
		
		<div class="col-xs-6">
		
		<h3>Search for Bros</h3>
			<form action="searchUser.do" method="GET">
					
			<div class="input-group">
      			<input type="text" class="form-control" placeholder="Search for..." name="searchUser">
      				<span class="input-group-btn">
        					<button class="btn btn-default" type="submit">Go!</button>
      				</span>
    			</div><!-- /input-group -->		
					<br>
			</form>

    		

	<c:choose>
    						<c:when test="${searchResultsUsers != null}">
					<c:forEach items="${searchResultsUsers}" var="bro">
					
					
					<form action="viewUser.do" method="GET">
    					<p><input type="submit" class="btn btn-success btn-block" value="${bro.firstName} ${bro.lastName}">
    					<input type="hidden" value="${bro.id}" name="broId">
    					<input type="hidden" value="${user.id}" name="userId">
  					</form>	
	
						<br>
					
					
    						
					</c:forEach>
				</c:when>
		</c:choose>

		</div>
		</div>
	</div>
	</div><!-- end of opening container -->

</body>

</html>