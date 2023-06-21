<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="public/styles/index.css" />
</head>
<body>
<span class="button">Sign In</span>
<div class="modal-bg">
<div id="modal">
	<span>Sign In<a href="#close" id="close">&#215;</a></span>
	<form  action="login.do" method="post"  >
		<input id="username" name="username" type="text" placeholder="Username" required>
		<input id="password" name="password" type="password" placeholder="Password" required>
		<div>
	         <label for="role">Role:</label> <br>
	         <div class="radio">
				<input label="Admin" type="radio" id="admin" name="role" value="admin">
				<input label="User" type="radio" id="user" name="role" value="user" checked>
			</div>
		</div>
		
		<button name="submit" id="submit" type="submit">Sign in</button>
	</form>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$('.button').click(function(){
	  $('#modal').css('display','block');
	  $('.modal-bg').fadeIn();
});

	$('#close').click(function(){
		  $('.modal-bg').fadeOut();		
		  $('#modal').fadeOut();
	  return false;
	});
</script>
</body>
</html>