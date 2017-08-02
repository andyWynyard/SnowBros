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
  <form action="getUser.do" method="POST">
  
  	<h5>Email</h5>
    <input type="email" name="email"/>
    <h5>Password</h5>
    <input type="password" name="password"/>
       
    		<br>
      <input type="submit" value="Submit" name="submit" />

  </form>
  
  <form action="createProfile1.do" method="GET">
    			<input type="submit" value="Create new account">
  		</form>
  
  </div>
  
  
  
    </div> <!-- end of opening container -->
  
  </body>
  
  </html>