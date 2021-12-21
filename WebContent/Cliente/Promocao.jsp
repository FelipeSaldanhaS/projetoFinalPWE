<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.fabric.Response"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="classes.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<jsp:include page="../Common/Navbar.html"/>

<title>Promoções</title>
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

<%
	int userlogin = (int) session.getAttribute("userlogin");
	if (!(userlogin > 0)) {
		response.sendRedirect("../Login.jsp");
	}
	Usuario usuario_carrega = new Usuario(userlogin);
	ResultSet dados = usuario_carrega.selectBy("idUsuario", "" + userlogin);
	dados.next();
%>

<body>

	<div class="container"
		style="align-self: center; position: relative; height: 100vh; width: 100vw; padding: 60px;">
		<h3 style="color: blue; margin-bottom: 1.5rem;">Aproveite já:
		</h3>
		<div class="container">
							<div style="text-align: right;">
				<a href="Home.jsp" class="btn btn-light"><i
					class="fa fa-reply" aria-hidden="true"></i> Voltar</a>
			</div>
			<div class="row">
				<div class="col">
					<div class="card" style="width: 18rem;">
						<img
							src="https://img.irroba.com.br/fit-in/600x600/filters:fill(fff):quality(95)/tchwmsho/catalog/calcados/freejump/1912/bota-masculina-em-couro-legitimo-crazy-horse-modelo-freeway-solado-costurado-palmilha-em-gel-confortavel-e-resistente-4.jpg"
							class="card-img-top" alt="..." height="200px">
						<div class="card-body">
							<h5 class="card-title">Bota masculina</h5>
							<p class="card-text">R$ 420,00</p>
							<a href="Agendar.jsp" class="btn btn-light"
								style="background-color: lightblue">Comprar</a>
						</div>

					</div>
				</div>
				<div class="col">
					<div class="card" style="width: 18rem;">
						<img
							src="https://santascarpa.com.br/wp-content/uploads/2018/10/Sapato-Santa-Scarpa-Modelo-SS42-Marsala-Colecao-2016-3.jpg"
							class="card-img-top" alt="..." height="200px">
						<div class="card-body">
							<h5 class="card-title">Salto alto</h5>
							<p class="card-text">R$ 500,00</p>
							<a href="Agendar.jsp" class="btn btn-light"
								style="background-color: lightblue">Comprar</a>
						</div>

					</div>
				</div>
				<div class="col">
					<div class="card" style="width: 18rem;">
						<img
							src="https://meninashoes.vtexassets.com/arquivos/ids/416982/CT0982-Tenis-Chuck-Taylor-All-Star-Lift-0002-PretoBrancoPreto-Variacao1.jpg?v=637551266746530000"
							class="card-img-top" alt="..." height="200px">
						<div class="card-body">
							<h5 class="card-title">All Star</h5>
							<p class="card-text">R$ 350,00</p>
							<a href="Agendar.jsp" class="btn btn-light"
								style="background-color: lightblue">Comprar</a>
						</div>

					</div>
				</div>
			</div>

		</div>

	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
		<jsp:include page="../Common/footer.html" />
</body>
</html>