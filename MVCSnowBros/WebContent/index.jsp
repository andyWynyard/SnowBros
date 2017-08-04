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
  
  <div class="well">
  <div class="row">
  <div class="col-xs-4"></div>
  
  
  <div class="col-xs-4">
  <form action="getUser.do" method="GET">
  
  	<h4>Email</h4>
    <input type="email" class="form-control input-lg" name="email"/>
    <h4>Password</h4>
    <input type="password" class="form-control input-lg" name="password"/>
       
    		<br>
      <input type="submit" class="btn btn-block btn-primary" value="Submit" name="submit" />

  </form>
  
  <form action="createProfile1.do" method="GET">
    			<input type="submit" class="btn btn-block btn-warning" value="Create new account">
  		</form>
  		
  		</div>
  <div class="col-xs-4"></div>
  </div>
  
  </div>
  
    </div> <!-- end of opening container -->
  
  </body>
  
  </html>