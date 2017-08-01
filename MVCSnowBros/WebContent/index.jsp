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
  <form action="getUser.do" method="POST">
  
  	<h5>Email</h5>
    <input type="email" name="email"/>
    <h5>Password</h5>
    <input type="password" name="password"/>
       
    		<br>
      <input type="submit" value="Submit" name="submit" />

  </form>
  
  <form action="createProfile.do" method="GET">
    			<input type="submit" value="Create new account">
  		</form>
  
  </div>
  
  
  
    </div> <!-- end of opening container -->
  
  </body>
  
  </html>