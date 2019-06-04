<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Home</title>
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
  <a class="nav-item nav-link" href="/logout">Logout</a>
  </div>
  </nav>
  </div>
     

  </div>
  
  <div class="row">
  
    <div class="col">
  <div id="lower" class="intro">
   <h1 id="center" >Welcome, <c:out value="${user.firstName}"/></h1>
   
   <h1 id="center">Your score is <c:out value="${user.score}"/></h1>
    </div> 
  </div> 
   <div class="col">
<div id="logo">

</div> 
</div> 
</div> 
  
  <div class="row">
  
  <c:choose>
    <c:when test="${attemptsStatus == '1'}">
    
    <div class="col">
  <h1>Make Your Selections</h1>   
      <div class="scrollbar scroll">
    <form method="POST" action="/submit/${user.id}">
 

  <div class="form-group">
    <label id="in-line" >Jon Snow</label>
    <select id="in-line" name ="jonSnow" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
  <div class="form-group">
    <label>Sansa Stark</label>
    <select name ="sansaStark" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
    <div class="form-group">
    <label>Arya Stark</label>
    <select name ="aryaStark" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
   <div class="form-group">
    <label>Bran Stark</label>
    <select name ="branStark" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
   <div class="form-group">
    <label>Cersei Lannister</label>
    <select name ="cerseiLannister" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
      </select>
  </div>
    <div class="form-group">
    <label>Jaime Lannister</label>
    <select name ="jaimeLannister" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
      <div class="form-group">
    <label>Tyrion Lannister</label>
    <select name ="tyrionLannister" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
      <div class="form-group">
    <label>Daenerys Targaryen</label>
    <select name ="daenerysTargaryen" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
        <div class="form-group">
    <label>Yara Greyjoy</label>
    <select name ="yaraGreyjoy" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
     <div class="form-group">
    <label>Theon Greyjoy</label>
    <select name ="theonGreyjoy" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
       <div class="form-group">
    <label>Melisandre</label>
    <select name ="melisandre" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
        <div class="form-group">
    <label>Jorah Mormont</label>
    <select name ="jorahMormont" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
    <div class="form-group">
    <label>The Hound</label>
    <select name ="theHound" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
   <div class="form-group">
    <label>The Mountain</label>
    <select name ="theMountain" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
    <div class="form-group">
    <label>Samwell Tarley</label>
    <select name ="samwellTarley" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
      <div class="form-group">
    <label>Gilly</label>
    <select name ="gilly" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
   <div class="form-group">
    <label>Sam (Child)</label>
    <select name ="samChild" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
  <div class="form-group">
    <label>Lord Varys</label>
    <select name ="lordVarys" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
   <div class="form-group">
    <label>Brienne of Tarth</label>
    <select name ="brienneOfTarth" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
  <div class="form-group">
    <label>Davos Seaworth</label>
    <select name ="davosSeaworth" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
   <div class="form-group">
    <label>Bronn</label>
    <select name ="bronn" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
  <div class="form-group">
    <label>Podrick Payne</label>
    <select name ="podrickPayne" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
    <div class="form-group">
    <label>Tormund
Giantsbane</label>
    <select name ="tormundGiantsbane" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
   <div class="form-group">
    <label>Qyburn</label>
    <select name ="qyburn" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
   <div class="form-group">
    <label>Grey Worm</label>
    <select name ="greyWorm" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
   <div class="form-group">
    <label>Gendry</label>
    <select name ="gendry" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
   <div class="form-group">
    <label>Beric Dondarrion</label>
    <select name ="bericDondarrion" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
    <div class="form-group">
    <label>Euron Greyjoy</label>
    <select name ="euronGreyjoy" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
    <div class="form-group">
    <label>Daario</label>
    <select name ="daario" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
    <div class="form-group">
    <label>Dolorous Edd</label>
    <select name ="dolorousEdd" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>
    <div class="form-group">
    <label>Missandei</label>
    <select name ="missandei" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>   <div class="form-group">
    <label>Ghost</label>
    <select name ="ghost" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
  </div>   
  <div class="form-group">
    <label>Nymeria</label>
    <select name ="nymeria" class="form-control">
      <option value="1">Alive</option>
      <option value="2">Dead</option>
      <option value="3">Wight</option>
    </select>
    
  </div>
  
 <input type="submit" class="btn btn-primary" value="Submit"/>

</form>

 </div>
</c:when>

 <c:when test="${attemptsStatus == '0'}">
      
      
      <div class="col">
      <h1>Guesses</h1>
       <div class="scrollbar scroll">
       <table class="table table-borderless table-dark opaque">
       <tr>
       	<th scope="col">Name</th>
       	<th scope="col">Guess</th>
       <c:forEach  items="${allGuesses}" var="guess">
          <tr> 
        	<td><c:out value="${guess.character.name}"/></td>
        	<td><c:out value="${guess.status.name}"/></td>
			</td> 
        </tr>
       </c:forEach>
       
       </table>
       </div>
       
      </c:when>

  </c:choose>

  </div>
   
    <div class="col">
      <h1>Characters</h1>
      <div class="scrollbar scroll">
        <table class="table table-borderless table-dark opaque scroll">
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