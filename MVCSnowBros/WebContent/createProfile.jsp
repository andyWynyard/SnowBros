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
  

   
   <h1>Create your profile here</h1>
    <form action="createProfile.do" method="POST">
       <h5>First Name</h5>
       <input type="text" name="firstName"/>
       <h5>Last Name</h5>
       <input type="text" name="lastName"/>
       <h5>email (this will be your username)</h5>
       <input type="text" name="email"/>
       <h5>password </h5>
       <input type="password" name="password"/>
       <h5>HTML link to a picture you want</h5>
       <input type="text" name="picture">
    		<br>
    		<br>
      <input type="submit" value="Submit" name="submit" />
      </form>
   
   
  
    </div>
  
    </div> <!-- end of opening container -->
  
  </body>
  
  </html>