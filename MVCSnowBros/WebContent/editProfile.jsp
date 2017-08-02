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
  
   <h1>Edit your profile here</h1>
    <form action="editProfile.do" method="POST">
       <h5>First Name</h5>
       <input type="text" name="firstName" value="${user.firstName}"/>
       <h5>Last Name</h5>
       <input type="text" name="lastName" value="${user.lastName}"/>
       <h5>email (this will be your username)</h5>
       <input type="text" name="email" value="${user.email}"/>
       <h5>HTML link to a picture you want</h5>
       <input type="text" name="picture" value="${user.picture}">
       <input type="hidden" name="password" value="${user.password}">
    		<br>
    		<br>
      <input type="submit" value="Submit" name="submit" />
      </form>
   
   

  
  
    </div>
  
    </div> <!-- end of opening container -->
  
  </body>
  
  </html>