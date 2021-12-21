<%@page import="classes.Usuario"%>
<%@page import="database.DBQuery"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<jsp:include page="../Common/Navbar.html" />

<title>Usuário</title>
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

	int idUsuario = Integer.valueOf(request.getParameter("idUsuario"));
	int idNivelUsuario = (request.getParameter("idNivelUsuario") == null) ? 1 : Integer.valueOf(request.getParameter("idNivelUsuario"));//1;//Integer.valueOf(request.getParameter("idNivelUsuario"));
	String nome = (request.getParameter("nome") == null) ? "" : request.getParameter("nome");
	String email = (request.getParameter("email") == null) ? "" : request.getParameter("email");
	String senha = (request.getParameter("senha") == null)? "" : request.getParameter("senha");
	String cpf = (request.getParameter("cpf") == null) ? "" : request.getParameter("cpf");
	String endereco = (request.getParameter("endereco") == null) ? "" : request.getParameter("endereco");
	String bairro = (request.getParameter("bairro") == null) ? "" : request.getParameter("bairro");
	String cidade = (request.getParameter("cidade") == null) ? "" : request.getParameter("cidade");
	String uf = (request.getParameter("uf") == null) ? "" : request.getParameter("uf");
	String cep = (request.getParameter("cep") == null) ? "" : request.getParameter("cep");
	String telefone = (request.getParameter("telefone") == null) ? "" : request.getParameter("telefone");

	String acao = request.getParameter("acao");

	if (acao != null) {
		Usuario usuario = new Usuario(idUsuario, email, senha, idNivelUsuario, nome, cpf, endereco, bairro,
				cidade, uf, cep, telefone);
		//Usuario usuario = new Usuario(idUsuario, email, "aa", 1, nome, "cpf", "endereco", "bairro", "cidade", "uf", "cep", telefone); 
		if (Integer.valueOf(acao) == 1) {
			usuario.save();
			response.sendRedirect("Perfil.jsp");
		}
	} else {
		String id = request.getParameter("idUsuario");
		try {
			ResultSet result = new Usuario().selectBy("idUsuario", id);
			while (result.next()) {
				idUsuario = result.getInt("idUsuario");
				idNivelUsuario = result.getInt("idNivelUsuario");
				nome = result.getString("nome");
				email = result.getString("email");
				senha = result.getString("senha");
				cpf = result.getString("cpf");
				email = result.getString("email");
				endereco = result.getString("endereco");
				bairro = result.getString("bairro");
				cidade = result.getString("cidade");
				uf = result.getString("uf");
				cep = result.getString("cep");
				telefone = result.getString("telefone");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
%>

<div class="container"
	style="align-self: center; position: relative; height: 100vh; width: 100vw; padding: 60px;">
	<div class="row">
		<div class="col-md-6">

			<h3 style="color: blue; margin-bottom: 1.5rem;">Dados:</h3>
		</div>
		<div class="col-md-6" style="text-align: right;">
			<a href="Perfil.jsp" class="btn btn-light"><i
				class="fa fa-reply" aria-hidden="true"></i> Voltar</a>
		</div>
	</div>
	<form action="Perfil.jsp" method="POST">
		<input type='hidden' name='idUsuario' value='<%=idUsuario%>' />
		<input type='hidden' name='idNivelUsuario' value='<%=idNivelUsuario%>' />
		<div class="row">
			<div class="col-md-3">
				<label for="nome">Nome: </label> <input type="text"
					class="form-control" id="nome" name="nome" value='<%=nome%>' />
			</div>
			<div class="col-md-4">
				<label for="email">Email: </label> <input type="email"
					class="form-control" id="email" name="email" value='<%=email%>' />
			</div>
			<div class="col-md-3">
				<label for="senha">Senha: </label> <input type="password"
					class="form-control" id="senha" name="senha" value='<%=senha%>' />
			</div>
			<div class="col-md-3">
				<label for="cpf">CPF: </label> <input type="text" id="cpf"
					class="form-control" name="cpf" value='<%=cpf%>' />
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<label for="endereco">Endereço: </label> <input type="text"
					class="form-control" id="endereco" name="endereco"
					value='<%=endereco%>' />
			</div>
			<div class="col-md-3">
				<label for="bairro">Bairro: </label> <input type="text"
					class="form-control" id="bairro" name="bairro" value='<%=bairro%>' />
			</div>
			<div class="col-md-4">
				<label for="cidade">Cidade: </label> <input type="text"
					class="form-control" id="cidade" name="cidade" value='<%=cidade%>' />
			</div>
			<div class="col-md-2">
				<label for="uf">UF: </label> <select id="uf" class="form-control"
					name="uf" size="1">

					<option value='<%=uf%>' selected><%=uf%></option>
					<option value="AC">AC</option>
					<option value="AL">AL</option>
					<option value="AP">AP</option>
					<option value="AM">AM</option>
					<option value="BA">BA</option>
					<option value="DF">DF</option>
					<option value="ES">ES</option>
					<option value="GO">GO</option>
					<option value="MA">MA</option>
					<option value="MT">MT</option>
					<option value="MS">MS</option>
					<option value="MG">MG</option>
					<option value="PA">PA</option>
					<option value="PB">PB</option>
					<option value="PR">PR</option>
					<option value="PE">PE</option>
					<option value="PI">PI</option>
					<option value="RJ">RJ</option>
					<option value="RN">RN</option>
					<option value="RS">RS</option>
					<option value="RO">RO</option>
					<option value="RR">RR</option>
					<option value="SC">SC</option>
					<option value="SP">SP</option>
					<option value="SE">SE</option>
					<option value="TO">TO</option>
				</select>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<label for="cep">CEP: </label> <input type="text"
					class="form-control" id="cep" name="cep" value='<%=cep%>'>
			</div>
			<div class="col-md-3">
				<label for="telefone">Telefone: </label> <input type="text"
					class="form-control" id="telefone" name="telefone"
					value='<%=telefone%>'>
			</div>

		</div>

		<input type="hidden" name="acao" value="1">
		<button type="button" id="btnAlterarDados" class="btn btn-light"
			style="background-color: lightblue; margin-top: 30px; margin-bottom: 10px;"
			onclick="this.form.submit();">Alterar</button>
	</form>
</div>


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

