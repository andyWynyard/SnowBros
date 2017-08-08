<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
  <div class="col-sm-4"></div>
  
  
  <div class="col-sm-4">
  <form:form action="getUser.do" method="GET" modelAttribute="user">
  
  	<h4>Email</h4>
  	
    <form:input class="form-control input-lg" path="email" /><form:errors path="email" /><!-- name="email" -->
    
    <h4>Password</h4>
    
    <form:input type="password" class="form-control input-lg" path="password" /><form:errors path="password" /> <!-- name="password" -->
       
    		<br>
      <input type="submit" class="btn btn-block btn-lg btn-primary" value="Submit" name="submit" />

  </form:form>
  <br>
  
  <form action="createProfile1.do" method="GET">
    			<input type="submit" class="btn btn-block btn-lg btn-warning" value="Create new account">
  		</form>
  		
  		</div>
  <div class="col-sm-4"></div>
  </div>
  
  </div>
  
    </div> <!-- end of opening container -->
  
  </body>
  
  </html>