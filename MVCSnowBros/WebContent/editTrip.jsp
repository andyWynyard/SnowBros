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
    <div class="row">
    <div class="col-sm-4">
       <h4>Title</h4>
       <input type="text" class="form-control input-lg" name="title" value="${trip.title}"/>
       </div>
       <div class="col-sm-8">
       <h4>Destination</h4>
       <input type="text" class="form-control input-lg" name="destination" value="${trip.destination.name}"/>
       </div>
       </div>
    <div class="row">
    <div class="col-sm-12">
       <h4>Description</h4>
       <input type="text" class="form-control input-lg" name="description" value="${trip.description}"/>
       </div>
    </div>
    <div class="row">
    <div class="col-sm-6">
       <h4>Leaving from</h4>
       <input type="text" class="form-control input-lg" name="pointOfOrigin" value="${trip.pointOfOrigin}"/>
       </div>
     <div class="col-sm-6">
     <h4>Returning to</h4>
       <input type="text" class="form-control input-lg" name="pointOfReturn" value="${trip.pointOfReturn}"/>
     
     </div>
     </div>
     <div class="row">
       <div class="col-sm-6">
       <h4>Date/Time</h4>
       <input type="datetime-local" class="form-control input-lg" name="date" value="${trip.date}"/>
      </div>
       <div class="col-sm-6">
       
       <div class="invisible"><h4>Submit</h4></div>
       <input type="hidden" name="userId" value="${user.id}">
      <input type="submit" class="btn btn-primary btn-lg btn-block" value="Submit" name="submit" />
       
       </div>
       </div>
       <input type="hidden" name="numberSeats" value="${trip.numberSeats}">
       <%-- <p>Places</p>
       
    		<select name="numberSeats" value="${trip.numberSeats}">
  			<option value="1">1</option>
  			<option value="2">2</option>
  			<option value="3">3</option>
  			<option value="4">4</option>
  			<option value="5">5</option>
  			<option value="6">6</option>
		</select> --%>
	<%-- 	<p>Scooby Snax</p>	
		<input type="textarea" name="extraCurr" value="${trip.extraCurr}"/>
 		 --%>
    		
    		
      </form>

  
   </div>
  
 </div> <!-- end of main container -->
  
  </body>
  
  </html>