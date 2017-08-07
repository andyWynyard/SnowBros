<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    

	<c:if test="${user.firstName != null}">
  <div class="well">
  <div class="row">
 <div class="col-sm-3">
  <img src="${user.picture}" alt="Your photo" height="100%" width="100%">
  </div>
   <div class="col-sm-1">
   </div>
  <div class="col-sm-5">
  <h1>${user.firstName} ${user.lastName}</h1>
  <h3>${user.email}</h3>
  <h3>${user.phoneNumber}</h3>
  
  <h5>Your rating is: ${rating}</h5>
  </div>
  <div class="col-sm-3">
  
   
  
  <form action="getProfilePage.do" method="GET">
  			<input type="submit" class="btn btn-primary btn-lg btn-block" value="Profile">
  			<input type="hidden" value="${user.id}" name="userId">
  		</form>
  		
  		<form action="createTripPage.do" method="GET">
    			<input type="submit" class="btn btn-success btn-lg btn-block" value="Create Trip">
    			<input type="hidden" value="${user.id}" name="userId">
  		</form>
  
  		<form action="searchPage.do"  method="GET">
  			<input type="submit" class="btn btn-info btn-lg btn-block" value="Search">
  		</form>
  		<form action="logOut.do" method="GET">
  			<input type="submit" class="btn btn-secondary btn-lg btn-block" value="Log Out">
  		</form>
  		
  			<form action="editUserPage.do" method="GET">
    			<input type="submit" class="btn btn-warning btn-lg btn-block" value="Edit Profile" name="${user.id}">
    			<input type="hidden" value="${user.id}" name="userId">
  		</form>
  		
  		<form action="deleteUser.do" method="POST">
    			<input type="submit" class="btn btn-danger btn-lg btn-block" value="Delete Account">
    			<input type="hidden" value="${user.id}" name="userId">
  		</form>	
  		
  		
  		
  </div>
  </div>
  
  </div>

</c:if>




<c:if test="${user.firstName == null}">
  <div class="well">
  <form action="getUser.do" method="GET">
  	<p>Email
    <input type="email" name="email"/>
    Password
    <input type="password" name="password"/></p>   
    		<br>
      <input type="submit" class="btn btn-info" value="Submit" name="submit" />
  </form>
   </div>
  </c:if>
  
 
