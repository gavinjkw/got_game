<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View User</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
<body>


<div class="container">



  <div class="row">
	  <div id="header" class="col">
	  <nav class="navbar navbar-expand-lg navbar-light">
		 	 <a class="navbar-brand" href="/home">Home</a>
		  <div class="navbar-nav">
			  <a class="nav-item nav-link" href="/admin">Admin</a>
			  <a class="nav-item nav-link" href="/login">Logout</a>
		  </div>
	  </nav>
  </div>
     

  </div>
  <div class="row">
  
   <div class="col">
  <h1>User</h1>
  
        <div class="scrollbar scroll">
  <table class="table table-borderless table-dark opaque">
	<tr>
		<th scope="col">Name:</th>
		<th scope="col"><c:out value="${user.firstName}  ${user.lastName}"/></th>
	<tr> 
		<th scope="col">Score:</th>
		<th scope="col"><c:out value="${user.score}"/></th>

	</tr>
	</table>
  
  </div>
   </div>
   

<div class="col">
<h1>Guesses</h1>
 <div class="scrollbar scroll">
	<table class="table table-borderless table-dark opaque scroll">
	<tr>
		<th scope="col">Name</th>
		<th scope="col">Guess</th>
	<c:forEach  items="${user.guesses}" var="guess">
	<tr> 
		<td><c:out value="${guess.character.name}"/></td>
		<td><c:out value="${guess.status.name}"/></td>
	</td> 
	</tr>
	</c:forEach>  
	</table>
	</div>
</div>
</div>
</div>
</body>
</html>