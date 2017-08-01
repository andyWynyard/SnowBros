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
 
  
  
  		<form action="editUserPage.do" method="GET">
    			<input type="submit" value="Edit your Profile" name="${user.id}">
    			<input type="hidden" value="${user.id}" name="userId">
  		</form>
  		
  		<form action="deleteUser.do" method="POST">
    			<input type="submit" value="Delete your account">
    			<input type="hidden" value="${user.id}" name="userId">
  		</form>
  		
  		<form action="viewFriends.do" method="GET">
  		<h3>Your Bro's</h3>
  			<c:forEach items = "${user.friends}" var = "friends">
         		<input type="submit" value="${friends.firstName} ${friends.lastName}">
    				<input type="hidden" value="${friends.id}" name="friendId">
         </c:forEach>	
  		</form>
  		
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