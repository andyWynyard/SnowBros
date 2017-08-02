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
			Search for Trip
			<form action="searchTrip.do" method="GET">
				<input type="submit" value="Search"> <input type="text"
					name="searchTitle">
			</form>
			


			<br><br>
			<c:choose>
				<c:when test="${searchResults != null}">
					<c:forEach items="${searchResults}" var="trip">
    						${trip.title}<br>
    						${trip.destination}<br>
    						${trip.date}<br>
    						${trip.description}<br>
    						${trip.numberSeats}<br>
					</c:forEach>
				</c:when>

				<c:otherwise>

					<c:forEach items="${allTrips}" var="trip">
    						${trip.title}<br>
    						${trip.destination.name}<br>
    						<br><br>
					</c:forEach>

				</c:otherwise>

			</c:choose>
		</div>


	</div>
	<!-- end of opening container -->

</body>

</html>