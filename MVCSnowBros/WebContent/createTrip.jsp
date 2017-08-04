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
  	
   
   <h1>Create your trip here</h1>
    <form action="createTrip.do" method="POST">
    <div class="row">
    <div class="col-xs-4"><h4>Title</h4><input type="text" class="form-control input-lg" name="title"/>
       </div>
     <div class="col-xs-8">  
       <h4>Destination</h4><input type="text" class="form-control input-lg" name="destination"/>
    </div> 
    </div>  
    
    <div class="row">
    <div class="col-xs-12">
    	<h4>Description</h4>
       <input type="text" class="form-control input-lg" name="description"/>
    	</div>   
    </div>
    
    <div class="row">
    <div class="col-xs-6">
    <h4>Leaving from</h4><input type="text" class="form-control input-lg" name="pointOfOrigin"/>
       </div>
     <div class="col-xs-6">  
     <h4>Returning to</h4><input type="text" class="form-control input-lg" name="pointOfReturn"/>
    </div> 
    </div> 
    
    <div class="row">
    <div class="col-xs-4">
    <h4>Date/Time</h4><input type="datetime-local" class="form-control input-lg" name="date"/>
       </div>
     <div class="col-xs-4">  
     <h4>How many SnowBros can you take?</h4>
    		<select name="numberSeats" class="form-control input-lg">
  			<option value="1">1 SnowBro</option>
  			<option value="2">2 SnowBros</option>
  			<option value="3">3 SnowBros</option>
  			<option value="4">4 SnowBros</option>
  			<option value="5">5 SnowBros (I have a van)</option>
  			<option value="6">6 SnowBros (I have a bus)</option>
		</select>
    </div> 
     <div class="col-xs-4">  
    
     <h4>Scooby Snax</h4><input type="text" class="form-control input-lg" name="extraCurrs"/>
    </div> 
    </div>
    
    		<br>
    		<input type="hidden" name="userId" value="${user.id}">
      <input type="submit" class="btn btn-primary btn-lg btn-block" value="Create Trip" name="submit" />
      </form>
 
   </div>
  
 </div> <!-- end of main container -->
  
  </body>
  
  </html>