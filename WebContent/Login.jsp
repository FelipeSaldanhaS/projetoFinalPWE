<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style> 
	h1{
		color: blue;	
	}
	
	.wrapper{
  width: 500px;
  min-height: 560px;    
  margin: 0px auto;
  position: relative; 
}
	
	body {
    margin:50px 0px; padding:0px;
    align:center;
}
	
</style>
<meta charset="ISO-8859-1">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Calligraffitti&display=swap"
	rel="stylesheet">
<title>Sapataria - Login</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="wrapper">
		<h1>Sapataria</h1>
		<hr>
		<form id="frmLogin" method="post">
			<div class="form-group">
				<label for="inputEmail">Email:</label> <input type="email"
					name="user" class="form-control" placeholder="Digite seu email"
					required>
			</div>
			<div class="form-group">
				<label for="inputPassword">Senha:</label> <input type="password"
					name="pass" class="form-control" placeholder="Digite sua senha"
					required>
			</div>
			<div style="text-align: center;">
				<button id="btnSendFrmLogin" type="submit" class="btn btn-light"
					style="background-color: lightblue;" value="Entrar">Entrar</button>
				<hr>
				<div class="crtacc">
					Ainda não é cadastrado? Clique <a href="Cadastro.jsp">aqui</a>
				</div>
			</div>
		</form>

	</div>

</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btnSendFrmLogin").click(function() {

			var formData = $("#frmLogin").serialize();
			$.post("testeForm.jsp", formData, function(data, status) {
				var objReturn = $.parseJSON(data);
				if (objReturn.login == "true") {
					window.location.href = "Admin/Dashboard.jsp";
				} else {
					alert("Email ou senha invalido");
				}
			});
		});
	});
</script>
</html>