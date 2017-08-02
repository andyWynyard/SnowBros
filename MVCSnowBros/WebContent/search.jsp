<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<title>View</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<style>
textarea {
	min-width: 100%;
}
</style>
<link rel="shortcut icon"
	href="https://www.shareicon.net/data/128x128/2016/01/18/704925_letter_512x512.png"
	type="image/x-icon" />
</head>
<body>
	<div class="container">

		<div class="jumbotron">
			<h1>SnowBros</h1>
			<p>Get ready to go to shredtown!!!</p>
			<p>Go hard in the gnarly POW POW!</p>



		</div>
		<!-- End of Jumbotron -->

		<div class="well">
			<img src="${user.picture}" alt="Your photo" height="42" width="42">
			<h1>${user.firstName}${user.lastName}</h1>
			<h3>${user.email}</h3>
			<h3>Your rating is: ${rating}</h3>

			<form action="logOut.do" method="GET">
				<input type="submit" value="Log Out">
			</form>

			<form action="getProfilePage.do" method="GET">
				<input type="submit" value="Profile Page"> <input
					type="hidden" value="${user.id}" name="userId">
			</form>

		</div>

		<div class="well">
			Search for Trip by Title
			<form action="searchTitle.do" method="GET">
				<input type="submit" value="Search"> <input type="text"
					name="searchTitle">
			</form>
			<br> Search for Trip by Extracurriculars
			<form action="searchExtra.do" method="GET">
				<input type="submit" value="Search"> <input type="text"
					name="searchEC">
			</form>
			<br> Search for Trips by User
			<form action="searchUser.do" method="GET">
				<input type="submit" value="Search"> <input type="text"
					name="searchUser">
			</form>


			<br><br>
			<c:choose>
				<c:when test="${searchResults} != null">
					<c:forEach items="${searchresults}" var="trip">
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
    						${trip.destination}<br>
    						${trip.date}<br>
    						${trip.description}<br>
    						${trip.numberSeats}<br>
					</c:forEach>

				</c:otherwise>

			</c:choose>
		</div>


	</div>
	<!-- end of opening container -->

</body>

</html>