<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="en">
  <head>    
    
    <meta charset="UTF-8">
    <title>View</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <style>
    textarea {
    min-width: 100%;
    } 
 
    </style>
<link rel="shortcut icon" href="https://www.shareicon.net/data/128x128/2016/01/18/704925_letter_512x512.png" type="image/x-icon" />
  </head>
  <body>
  <div class="container">
  
  <div class="jumbotron">
  <h1>SnowBros</h1>
  <p>Get ready to go to shredtown!!!</p>
  <p>Go hard in the gnarly POW POW!</p>
  
  </div> <!-- End of Jumbotron -->
  
  
  
  <div class="well">
  <img src="${user.picture}" alt="Your photo" height="42" width="42">
  <h1>${user.firstName} ${user.lastName}</h1>
  <h3>${user.email}</h3>
  <h3>Your rating is: ${rating}</h3>
  
   <form action="logOut.do" method="GET">
  			<input type="submit" value="Log Out">
  		</form>
  
  <form action="getProfilePage.do" method="GET">
  			<input type="submit" value="Profile Page">
  			<input type="hidden" value="${user.id}" name="userId">
  		</form>
  
  </div>
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
    			<input type="submit" value="Edit this Film" name="${film.id}">
    			<input type="hidden" value="${user.id}" name="userId">
  		</form>
  		
  		<c:if test="${user.id} == ${trip.ownerId}">
  		
  		<form action="deleteTrip.do" method="POST">
    			<input type="submit" value="Delete this trip">
    			<input type="hidden" value="${trip.id}" name="tripId">
  		</form>
  		
  		</c:if>
  		
  		<form action="viewButtsInSeats.do" method="GET">
  		<h3>Your Bro's</h3>
  			<c:forEach items = "${tripPassengers}" var = "bros">
         		<input type="submit" value="${bros.firstName} ${bros.lastName}">
    				<input type="hidden" value="${bros.id}" name="broId">
         </c:forEach>	
  		</form>

  
  </div>
  
 
  
  </body>
  
  </html>