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

<div class="row">
    <div class="col-xs-6">
       <h4>First Name</h4>
       <input type="text" class="form-control input-lg" name="firstName"/>
          </div>
     <div class="col-xs-6">  
       <h4>Last Name</h4>
       <input type="text" class="form-control input-lg" name="lastName"/>
       </div>
       </div>
       
       <div class="row">
    <div class="col-xs-6">
       <h4>Email (this will be your username)</h4>
       <input type="text" class="form-control input-lg" name="email"/>
       </div>
       <div class="col-xs-6">
       <h4>Password</h4>
       <input type="password" class="form-control input-lg" name="password"/>
       
       </div>
       </div>
       
       <div class="row">
    <div class="col-xs-12">
       <h4>HTML link to a picture you want</h4>
       <input type="text" class="form-control input-lg" name="picture">
       </div>
       </div>
       
    		<br>
    		<br>
      <input type="submit"  class="btn btn-primary btn-lg btn-block"  value="Submit" name="submit" />
      </form>
   
   
  
    </div>
  
    </div> <!-- end of opening container -->
  
  </body>
  
  </html>