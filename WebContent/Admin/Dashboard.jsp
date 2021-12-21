<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.fabric.Response"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="classes.Usuario"%>
<%@page import="database.DBQuery"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Dashboard</title>
<style>
body {
	background-image:
		url("https://image.freepik.com/fotos-gratis/fundo-de-textura-de-marmore-rosa-textura-de-marmore-abstrata_34936-405.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}

.container {
	background-color: white;
}
</style>



</head>

<%
int userlogin = (int) session.getAttribute("userlogin");
if (!(userlogin > 0)) {
	response.sendRedirect("../Login.jsp");
}


String tableName = "lojinha.usuarios";
String fieldsName = "idUsuario, email, senha, idNivelUsuario, nome, cpf, endereco, bairro, cidade, uf, cep, telefone";
String fieldKey = "idUsuario";
DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
ResultSet rs = dbQuery.select("");
int idNivelUsuario = 1;
int idUsuario = userlogin;
ResultSet resultSet = dbQuery.select("idUsuario = '"+ idUsuario + "'");
while (resultSet.next()){
	idNivelUsuario = resultSet.getInt("idNivelUsuario");
}

if(idNivelUsuario < 2){
	response.sendRedirect("../Cliente/Home.jsp");
}
	
%>
<body>


	<br>

	<div class="container" style="padding: 60px;">
		<div class="row">
			<div class="col">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Perfil</h5>
						<p class="card-text">Visualizar meu perfil</p>
						<a href="Perfil.jsp" class="btn btn-light"
							style="background-color: #e8baaa">Ver</a>
					</div>

				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Usuários</h5>
						<p class="card-text">Visualizar usuários</p>
						<a href="Usuarios.jsp" class="btn btn-light"
							style="background-color: #e8baaa">Ver</a>
					</div>

				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">Agendamentos</h5>
						<p class="card-text">Visualizar agendamentos</p>
						<a href="Agendamentos.jsp" class="btn btn-light"
							style="background-color: #e8baaa">Ver</a>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>

