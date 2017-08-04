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
	<%-- 	<p>Scooby Snax</p>	
		<input type="textarea" name="extraCurr" value="${trip.extraCurr}"/>
 		 --%>
    		<br>
    		<br>
    		<input type="hidden" name="userId" value="${user.id}">
      <input type="submit" value="Submit" name="submit" />
      </form>

  
   </div>
  
 </div> <!-- end of main container -->
  
  </body>
  
  </html>