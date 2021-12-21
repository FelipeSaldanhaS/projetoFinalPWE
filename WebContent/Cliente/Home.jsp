<%@page import="java.sql.ResultSet"%>
<%@page import="classes.Usuario"%>
<%@page import="database.DBQuery"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<jsp:include page="../Common/Navbar.html" />
<title>Home</title>
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
</style>
</head>

<body>

	<%
		int userlogin = (int) session.getAttribute("userlogin");
		if (!(userlogin > 0)) {
			response.sendRedirect("../Login.jsp");

		}
	%>
	<%
		Usuario usuario_carrega = new Usuario(userlogin);
		ResultSet dados = usuario_carrega.selectBy("idUsuario", "" + userlogin);

		dados.next();
		String idUser = "" + userlogin;
		String email = dados.getString("email");
		String nome = dados.getString("nome");
	%>
	
	<div id="carouselExampleControls" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="https://static.dooca.com.br/finoraro/product/sapato-feminino-fechado-dina-mirtz-16149804665711_640x640.jpg"
					class="d-block w-100" alt="..." style="height: 300px; width: 100%;">
			</div>
			<div class="carousel-item">
				<img
					src="https://static.zattini.com.br/produtos/sapato-conforto-social-sapatofran-masculino/06/HAP-0069-006/HAP-0069-006_zoom1.jpg?ts=1634812516&ims=544x"
					class="d-block w-100" alt="..." style="height: 300px; width: 100%;">
			</div>
			<div class="carousel-item">
				<img
					src="https://santascarpa.com.br/wp-content/uploads/2018/10/Sapato-Santa-Scarpa-Modelo-SS42-Marsala-Colecao-2016-3.jpg"
					class="d-block w-100" alt="..." style="height: 300px; width: 100%;">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleControls"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleControls"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	
	
	<div class="container">
		<div class="jumbotron" style="background-color: white;">
			<h1 class="display-4">
				Bem-Vindo(a) a Sapataria Online,
				<%
				out.println(nome);
				%>
				!!
			</h1>
			<p class="lead">Conheça nossa vasta seleção de sapatos femininos e masculinos de uma miriade de tamanhos, tecidos e tipos.</p>
			<hr class="my-4">
			<p>Escolha o sapato que sirva perfeitamente seus gostos. (Promoção relâmpago)</p>
			<a class="btn btn-light" style="background-color: lightblue;"
				href="Promocao.jsp" role="button">Ver Promoções</a>

		</div>

	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>