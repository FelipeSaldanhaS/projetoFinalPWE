<!DOCTYPE html>
<%@page import="java.sql.SQLException"%>
<%@page import="database.DBQuery"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="classes.Usuario"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="content-type"
	content="application/xhtml+xml; charset=UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<jsp:include page="../Common/Navbar.html" />
<title>Perfil</title>

<style>
body {
	background-image:
		url("https://images-americanas.b2w.io/produtos/184208180/imagens/papel-de-parede-infantil-grade-azul-cola-para-aplicacao-colecao-abracadabra-181125qi/184208180_1_large.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}

.container {
	background-color: white;
}
input {
	border: none;
	outline: 0;
}
</style>
</head>
<body>
	<%
		int userLogin = 0;
		userLogin = (int) session.getAttribute("userlogin");
		if (!(userLogin > 0)) {
			response.sendRedirect("../Login.jsp");
		}
	%>

	<div class="container"
		style="align-self: center; position: relative; height: 100vh; width: 100vw; padding: 60px;">
		<div class="row">
			<div class="col-md-6">

				<h3 style="color: blue; margin-bottom: 1.5rem;">Meu Perfil:</h3>
			</div>
			<div class="col-md-6" style="text-align: right;">
				<a href="Home.jsp" class="btn btn-light"><i
					class="fa fa-reply" aria-hidden="true"></i> Voltar</a>
			</div>
		</div><div style="max-width: 6000px; max-height: 500px; overflow: auto;">
		<form id="frmUsuarios" action="EditarPerfil.jsp" method="POST">
			<table class="table" id="myTable">
				<thead>

					<tr>
						<th scope="col">#</th>
						<th scope="col">Nome</th>
						<th scope="col">Nivel Usuário</th>
						<th scope="col">Email</th>
						<th scope="col">Cpf</th>
					</tr>
				</thead>
				<tbody>

					<tr>
					<%
						String html = "";
						try {
							ResultSet result = new Usuario().selectBy("idUsuario",""+userLogin);
							while (result.next()) {
								html += "<tbody>" +
										"<tr>" + 
										"<td>" + "<input type='radio' name='idUsuario' value='" + result.getInt("idUsuario") + "'>" + "</td>" +  
										"<td>"
										+ result.getString("nome") + 
										"</td>"+
										"<td>"
										+ result.getString("idNivelUsuario") + 
										"</td>"+
										"<td>"
										+ result.getString("email") + 
										"</td>"+
										"<td>"
										+ result.getString("cpf") + 
										"</td>"+
										"</tr>" + "</tbody>";
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						html += "<tr>" + 
								
							 	"<td>" + "<button type='submit' class='btn btn-light' style='background-color: lightblue;' id='btnUpdate'>Alterar</button>" + "</td>" +
						  	"</tr>"; 
						out.write(html);
					%>
					</tr>
				</tbody>
			</table>
			</form>
		</div>



	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="../Common/footer.html" />

</body>
</html>