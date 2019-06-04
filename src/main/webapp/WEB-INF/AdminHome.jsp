<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Home</title>
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
			  <a class="nav-item nav-link" href="/logout">Logout</a>
			  
			<a class="nav-item nav-link" href="/characters">Characters</a>
			
			<a class="nav-item nav-link" href="/users">Users</a>
			
		  </div>
		  </nav>
	  </div>
  </div>
  
   <c:choose>
    <c:when test="${adminState == '1'}">
  
  <div class="row">
      <div class="col-sm">
      <p><form:errors path="characterObj.*"/></p>
      <form:form method="POST" action="/admin/addcharacter" modelAttribute="characterObj">
        <p>
            <form:label path="name">Name: </form:label>
            <form:input type="text" path="name"/>
            <p><form:errors path="name"/></p>
        </p>
         <p>
        	<label>Status:</label>
    		<form:select path="status">
				<form:option value="${statusItems[0].id}">Alive</form:option>
				<form:option value="${statusItems[1].id}">Dead</form:option>
				<form:option value="${statusItems[2].id}">Wight</form:option>			
			</form:select>
       
    	</p>
       
        <input type="submit" class="btn btn-primary" value="Add Character"/>
    </form:form>
    
    <table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Status</th>
            <th scope="col">Action</th>
        </tr>
    </thead>
    <tbody>


    <c:forEach items="${allCharacters}" var="charOne">
        <tr> 
        	<td><c:out value="${charOne.name}"/></td>
        	<td><c:out value="${charOne.status.name}"/></td>
            <td>
            			
		    		<c:choose>
		    		
		    			<c:when test="${charOne.status.name.equals('Alive')}">
	    					
	    					<form id="in-line" action="/update/${charOne.id}/2" method="post">
							<form name="status" value="Dead"></hidden>
			   				<input type="submit" class="btn btn-dark" value="Dead"/>
							</form>
							
							<form id="in-line" action="/update/${charOne.id}/3" method="post">
							<form name="status" value="Wight"></hidden>
			   				<input type="submit" class="btn btn-dark" value="Wight"/>
							</form>
							
	    		 	    </c:when>
		    		
	    		 	    <c:when test="${charOne.status.name.equals('Dead')}">
	    					
	    					<form id="in-line" action="/update/${charOne.id}/1" method="post">
							<form name="status" value="Alive"></hidden>
			   				<input type="submit" class="btn btn-dark" value="Alive"/>
							</form>
							
							<form id="in-line" action="/update/${charOne.id}/3" method="post">
							<form name="status" value="Wight"></hidden>
			   				<input type="submit" class="btn btn-dark" value="Wight"/>
							</form>
							
	    		 	    </c:when>
	    		 	    

	    		 		<c:otherwise>
	    		 		
	    		 			<form id="in-line" action="/update/${charOne.id}/1" method="post">
							<form name="status" value="Alive"></hidden>
			   				<input type="submit" class="btn btn-dark" value="Alive"/>
							</form>
							
			    		 	<form id="in-line" action="/update/${charOne.id}/2" method="post">
							<form name="status" value="Dead"></hidden>
			   				<input type="submit" class="btn btn-dark" value="Dead"/>
							</form>
							
					 	</c:otherwise>	
					</c:choose> 
			</td> 
        </tr>
    </c:forEach>
    </tbody>
</table>


	</c:when>
	    
	   <c:when test="${adminState == '2'}">


 <table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">email</th>
            <th scope="col">Score</th>
            <th scope="col">Action</th>
        </tr>
    </thead>
    <tbody>


    <c:forEach items="${users}" var="userOne">
        <tr> 
        	<td><c:out value="${userOne.firstName}"/></td>
        	<td><c:out value="${userOne.email}"/></td>
        	<td><c:out value="${userOne.score}"/></td>
            <td> <form action="/deleteUserAndGuesses/${userOne.id}" method="post">
		    		<input type="hidden" name="_method" value="delete">
		    		<input class="btn btn-dark" type="submit" value="Delete">
		    		</form>
            </td>	
        </tr>
    </c:forEach>
    </tbody>
</table>

	  </c:when>
    </c:choose>
     
	  </div>
  </div>  
</div> 
</body>
</html>