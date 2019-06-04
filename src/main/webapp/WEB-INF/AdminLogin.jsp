<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<div class="container">
  <div class="row">
  <div id="header" class="col">
  <nav class="navbar navbar-expand-lg navbar-light">
  <a class="navbar-brand" href="/">Home</a>
  <div class="navbar-nav">
    <a class="nav-item nav-link" href="/login">Login</a>
  <a class="nav-item nav-link" href="/register">Register</a>
  <a class="nav-item nav-link" href="/account">Account</a>
  </div>
  </nav>
  </div>
  </div>
  <div class="row">

     
    <p><c:out value="${error}" /></p>
    <form method="post" action="/loginadmin">
     <h1>Admin Login</h1>
     <p id="red"><c:out  value="${authLevel}"/></p>
       <p id="red"><c:out  value="${error}" /></p>
          <div class="form-group">
            <label for="email">Email</label>
            <input type="text" class="form-control" id="emailLogin" name="email"/>
         </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="passwordLogin" name="password"/>
        </div>
        <input type="submit" class="btn btn-primary" value="Login"/>
    </form> 
  </div>
</div>

    
</body>
</html>