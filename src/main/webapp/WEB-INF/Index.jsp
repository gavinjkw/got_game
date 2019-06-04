<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The GoT Game</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>


<div class="container">



  <div class="row">
  <div id="header" class="col">
  <nav class="navbar navbar-expand-lg navbar-light">
  <a class="navbar-brand" href="/home">Home</a>
  <div class="navbar-nav">
    
 <c:if test="${userId == null}">
  <a class="nav-item nav-link" href="/login">Login</a>
  <a class="nav-item nav-link" href="/register">Register</a>
 </c:if>
     <c:if test="${userId != null}">
  <a class="nav-item nav-link" href="/logout">Logout</a>
  <a class="nav-item nav-link" href="/account">Account</a>
  	 </c:if>
  <a class="nav-item nav-link" href="/admin">Admin</a>
  </div>
  </nav>
  </div>
     
     

  </div>
  <div class="row">
  
    <div class="col">
  <div class="intro">
  <p id="grey"> Welcome to the Game of Thrones character survival game. In order to play, register and submit your guesses. Each week the characters will be updated based on who is alive, dead, or a Wight. Once you have submitted your answers, you can view other players answer's and log back in to see your own. </p>
    </div> 
  </div> 
   <div class="col">
<div id="logo">

</div> 
</div> 
</div> 
  <div class="row">
    <div class="col">
    
	 <c:choose>
    <c:when test="${landingState == '1'}">
    
      <h1>Leader Board</h1>
    
    <c:choose>
    <c:when test="${userId == null}">
    
      <div class="scrollbar glider-scrollable overflow">
    
      <table class="table table-borderless table-striped table-dark opaque">
    <thead>
        <tr>
        	<th scope="col">Rank</th>
            <th scope="col">Name</th>
            <th scope="col">Score</th>
        </tr>
    </thead>
    <tbody>

	<c:set var = "ranking"  value = "0"/>

    <c:forEach items="${allUsers}" var="userOne" varStatus="userLoop">
    	<c:set var = "ranking"  value = "${ranking + 1}"/>
        <tr> 
        	<td><c:out value="${ranking}"/></td>
        	<td><c:out value="${userOne.firstName} ${userOne.lastName}"/></td>
        	<td><c:out value="${userOne.score}"/></td>
			</td> 
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
		</c:when>
		
		 <c:when test="${userId != null}">
    
      <div class="scrollbar glider-scrollable overflow">
    
      <table class="table table-borderless table-striped table-dark opaque">
    <thead>
        <tr>
           	<th scope="col">Rank</th>
            <th scope="col">Name</th>
            <th scope="col">Score</th>
        </tr>
    </thead>
    <tbody>

    <c:forEach items="${allUsers}" var="userOne">
       
        	<c:set var = "ranking"  value = "${ranking + 1}"/>
       <tr> 
        	<td><c:out value="${ranking}"/></td>
        	<td> <a href="/showuser/${userOne.id}"><c:out value="${userOne.firstName} ${userOne.lastName}"/></a>  </td>
        	<td><c:out value="${userOne.score}"/></td>
			</td> 
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
		</c:when>
		
		  </c:choose>

      </c:when>
      
      <c:when test="${landingState == '2'}">
      
      <h1>Register</h1>
    
      <p id="red"><form:errors path="user.*"/></p>
       <p id="red"><form:errors path="user.email"/></p>
       <p id="red"><c:out value="${noEmail}"/></p>
    
    <form:form method="POST" action="/register" modelAttribute="user">
        <div class="form-group">
            <form:label path="firstName">First Name</form:label>
            <form:input class="form-control" type="text" path="firstName"/>
        </div>
        <div class="form-group">
            <form:label path="lastName">Last Name</form:label>
            <form:input class="form-control" type="text" path="lastName"/>
        </div>
        <div class="form-group">
            <form:label path="email">Email</form:label>
            <form:input class="form-control" type="email" path="email"/>
        </div>
        <div class="form-group">
            <form:label path="password">Password</form:label>
            <form:password class="form-control" path="password"/>
        </div>
        <div class="form-group">
            <form:label path="passwordConfirmation">Password Confirmation</form:label>
            <form:password class="form-control" path="passwordConfirmation"/>
        </div>
        
        <form:input type="hidden" path="score" value="0"/>
        <form:input type="hidden" path="accessLevel" value="1"/>
        <form:input type="hidden" path="attempts" value="1"/>
        
        <input type="submit" class="form-control" value="Register"/>
    </form:form>
      
	    </c:when>
	    

      <c:when test="${landingState == '3'}">
      
       <h1>Login</h1>
		    <p id="red"><c:out value="${error}" /></p>
		    <form method="post" action="/login">
		        <div class="form-group mb-2">
		            <label for="email">Email</label>
		            <input class="form-control" type="text" id="emailLogin" name="email"/>
		        </div>
		        <div class="form-group mb-2">
		            <label for="password">Password</label>
		            <input class="form-control" type="password" id="passwordLogin" name="password"/>
		        </div>
		        <input type="submit" class="form-control" value="Login"/>
		    </form> 
      
      </c:when>
	    
    </c:choose>

     </div> 
    <div class="col">
    
  
    
      <h1>Characters</h1>
      
       <div class="scrollbar scroll">
      
        <table class="table table-borderless table-striped table-dark opaque">
    <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Status</th>
        </tr>
    </thead>
    <tbody>


    <c:forEach items="${allCharacters}" var="charOne">
        <tr> 
        	<td><c:out value="${charOne.name}"/></td>
        	<td><c:out value="${charOne.status.name}"/></td>
			</td> 
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>

    </div>
  </div>
</div>

</body>
</html>