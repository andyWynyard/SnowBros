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
    
     <div class="row">
    <div class="col-sm-6">
    <h4>First Name</h4>
       <input type="text" class="form-control input-lg" name="firstName" value="${user.firstName}"/>
       </div>
     <div class="col-sm-6">  
   <h4>Last Name</h4>
       <input type="text" class="form-control input-lg" name="lastName" value="${user.lastName}"/>
    </div> 
    </div> 
    
     <div class="row">
     
    
    <div class="col-sm-6">
 <h4>email (this is your username)</h4>
       <input type="text" class="form-control input-lg" name="email" value="${user.email}"/>
       </div>
     <div class="col-sm-6">  
     <h4>HTML link to a picture you want</h4>
       <input type="text" class="form-control input-lg" name="picture" value="${user.picture}">
    </div> 
    </div> 
    <input type="hidden" name="password" value="${user.password}">
    		<br>
      <input type="submit" class="btn btn-primary btn-lg btn-block" value="Submit" name="submit" />
      </form>
   
   

  
  
    </div>
  
    </div> <!-- end of opening container -->
  
  </body>
  
  </html>