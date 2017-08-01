<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="en">
  <head>    
    
    <meta charset="UTF-8">
    <title>View</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <style>
    textarea {
    min-width: 100%;
    } 
 
    </style>
<link rel="shortcut icon" href="https://www.shareicon.net/data/128x128/2016/01/18/704925_letter_512x512.png" type="image/x-icon" />
  </head>
  <body>
  <div class="container">
  
  <div class="jumbotron">
  <h1>SnowBros</h1>
  <p>Get ready to go to shredtown!!!</p>
  <p>Go hard in the gnarly POW POW!</p>
  
  </div> <!-- End of Jumbotron -->
  
  <div class="well">
  
  <c:choose>
   <c:when test="${user.id} == null">
   
   <h1>Create your profile here</h1>
    <form action="createProfile.do" method="POST">
       <h5>First Name</h5>
       <input type="text" name="firstName"/>
       <h5>Last Name</h5>
       <input type="text" name="lastName"/>
       <h5>email (this will be your username)</h5>
       <input type="text" name="email"/>
       <h5>HTML link to a picture you want</h5>
       <input type="text" name="picture">
    		<br>
    		<br>
      <input type="submit" value="Submit" name="submit" />
      </form>
   
   
   
   </c:when>
   <c:when test="${user.id} != null">
   
   
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
    		<br>
    		<br>
      <input type="submit" value="Submit" name="submit" />
      </form>
   
   
   
   </c:when>
   
</c:choose>
  
  
  
  
  
  
  
    </div>
  
    </div> <!-- end of opening container -->
  
  </body>
  
  </html>