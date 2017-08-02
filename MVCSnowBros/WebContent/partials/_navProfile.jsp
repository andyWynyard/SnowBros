<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    
<c:choose>
	<c:when test="${user} != null">
  
   <div class="well">
  <img src="${user.picture}" alt="Your photo" height="42" width="42">
  <h1>${user.firstName} ${user.lastName}</h1>
  <h3>${user.email}</h3>
  <h3>Your rating is: ${rating}</h3>
  
   <form action="logOut.do" method="GET">
  			<input type="submit" value="Log Out">
  		</form>
  
  <form action="getProfilePage.do" method="GET">
  			<input type="submit" value="Profile Page">
  			<input type="hidden" value="${user.id}" name="userId">
  		</form>
  
  </div>

</c:when>
<c:when test="${user} == null">
  
  <form action="getUser.do" method="POST">
  
  	<p>Email
    <input type="email" name="email"/>
    Password
    <input type="password" name="password"/></p>
       
    		<br>
      <input type="submit" value="Submit" name="submit" />

  </form>
  
  </c:when>
  </c:choose>