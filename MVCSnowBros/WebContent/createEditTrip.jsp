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
  	
  	<c:choose>
   <c:when test="${trip.id} == null">
   
   <h1>Create your trip here</h1>
    <form action="createTrip.do" method="POST">
    
       <h5>Title</h5>
       <input type="text" name="title"/>
       <h5>Destination</h5>
       <input type="text" name="destination"/>
       <h5>Description</h5>
       <input type="text" name="description"/>
       <h5>Leaving from</h5>
       <input type="text" name="pointOfOrigin"/>
       <h5>Date/Time</h5>
       <input type="datetime-local" name="date"/>
       
       <h5>Returning to</h5>
       <input type="text" name="pointOfReturn"/>
       
       <p>Places</p>
    		<select name="numberSeats">
  			<option value="1">1</option>
  			<option value="2">2</option>
  			<option value="3">3</option>
  			<option value="4">4</option>
  			<option value="5">5</option>
  			<option value="6">6</option>
		</select>
		<p>Scooby Snax</p>	
		<input type="textarea" name="extraCurr"/>
 		
    		<br>
    		<br>
    		<input type="hidden" name="userId" value="${user.id}">
      <input type="submit" value="Submit" name="submit" />
      </form>
  
  
  </c:when>
   <c:when test="${trip.id} != null">
   
   <h1>Edit your trip here</h1>
    <form action="editTrip.do" method="POST">
    
       <h5>Title</h5>
       <input type="text" name="title" value="${trip.title}"/>
       <h5>Destination</h5>
       <input type="text" name="destination" value="${trip.destination}"/>
       <h5>Description</h5>
       <input type="text" name="description" value="${trip.description}"/>
       <h5>Leaving from</h5>
       <input type="text" name="pointOfOrigin" value="${trip.pointOfOrigin}"/>
       <h5>Date/Time</h5>
       <input type="datetime-local" name="date" value="${trip.date}"/>
       
       <h5>Returning to</h5>
       <input type="text" name="pointOfReturn" value="${trip.pointOfReturn}"/>
       
       <p>Places</p>
    		<select name="numberSeats" value="${trip.numberSeats}">
  			<option value="1">1</option>
  			<option value="2">2</option>
  			<option value="3">3</option>
  			<option value="4">4</option>
  			<option value="5">5</option>
  			<option value="6">6</option>
		</select>
		<p>Scooby Snax</p>	
		<input type="textarea" name="extraCurr" value="${trip.extraCurr}"/>
 		
    		<br>
    		<br>
    		<input type="hidden" name="userId" value="${user.id}">
      <input type="submit" value="Submit" name="submit" />
      </form>
   
   
   </c:when>  
</c:choose>
  
   </div>
  
 </div> <!-- end of main container -->
  
  </body>
  
  </html>